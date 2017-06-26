#!/bin/bash
GPL=`ls plot_*NLO.gnuplot`


for GP in $GPL ; do
    gnuplot $GP
done
