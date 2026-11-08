#!/usr/bin/env python3
# Runs a real vim in a pseudo-terminal, sends keys, and prints what vim's screen shows.
# usage: vimdrive.py FILE  < script ; script lines: "K <keys>" (\e=Esc \r=Enter), "S <label>" (print screen)
import os, pty, sys, time, select, struct, fcntl, termios, pyte
ROWS, COLS = 12, 70
scr = pyte.Screen(COLS, ROWS); st = pyte.ByteStream(scr)
pid, fd = pty.fork()
if pid == 0:
    os.environ['TERM'] = 'xterm-256color'; os.execvp('vim', ['vim', '-u', 'NONE', '-N', sys.argv[1]])
fcntl.ioctl(fd, termios.TIOCSWINSZ, struct.pack('HHHH', ROWS, COLS, 0, 0))
def pump(t=0.8):
    end = time.time() + t
    while time.time() < end:
        r, _, _ = select.select([fd], [], [], 0.1)
        if r:
            try: d = os.read(fd, 65536)
            except OSError: return
            if not d: return
            st.feed(d)
pump(1.2)
for ln in sys.stdin.read().split('\n'):
    if not ln.strip(): continue
    op, _, arg = ln.partition(' ')
    if op == 'K':
        os.write(fd, arg.encode().decode('unicode_escape').encode()); pump()
    elif op == 'S':
        print('--- ' + arg); [print(l.rstrip()) for l in scr.display]; print('---')
try: os.waitpid(pid, os.WNOHANG)
except Exception: pass
