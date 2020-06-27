#!/bin/bash

echo -n "Enter number : "
read n

d=0
inp=$n
rev=""

while [ $n -gt 0 ]
do
    d=$(( $n % 10 ))
    n=$(( $n / 10 ))
    rev=$( echo ${rev}${d} )
done

if [ $inp -eq $rev ];
then
  echo "Number is palindrome"
else
  echo "Number is NOT palindrome"
fi
