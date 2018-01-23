reset

set lmargin 10
set rmargin 0

set terminal postscript portrait enhanced mono dashed lw 1.0 "Helvetica" 14
set terminal pdf font "Helvetica,12" enhanced dashed size 8 cm, 12 cm
#set size ratio 0.75
set key font ",11"
set key samplen "1.1"
set output "yj3_NLO.pdf"
set style line 100 dt 2 lc rgb "black" lw 1

set style line 1 dt 1 lc rgb "black"lw 1.8
set style line 2 dt 1 lc rgb "red"lw 1.8 pt 7 ps 0.5
set style line 3 dt 1 lc rgb "#00a000" pt 13 ps 0.7lw 1.8
set style line 4 dt 1 lc rgb "blue"lw 1.8
set style line 5 dt 1 lc rgb "dark-orange"lw 1.8
set style line 6 dt 1 lc rgb "dark-magenta"lw 1.8

#set style line 11 dt 2 lc rgb "black"lw 1.8
#set style line 12 dt 2 lc rgb "#530FAD"lw 1.8
#set style line 13 dt 2 lc rgb "#FD0006"lw 1.8
#set style line 14 dt 2 lc rgb "#01939A"lw 1.8

set style line 11 dt 2 lc rgb "black"lw 1.8 ps 0.3
set style line 12 dt 2 lc rgb "red"lw 1.8 ps 0.3
set style line 13 dt 2 lc rgb "forest-green"lw 1.8 ps 0.3
set style line 14 dt 2 lc rgb "blue"lw 1.8 ps 0.3
set style line 15 dt 2 lc rgb "dark-orange"lw 1.8 ps 0.3
set style line 16 dt 2 lc rgb "dark-magenta"lw 1.8 ps 0.3

set style line 21 dt 5 lc rgb "black"lw 1.8
set style line 22 dt 5 lc rgb "red"lw 1.8
set style line 23 dt 5 lc rgb "forest-green"lw 1.8
set style line 24 dt 5 lc rgb "blue"lw 1.8
set style line 25 dt 5 lc rgb "dark-orange"lw 1.8
set style line 26 dt 5 lc rgb "dark-magenta"lw 1.8

set style data histeps



set multiplot
set tics front

VBFNLO_fact=1e-3 #numbers are in fb/GeV
POWHEG_fact=1e-3 #numbers are in fb/GeV
RECOLA_fact=1e-3 #numbers are in fb/GeV
BONSAY_fact=1e-3 #numbers are in fb/GeV


set label "e^+mu^+{/Symbol nn}jj production at the LHC, 13 TeV" font ",12" at graph 0.03, graph 0.94
set label "MonteCarlo comparison, NLO fixed order" font ",10" at graph 0.03, graph 0.88
set xrange [-5:5]
set yrange [1e-6:1e-3]
set logscale y
set origin 0.00, 0.5
set size 0.9, 0.4
set bmargin 0
set tmargin 0
set xtics 1 nomirror
set ytics 10
#set ytics 100
set mxtics 2
set mytics 10
set ylabel "{/Symbol s} per bin [pb]"
#set xtics nomirror
set format y "10^{%T}"

set format x ''
set key at graph 0.7, graph 0.3 noautotitles spacing 2.4

plot \
"../../VBFNLO/NLO/hist.yj3.dat" u (($1+$2)/2):($7*VBFNLO_fact*($2-$1)) ls 1 t 'VBFNLO',\
"../../MG5_aMC/NLO/y_j3_NLO.dat" u (($1+$2)/2):($3) ls 2 t 'MG5\_aMC',\
"../../POWHEG/NLO/Y_jet_3-_VBF_CUTS_index__10.dat" u (($1+$2)/2):($3*POWHEG_fact*($2-$1)) ls 3 t 'POWHEG',\
"../../Recola/NLO/histogram_rapidity_j3_nlo.dat" u (($1+$2)/2):($3*RECOLA_fact*($2-$1)) ls 4 t 'Recola',\
"../../BONSAY/NLO/ew-nlo.yj3" u 1:(BONSAY_fact*$2*0.5) ls 6 t 'BONSAY',\



unset label
set yrange [0.85:1.15]
unset logscale y
set origin 0.00, 0.3
set size 0.9, 0.2
set bmargin 0
set tmargin 0
set ytics 0.1
set mytics 10
unset format x
unset format y
unset key
set xlabel 'y(j_3)'

set ylabel 'Ratio /VBFNLO' offset 1

plot \
"<paste ../../VBFNLO/NLO/hist.yj3.dat ../../VBFNLO/NLO/hist.yj3.dat" u (($1+$2)/2):(($15+$16)*VBFNLO_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))):(($15-$16)*VBFNLO_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) with filledcurves ls 1 t 'VBFNLO',\
"<paste ../../VBFNLO/NLO/hist.yj3.dat ../../MG5_aMC/NLO/y_j3_NLO.dat" u (($1+$2)/2):($11+$12)/($7*VBFNLO_fact*($2-$1)):($11-$12)/($7*VBFNLO_fact*($2-$1)) with filledcurves ls 2 t 'MG5\_aMC',\
"<paste ../../VBFNLO/NLO/hist.yj3.dat ../../POWHEG/NLO/Y_jet_3-_VBF_CUTS_index__10.dat" u (($1+$2)/2):(($11+$12)*POWHEG_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))):(($11-$12)*POWHEG_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) with filledcurves ls 3 t 'POWHEG',\
"<paste ../../VBFNLO/NLO/hist.yj3.dat ../../Recola/NLO/histogram_rapidity_j3_nlo.dat" u (($1+$2)/2):(($11+$12)*RECOLA_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))):(($11-$12)*RECOLA_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) with filledcurves ls 4 t 'Recola',\
"<paste ../../VBFNLO/NLO/hist.yj3.dat ../../BONSAY/NLO/ew-nlo.yj3" u (($1+$2)/2):(BONSAY_fact*($10+$11)*0.5/($7*VBFNLO_fact*($2-$1))):(BONSAY_fact*($10-$11)*0.5/($7*VBFNLO_fact*($2-$1))) with filledcurves ls 6 t 'BONSAY',\





unset multiplot

!open "yj3_NLO.pdf"