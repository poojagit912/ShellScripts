#!/bin/bash
####Pre-req
####Create a filename as FolkStory in folder you are executing this script

filename="FolkStory"

#### Delete all blank lines
awk 'NF > 0' "$filename" > "Folk Story2"

#### Read each line into an array and index each line with a line number
fileItemString=$(cat -n "Folk Story2" |tr "\n" " ")
fileItemArray=($fileItemString)
echo "File array is ${fileItemArray[*]}"

#### Find “and” in each line, print all the line numbers where ”and” is found
findWords=`awk '/and/{print NR}' "Folk Story2"`
linenumbers=`echo $findWords | sed 's/ /,/g'`

#### The total number of “and”s in file
wordCount=`grep -o -i and "Folk Story2" | wc -l`

echo "the word “and” was found in line $linenumbers, a total of $wordCount times"

#Scramble every 3rd word in each line
#rev(){
#       echo $value | awk
#               '{ for(i = length; i!=0; i--)
#               x = x substr($0, i, 1);
#               }END
#               {print x}'
#       }
#awk '{$3=rev $3; print > "Folk Story2"}' "Folk Story2"

#Insert “New Paragraph begins here…” at the end of every 20th line in a file
sed -e '20s/$/“New Paragraph begins here…”/' "Folk Story2"

#At the end of the original “Folk Story” file, print “Here’s the modified content…” and append all the content from “Folk Story 2”
echo “Here’s the modified content…” >> $filename
cat -n "Folk Story2" >> $filename

#Delete “Folk Story 2” file
rm "Folk Story2"
