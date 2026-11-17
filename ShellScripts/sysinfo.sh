#!/bin/bash
# Author: Navya
echo "=========================================="
echo "Name: Navya | Roll No: 2601201013 | Date: $(date)"
echo "=========================================="
echo "CPU Model: $(sysctl -n machdep.cpu.brand_string)"
echo "CPU Cores: $(sysctl -n hw.ncpu)"
total=$(sysctl -n hw.memsize | awk '{printf "%.1f GB", $1/1073741824}')
used=$(vm_stat | awk '/page size of/ {ps=$8} /Pages active/ {a=$3} /Pages wired/ {w=$4} /occupied by compressor/ {c=$5} END {printf "%.1f GB", (a+w+c)*ps/1073741824}')
echo "Memory: Total $total, Used $used"
echo "Top 3 processes by CPU:"
ps aux | sort -nrk 3,3 | head -3 | awk '{print "  " $3 "%  " $11}'
echo "Report generated successfully."
