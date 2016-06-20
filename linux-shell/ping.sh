#!/bin/bash

echo "Usage: ping.sh [host]"
echo "Example: ping.sh 127.0.0.1"

if ["$1" == '']
then

echo 'No hosts'

else
for x in `seq 1 254`; do
ping -c 1 $1.$x | cut -d " " -f 4
done
fi
