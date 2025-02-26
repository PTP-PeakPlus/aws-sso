#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <account number>"
    exit 1
fi

# The main code
echo "Account: $1";

output=$(python3 set-profile.py)

echo "Outpute: $output";
