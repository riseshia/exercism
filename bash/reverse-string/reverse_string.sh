#!/bin/bash

string=$*
length=${#string}

for((i=$length-1;i>=0;i--));
do
  rev="$rev${string:$i:1}";
done

echo $rev
