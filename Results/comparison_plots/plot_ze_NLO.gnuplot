reset

load 'MinMax.gnuplot'

set lmargin 10
set rmargin 0

set terminal postscript portrait enhanced mono dashed lw 1.0 "Helvetica" 14
set terminal pdf font "Helvetica,12" enhanced dashed size 8 cm, 12 cm
#set size ratio 0.75
set key font ",11"
set key samplen "1.1"
set output "ze_NLO.pdf"
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

binwidth=0.05
MADGRAPH_fact=1e+3/binwidth
VBFNLO_fact=1/binwidth #numbers are in fb/GeV
POWHEG_fact=1/binwidth #numbers are in fb/GeV
RECOLA_fact=1/binwidth #numbers are in fb/GeV
BONSAY_fact=1/binwidth #numbers are in fb/GeV


set label "NLO" font ",10" at graph 0.03, graph 0.94
set xrange [0:1.5]
set yrange [2e-4:10]
set logscale y
set origin 0.00, 0.5
set size 0.9, 0.4
set bmargin 0
set tmargin 0
set xtics 0.2 nomirror
set ytics 10
#set ytics 100
set mxtics 2
set mytics 10
set ylabel "d{/Symbol s}/d z_{e^+} [fb]"
#set xtics nomirror
set format y "10^{%T}"

set format x ''
set key at graph 0.49, graph 0.55 noautotitles spacing 2.4

plot \
"../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u 2:((max($4,$10,$16,$22,$28,$34,$40))*RECOLA_fact*($3-$2)) w fillsteps fs solid 0.3 ls 4 notitle,\
"../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u ($2+0.001):(min($4,$10,$16,$22,$28,$34,$40)*RECOLA_fact*($3-$2)) w fillsteps fs solid 1 lw 4 lc rgb 'white' notitle,\
"../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u ($2-0.001):(min($4,$10,$16,$22,$28,$34,$40)*RECOLA_fact*($3-$2)) w fillsteps fs solid 1 lw 4 lc rgb 'white' notitle,\
"../BONSAY/NLO/ew-nlo.ze" u 1:(BONSAY_fact*$2*0.05) ls 6 t 'BONSAY',\
"../MG5_aMC/NLO/z_el_NLO.dat" u (($1+$2)/2):($3*MADGRAPH_fact) ls 2 t 'MG5\_aMC',\
"../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u (($2+$3)/2):($4*RECOLA_fact*($3-$2)) ls 4 t 'MoCaNLO+Recola',\
"../POWHEG/NLO/zstar_-electron-_VBF_CUTS_index__12.dat" u (($1+$2)/2):($3*POWHEG_fact*($2-$1)) ls 3 t 'POWHEG',\
"../VBFNLO/NLO/hist.ze.dat" u (($1+$2)/2):($7*VBFNLO_fact*($2-$1)) ls 1 t 'VBFNLO',\

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
set xlabel 'z_{e^+}'

set ylabel 'Ratio /MoCaNLO+Recola' offset 1

plot \
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u 2:((max($4,$10,$16,$22,$28,$34,$40))*RECOLA_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) w fillsteps fs solid 0.3 ls 4 notitle,\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u ($2+0.001):((min($4,$10,$16,$22,$28,$34,$40))*RECOLA_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) w fillsteps fs solid 1 lw 4 lc rgb 'white' notitle,\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u ($2-0.001):((min($4,$10,$16,$22,$28,$34,$40))*RECOLA_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) w fillsteps fs solid 1 lw 4 lc rgb 'white' notitle,\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../BONSAY/NLO/ew-nlo.ze" u (($2+$3)/2):(BONSAY_fact*$44*0.05/($4*RECOLA_fact*($3-$2))) ls 6 t 'BONSAY',\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../MG5_aMC/NLO/z_el_NLO.dat" u (($2+$3)/2):($45*MADGRAPH_fact)/($4*RECOLA_fact*($3-$2)) ls 2 t 'MG5\_aMC',\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat" u (($2+$3)/2):($46*RECOLA_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 4 t 'MoCaNLO+Recola',\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../POWHEG/NLO/zstar_-electron-_VBF_CUTS_index__12.dat" u (($2+$3)/2):($45*POWHEG_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 3 t 'POWHEG',\
"<paste ../Recola/NLO/histogram_zeppenfeld_zep_nlo.dat ../VBFNLO/NLO/hist.ze.dat" u (($2+$3)/2):($49*VBFNLO_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 1 t 'VBFNLO',\




unset multiplot

!open "ze_NLO.pdf"
