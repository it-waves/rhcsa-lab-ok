#!/usr/bin/env python3
"""Drive the VM's serial console: edit GRUB, break into initramfs (rd.break), reset root password,
then boot rescue.target. Prints real transcripts. Run from repo root with the VM already up (ssh :2222)
and qemu started with -serial unix:/tmp/ser.sock,server=on,wait=off"""
import socket, subprocess, threading, time, re, sys
import pyte
SOCK = '/tmp/ser.sock'
SSH = ['ssh', '-i', 'lab/key', '-o', 'StrictHostKeyChecking=no', '-o', 'UserKnownHostsFile=/dev/null', '-o', 'LogLevel=ERROR', '-o', 'ConnectTimeout=5', '-p', '2222', 'student@127.0.0.1']
PW = 'RedHat-Lab-2026'
s = socket.socket(socket.AF_UNIX); s.connect(SOCK); s.settimeout(0.2)
raw = bytearray(); lock = threading.Lock()
screen = pyte.Screen(100, 30); stream = pyte.ByteStream(screen)
def reader():
    while True:
        try: d = s.recv(4096)
        except socket.timeout: continue
        except Exception: return
        if not d: time.sleep(0.1); continue
        with lock: raw.extend(d); stream.feed(d)
threading.Thread(target=reader, daemon=True).start()
def send(t, delay=0.05):
    for ch in t:
        s.send(ch.encode() if isinstance(ch, str) else ch); time.sleep(delay)
def disp():
    with lock: return [l.rstrip() for l in screen.display]
def screen_text():
    d = disp()
    while d and not d[-1]: d.pop()
    while d and not d[0]: d.pop(0)
    return '\n'.join(d)
def mark(): 
    with lock: return len(raw)
def since(m):
    with lock: b = bytes(raw[m:])
    t = b.decode('utf-8', 'replace')
    t = re.sub(r'\x1b\[[0-9;?]*[A-Za-z]', '', t); t = re.sub(r'\x1b[()][A-Z0-9]', '', t); t = t.replace('\r\n', '\n').replace('\r', '')
    return t
def wait(pat, timeout, m=None, on_screen=False):
    end = time.time() + timeout
    while time.time() < end:
        txt = screen_text() if on_screen else since(m if m is not None else 0)
        if re.search(pat, txt): return True
        time.sleep(0.3)
    return False
def banner(t): print('\n##### ' + t, flush=True)
def ssh(cmd):
    return subprocess.run(SSH + [cmd], capture_output=True, text=True, timeout=120)
def ssh_wait(n=180):
    for _ in range(n):
        try:
            if ssh('true').returncode == 0: return True
        except Exception: pass
        time.sleep(5)
    return False

def grub_edit(extra, label):
    """reboot, catch the GRUB menu, edit the entry, append `extra`, boot."""
    m = mark()
    subprocess.Popen(SSH + ['sudo systemctl reboot'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
    end = time.time() + 150; seen = False; t0 = time.time(); last = 0
    while time.time() < end:
        send('\x1b', 0.02)
        if time.time() - last > 15:
            last = time.time(); print('[diag] %ds raw=%d bytes; tail: %r' % (last - t0, len(raw), since(m)[-160:]), flush=True)
        txt = screen_text()
        if re.search(r'GNU GRUB|Rocky Linux \(', txt) and 'Use the' in txt: seen = True; break
        time.sleep(0.25)
    banner(label + ' / GRUB MENU'); print(screen_text(), flush=True)
    if not seen: print('!! no GRUB menu'); return False
    send('e'); time.sleep(1.5)
    banner(label + ' / GRUB EDITOR (before)'); print(screen_text(), flush=True)
    rows = disp()
    li = [i for i, l in enumerate(rows) if l.lstrip().startswith('linux')]
    if not li: print('!! no linux line'); return False
    # find first buffer row: first row after a blank/box top: use first non-empty row that starts a command
    first = next(i for i, l in enumerate(rows) if l.strip() and not l.startswith('Minimal') and 'GNU GRUB' not in l and 'Press' not in l and 'ESC' not in l)
    downs = li[0] - first
    print('first row', first, 'linux row', li[0], 'downs', downs, flush=True)
    for _ in range(downs): send('\x1b[B', 0.15)
    send('\x05', 0.2); time.sleep(0.5)
    send(' ' + extra, 0.06); time.sleep(1.0)
    banner(label + ' / GRUB EDITOR (after)'); print(screen_text(), flush=True)
    return True

print('waiting for ssh'); assert ssh_wait()
print(ssh('grep -i grub /etc/default/grub; uptime -p; cat /proc/cmdline').stdout, flush=True)
ssh('sudo systemctl is-system-running --wait')
# ---------- A: rd.break, reset root password ----------
if grub_edit('rd.break', 'A'):
    m = mark(); send('\x18')
    ok = wait(r'switch_root:/#', 240, m)
    banner('A / after Ctrl-X: kernel and initramfs output (tail)'); print('\n'.join(since(m).split('\n')[-25:]), flush=True)
    if ok:
        m = mark()
        def cmd(c, w=1.5, pat=None):
            global m
            m = mark(); send(c + '\n', 0.04)
            if pat: wait(pat, 40, m)
            else: time.sleep(w)
            return since(m)
        out = []
        out.append(cmd('mount -o remount,rw /sysroot'))
        out.append(cmd('chroot /sysroot', pat=r'#'))
        out.append(cmd('passwd root', pat=r'New password'))
        out.append(cmd(PW, pat=r'Retype new password'))
        out.append(cmd(PW, pat=r'(successfully|updated|error|BAD)', ))
        time.sleep(2)
        out.append(cmd('touch /.autorelabel'))
        out.append(cmd('ls -l /.autorelabel'))
        out.append(cmd('exit'))
        banner('A / initramfs session transcript')
        print(''.join(out), flush=True)
        send('exit\n', 0.04)
    print('waiting for the relabel boot + ssh ...', flush=True)
    assert ssh_wait(240), 'VM did not come back'
    r = ssh('sudo passwd -S root; getenforce; ls -l /.autorelabel; sudo systemctl is-system-running --wait'); banner('A / after boot (ssh)'); print(r.stdout, r.stderr, flush=True)
# ---------- B: rescue.target ----------
if grub_edit('systemd.unit=rescue.target', 'B'):
    m = mark(); send('\x18')
    ok = wait(r'(?i)password for maintenance|Press Enter for maintenance|root password', 240, m)
    banner('B / rescue prompt'); print('\n'.join(since(m).split('\n')[-20:]), flush=True)
    if ok:
        m = mark(); send(PW + '\n', 0.04); wait(r'#\s*$', 30, m); time.sleep(2)
        out = []
        for c in ['systemctl is-active rescue.target', 'systemctl is-active multi-user.target', 'systemctl get-default', 'whoami']:
            m = mark(); send(c + '\n', 0.04); time.sleep(2.5); out.append(since(m))
        banner('B / rescue session transcript'); print(''.join(out), flush=True)
        m = mark(); send('systemctl default\n', 0.04); time.sleep(5)
    assert ssh_wait(240), 'VM did not come back after rescue'
    r = ssh('cat /proc/cmdline; systemctl is-active multi-user.target'); banner('B / after boot (ssh)'); print(r.stdout, flush=True)
