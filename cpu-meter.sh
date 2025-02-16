#!/bin/bash

# cpu-meter.sh
# Get CPU usage
#
# Written by Michael Ł. (Micha1207) in GNU nano.
# 16 Feb 2025

# Function for gathering CPU data
cpuData(){
        cpu_line=$(head -n 1 /proc/stat)
        cpu_vals=($cpu_line)

         user=${cpu_vals[1]}
        nice=${cpu_vals[2]}
        system=${cpu_vals[3]}
        idle=${cpu_vals[4]}

        total=$((user + nice + system + idle))
        active=$((user + nice + system))
}

# Main code

cpuData
active1=$active
total1=$total

sleep 1

cpuData
active2=$active
total2=$total

cpu_usage=$(( (100 * (active2 - active1)) / (total2 - total1) ))

echo "CPU Usage: $cpu_usage%"
