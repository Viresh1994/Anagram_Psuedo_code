#!/bin/bash

#set -x

i=0
for letter in {A..Z}
do
alphabet[$i]="$letter"
((i++))
done

i=0
for digits in {0..25}
do
array[$i]=0
((i++))
done

read -p "Enter first word: " word1
read -p "Enter second word: " word2

while read -n 1 letter
do

if [ -z "$letter" ]
then continue
fi
for b in "${!alphabet[@]}"
do
if [ "$letter" = "${alphabet[$b]}" ]
then
((array[$b]+=1))
break
fi
done
done < <(echo "${word1^^}")

while read -n 1 letter
do
if [ -z "$letter" ]
then continue
fi
for b in "${!alphabet[@]}"
do
if [ "$letter" = "${alphabet[$b]}" ]
then
((array[$b]-=1))
break
fi
done
done < <(echo "${word2^^}")

echo -n "Words are "
for element in "${array[@]}"
do
if [ "$element" -ne 0 ]
then echo -n "not "
fi
done

echo "anagrams"

echo
exit
