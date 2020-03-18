#!/bin/bash
#read file
#cat excel.txt | while read line ;do
#firstletters=$( set -f; printf "%c" $line )
#echo "$line" >> hhhh.txt        
#echo "$firstletters" >> hhhh.txt
#done
#echo "$(sed '/^[[:space:]]*$/d' hhh.txt )" >> hhh1.txt
#echo "$(sed '/^[[:space:]]*$/d' hhhh.txt)" >> hhhh1.txt
#echo "$(sed '/^[[:space:]]*$/d' excel.txt)" >> excel1.txt
$(cat /dev/null > hhh2.txt)
sed -e 's/^M//' hhh.txt  >> hhh2.txt
