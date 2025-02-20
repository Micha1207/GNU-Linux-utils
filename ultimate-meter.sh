#!/bin/bash

# ultimate-meter.sh
# Get CPU and RAM usage
#
# Written by Michael Ł. (Micha1207) in GNU nano.
# 20 Feb 2025

memDataFile=/proc/meminfo
cpuDataFile=/proc/stat

# Function for gathering CPU data
cpuData(){
        cpu_line=$(head -n 1 $cpuDataFile)
        cpu_vals=($cpu_line)

        user=${cpu_vals[1]}
        nice=${cpu_vals[2]}
        system=${cpu_vals[3]}
        idle=${cpu_vals[4]}

        total=$((user + nice + system + idle))
        active=$((user + nice + system))
}

# RAM memory info
memInfo(){
    mem_tota=$(grep "MemTotal:" "$memDataFile" | awk '{print $2}')      # Total RAM memory amount
    mem_used=$(grep "Active:" "$memDataFile" | awk '{print $2}')        # Used RAM memory amount
    mem_free=$(grep "MemAvailable:" "$memDataFile" | awk '{print $2}')  # Available RAM memory amount
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

# Run memInfo function
memInfo

# Convert memory results from kB to GB
mem_tota_GB=$(echo "scale=2; $mem_tota / 1024 / 1024" | bc)
mem_used_GB=$(echo "scale=2; $mem_used / 1024 / 1024" | bc)
mem_free_GB=$(echo "scale=2; $mem_free / 1024 / 1024" | bc)

# Print all results
echo "CPU Usage: $cpu_usage%"
echo " "
echo "RAM Memory: "
echo "Total: $mem_tota_GB GB"
echo "Used:  $mem_used_GB GB"
echo "Free:  $mem_free_GB GB"
