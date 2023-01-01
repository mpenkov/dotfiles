#!/usr/bin/env python
"""Is anything inhibiting sleep?  If yes, show an icon for i3blocks."""

import io
import subprocess
stdout = subprocess.check_output('systemd-inhibit --list'.split())
buf = io.StringIO(stdout.decode())
header = buf.readline()
columns = 'WHO UID USER PID COMM WHAT WHY MODE'.split()
start = {c: header.find(c) for c in columns}
end = {c: start[columns[i + 1]] for i, c in enumerate(columns) if c != 'MODE'}
end['MODE'] = -1
for line in buf:
    if line == '\n':
        break
    record = {c: line[start[c]:end[c]].rstrip() for c in columns}
    if record['WHAT'] == 'sleep' and record['MODE'] == 'block':
        print('🫖')
        break
