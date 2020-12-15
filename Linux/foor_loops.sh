#!/bin/bash

states=('California' 'Arizona' 'Texas' 'Nevada' 'Pennsylvania')

for state in ${states[@]};
do

    if [ $state == 'California' ]
    then
        echo "California is the best!"
    else
        echo "I'm not a fan of California."
    fi
done
