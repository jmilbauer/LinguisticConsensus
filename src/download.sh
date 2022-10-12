#!/bin/bash

years=(2015 2016)
months=('01' '02' '03' '04' '05' '06' '07' '08' '09' '10' '11' '12')
for year in ${years[@]}; do
    for month in ${months[@]}; do
        wget https://files.pushshift.io/reddit/comments/RC_${year}-${month}.zst -P $1 &
    done
    wait
done