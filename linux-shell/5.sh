#!/bin/bash

#comment
echo "Please, enter you target:"

read input

if [$input == "www.twitter.com"]
then
	echo "Cannot Ping"
elif [$input == "www.google.com"]
then
	echo "Why Google"
else
	ping -c3 $input
fi
