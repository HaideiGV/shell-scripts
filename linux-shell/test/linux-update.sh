#!/bin/bash

#Get the last file version from DB 
psql -d testdb -U haidei -c "select * from querylist;" > out.txt

#Read the filename
file=($(cat out.txt))

line3=(${file[2]})

#Parse the number of version
INPUT=$line3
SUBSTRING=$(echo "$INPUT"| grep -Eo "[[:digit:]]+")

#Get order list of sql scripts
file_list=($(
	for i in *createtable.sql;
	do
		echo "$i"
	done|sort
))


#Check If the number from BD is less than files version then execute this files
# and add update version number 
last_file=
for i in ${file_list[@]};
do
	loc_file=$( echo "$i"|grep -Eo "[[:digit:]]+");
	if [ "$loc_file" > "$SUBSTRING" ];
	then
		psql -d testdb -U haidei -a -f "$i"
		last_file="$loc_file".createtable.sql
	else
		echo "All queries are updated!"
	fi
done

psql -d testdb -U haidei -c "update querylist set queryname= '"$last_file"'"

