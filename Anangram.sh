#!/bin/bash

set -x

i=0
for letter in {A..Z}
do
alphabet[$i]="$letter"
((i++))
done


read_word(){
local array=()
local i=0
for digits in {0..25}
do
array[$i]=0
((i++))
done
local sentence="$1"
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
done < <(echo "${sentence^^}")
echo "${array[@]}"
}
 
equal_array(){
if [ "$1" = "$2" ]
then echo "anagrams"
else echo " not anagrams"
fi
}
 
read -p "Enter first word: " word1
read -p "Enter second word: " word2

word1=($(read_word "$word1"))
word2=($(read_word "$word2"))

equal_array "${word1[*]}" "${word2[*]}"

exit
