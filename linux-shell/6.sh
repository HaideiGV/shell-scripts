#!/bin/bash

#comment
echo -n "Please, enter you target:"
read input

#Check if user provide twitter
if [ $input == "www.twitter.com" ]
then
	echo "Cannot Ping"
elif [ $input == "www.google.com" ]
then
	echo "Why Google"
else
	ping -c3 $input
fi
