#!/usr/bin/env python3
# coding=UTF-8

"""
Based on http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/#my-right-prompt-battery-capacity
"""

import sys
import math
import subprocess

p = subprocess.Popen(["ioreg", "-rc", "AppleSmartBattery"], stdout=subprocess.PIPE, encoding='utf8')
output = p.communicate()[0]
# print(type(output))

for line in output.splitlines():
    if 'MaxCapacity' in line:
        b_max = float(line.rpartition('=')[-1].strip())
    elif 'CurrentCapacity' in line:
        b_cur = float(line.rpartition('=')[-1].strip())
    elif 'ExternalConnected' in line:
        connected = line.split()[-1] == 'Yes'

charge = b_cur / b_max
charge_threshold = int(math.ceil(10 * charge))

# Output
filled_connected = u'▸'
empty_connected = u'▹'
filled_disconnected = u'◂'
empty_disconnected = u'◃'

total_slots, slots = 10, []
if connected:
    filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * filled_connected
    empty = (total_slots - len(filled)) * empty_connected
else:
    filled = int(math.ceil(charge_threshold * (total_slots / 10.0))) * filled_disconnected
    empty = (total_slots - len(filled)) * empty_disconnected

out = (filled + empty)

color_red = '%{[31m%}'
color_green = '%{[32m%}'
color_yellow = '%{[33m%}'
color_blue = '%{[34m%}'  # not used
color_reset = '%{[00m%}'

if len(filled) > 6:
    color_out = color_green
elif len(filled) > 3:
    color_out = color_yellow
else:
    color_out = color_red

out = color_out + out + color_reset
sys.stdout.write(out)
