#!/bin/bash

GPL=`ls *.gnuplot`

for GP in $GPL ; do
    echo $GP
    ./myreplace.py $GP
done
