#!/bin/bash
GPL=`ls plot_*.gnuplot`


for GP in $GPL ; do
    gnuplot $GP
done
