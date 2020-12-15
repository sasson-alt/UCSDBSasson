#!/bin/bash

files=(
    '/etc/shadow' 
    '/etc/passwd' 
    '/etc/hosts'
)

echo -e "\nThe permissions for sensitive /etc files: \n"
for file in ${files[@]};
do 
        ls -l $file >> $output
        echo "Permissions printed to $output"
done
