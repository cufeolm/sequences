#!/bin/bash
#read file
#$(cat /dev/null > dut.f)
cat dut.f | while read line ;do
#firstletters=$( set -f; printf "%c" $line )
#echo "$line" >> hhhh.txt
$(printf "./processor/" >> dut.f)
$(printf "$line\n" >> dut.f)
done
