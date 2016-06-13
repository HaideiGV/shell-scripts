#!/bin/bash

#comment
echo "Please, enter you target:"

read input

if [$input == "www.twitter.com"]
then
	echo "Cannot Ping"
else
	ping -c3 $input
fi
