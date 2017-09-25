#!/bin/bash
GPL=`ls plot_*LO.gnuplot`


for GP in $GPL ; do
    gnuplot $GP
done
