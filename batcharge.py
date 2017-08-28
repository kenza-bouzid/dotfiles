#!/usr/bin/env python2
# coding=UTF-8

"""
Based on http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity
"""

import sys
import math
import subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE)
output = p.communicate()[0]

o_max = [l for l in output.splitlines() if 'MaxCapacity' in l][0]
o_cur = [l for l in output.splitlines() if 'CurrentCapacity' in l][0]
connected = [l for l in output.splitlines() if 'ExternalConnected' in l][0].split()[-1] == 'Yes'

b_max = float(o_max.rpartition('=')[-1].strip())
b_cur = float(o_cur.rpartition('=')[-1].strip())

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output

total_slots, slots = 10, []
filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * u'▸'
empty = (total_slots - len(filled)) * u'▹'

out = (filled + empty).encode('utf-8')

color_red = '%{[31m%}'
color_green = '%{[32m%}'
color_yellow = '%{[33m%}'
color_blue = '%{[34m%}'
color_reset = '%{[00m%}'

if connected:
    color_out = color_blue
elif len(filled) > 6:
    color_out = color_green
elif len(filled) > 3:
    color_out = color_yellow
else:
    color_out = color_red

out = color_out + out + color_reset
sys.stdout.write(out)
