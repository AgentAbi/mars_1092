#!/bin/bash
dir=$(pwd)
mkdir "$dir"/modified
for file in "$dir"/*
do
        filen=$(basename -- "$file")
        extension="${filen##*.}"
        fname="${filen%.*}"
        echo "$fname"
        if [ "$extension" = "txt" ];
        then
                cp "$filen" "$dir/modified/$fname".bak
        fi
done

