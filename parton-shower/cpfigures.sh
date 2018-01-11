#!/bin/bash

FIGS="jetsexclusive m_jj pT_j1 pT_j2 Deltay_jj y_j3"

for ORD in LOPS NLOPS; do
    for F in $FIGS; do
         echo $ORD $F
         cp rivet-$ORD/MC_VBSCAN_MCComparison/$F.pdf ../Draft/figures/$ORD/
    done
done
