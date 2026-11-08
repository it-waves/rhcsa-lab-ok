#!/usr/bin/env python3
# Runs a real pager/viewer (man, info) in a pseudo-terminal, sends keys, and prints what vim's screen shows.
# usage: pagedrive.py CMD [ARGS]  < script ; script lines: "K <keys>" (\e=Esc \r=Enter), "S <label>" (print screen)
import os, pty, sys, time, select, struct, fcntl, termios, pyte
ROWS, COLS = 14, 72
class Scr(pyte.Screen):
    def select_graphic_rendition(self, *a, **k):
        if k.get('private'): return
        super().select_graphic_rendition(*a)
scr = Scr(COLS, ROWS); st = pyte.ByteStream(scr)
pid, fd = pty.fork()
if pid == 0:
    os.environ['TERM'] = 'xterm-256color'; os.execvp(sys.argv[1], sys.argv[1:])
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
        os.write(fd, arg.replace('\\e','\\x1b').encode().decode('unicode_escape').encode()); pump(1.3 if '\\e' in arg else 0.8)
    elif op == 'S':
        print('--- ' + arg); [print(l.rstrip()) for l in scr.display]; print('---')
try: os.waitpid(pid, os.WNOHANG)
except Exception: pass
