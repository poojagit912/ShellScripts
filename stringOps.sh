#!/bin/bash

echo -n "Enter the String : "
read n

str=$n

STRLENGTH=`echo -n $str | wc -m`

echo "String lenght is $STRLENGTH"

STR_CHARS=`echo $str | grep -o .`

echo -e "String chars are \n$STR_CHARS"

perm() {
  items="$1"
  out="$2"
  [[ "$items" == "" ]] && echo "$out" && return
  for (( i=0; i<${#items}; i++ )) ; do
    ( perm "${items:0:i}${items:i+1}" "$out${items:i:1}" )
  done
  }

combinations=`perm $str`

finalString=`echo $combinations | sed 's/ /,/g'`

echo -e "All possible compinations are \n$finalString"
