#!/bin/bash

# mem-meter.sh
# RAM memory meter
#
# Written by Michael Ł. (Micha1207) in GNU Emacs
# 20 Feb 2025

memDataFile=/proc/meminfo # Change if needed

# Function to get Memory Info
memInfo(){
    mem_tota=$(grep "MemTotal:" "$memDataFile" | awk '{print $2}')      # Total RAM memory amount
    mem_used=$(grep "Active:" "$memDataFile" | awk '{print $2}')        # Used RAM memory amount
    mem_free=$(grep "MemAvailable:" "$memDataFile" | awk '{print $2}')  # Available RAM memory amount
}

# Call the function
memInfo

# Convert results
mem_tota_GB=$(echo "scale=2; $mem_tota / 1024 / 1024" | bc)
mem_used_GB=$(echo "scale=2; $mem_used / 1024 / 1024" | bc)
mem_free_GB=$(echo "scale=2; $mem_free / 1024 / 1024" | bc)

# Print results
echo "Total: $mem_tota_GB GB"
echo "Used:  $mem_used_GB GB"
echo "Free:  $mem_free_GB GB"
