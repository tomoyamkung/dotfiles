#!/bin/bash

branches=`git branch | grep -v -e"^\*" | tr -d ' '`

PS3="Select branch > "

echo 'Branch list:'
select var in ${branches}
do
    echo "git checkout ${var}"
    git checkout ${var}
    exit 0
done

