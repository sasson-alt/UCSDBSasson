#!/bin/bash

if [ $UID -ne 0 ]
then
    echo "Please do not run this script as root!"
    exit
fi

output=$HOME/research/sys_info.txt
ip=$(ip addr | grep inet | tail -2 | head -1)
suids=$(sudo find / -type f -perm /4000 2> /dev/null)

if [ ! -d$HOME/research ]
then
    mkdir $HOME/research
fi

if [ -f $output ]
then
    > $output
fi


echo "A Quick System Audit Script" >> $output
date >> $output
echo "" >> $output
echo "Machine Type Info:" >> $output
echo -e "$MACHTYPE \n" >> $output
echo -e "Uname info: $(uname -a) \n" >> $output
