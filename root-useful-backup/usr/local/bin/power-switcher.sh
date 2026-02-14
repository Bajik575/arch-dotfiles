#!/bin/bash
if grep -q 0 /sys/class/power_supply/ADP1/online; then
    cpupower frequency-set -g powersave
    cpupower set -b 10
else
	cpupower frequency-set -g schedutil
fi
