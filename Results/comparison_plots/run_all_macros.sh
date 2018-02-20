#!/bin/bash
GPL=`ls plot_*_LO.gnuplot`


for GP in $GPL ; do
    gnuplot $GP
done
