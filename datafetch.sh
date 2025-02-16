#!/bin/bash

# systemfetch.sh
# Get system information.
#
# Written by Michael Ł. (Micha1207) in GNU nano.
# 16 Feb 2025

# Get source files:
source /etc/os-release

# Defiene input data files & commands:
os_fullname=$(echo "$PRETTY_NAME")
os_version=$(echo "$VERSION")
os_codename=$(echo "$VERSION_CODENAME")
os=$(echo "$ID")
kernel=$(uname -r)
arch=$(uname -p)

# Main code:
echo "OS:       $os_fullname"
echo "Version:  $os_version"
echo "Codename: $os_codename"
echo "OS ID:    $os"
echo "Kernel:   $kernel"
echo "CPU Arch: $arch"
