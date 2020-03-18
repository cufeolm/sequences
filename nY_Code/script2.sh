#!/bin/bash
#read file
$(cat /dev/null > hhh.txt)
cat excel1.txt | while read line ;do
firstletters=$( set -f; printf "%c" $line )
#echo "$line" >> hhhh.txt
$(printf "$firstletters" >> hhh.txt)
$(printf " = 32'b11?????001001?????1?????????????,\n" >> hhh.txt)
done
vi hhh.txt
