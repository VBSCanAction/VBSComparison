reset

set lmargin 10
set rmargin 0

set terminal postscript portrait enhanced mono dashed lw 1.0 "Helvetica" 14
set terminal pdf font "Helvetica,12" enhanced dashed size 8 cm, 12 cm
#set size ratio 0.75
set key font ",11"
set key samplen "1.1"
set output "ptj1_LO.pdf"
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
stats '../WHIZARD/LO/hist_ptHardestJet.dat' every ::0 using 5 nooutput
n_entries_WHIZARD = int(STATS_sum)
WHIZARD_fact=1e-3/n_entries_WHIZARD

set label "e^+mu^+{/Symbol nn}jj production at the LHC, 13 TeV" font ",12" at graph 0.03, graph 0.94
set label "MonteCarlo comparison, LO fixed order" font ",10" at graph 0.03, graph 0.88
set xrange [0:1000]
set yrange [1e-7:1e-3]
set logscale y
set origin 0.00, 0.5
set size 0.9, 0.4
set bmargin 0
set tmargin 0
set xtics 200 nomirror
set ytics 10
#set ytics 100
set mxtics 10
set mytics 10
set ylabel "{/Symbol s} per bin [pb]"
#set xtics nomirror
set format y "10^{%T}"

set format x ''
set key at graph 1, graph 0.8 noautotitles spacing 2.4

plot \
"../VBFNLO/LO/hist.ptj1.dat" u (($1+$2)/2):($7*VBFNLO_fact*($2-$1)) ls 1 t 'VBFNLO',\
"../MG5_aMC/LO/Pt_j1_LO.dat" u (($1+$2)/2):($3) ls 2 t 'MG5\_aMC',\
"../POWHEG/LO/PT_jet_1-_VBF_CUTS_index___5.dat" u (($1+$2)/2):($3*POWHEG_fact*($2-$1)) ls 3 t 'POWHEG',\
"../Recola/LO/histogram_transverse_momentum_j1_born.dat" u (($1+$2)/2):($3*RECOLA_fact*($2-$1)) ls 4 t 'Recola',\
"../BONSAY/NLO/nlo0-9.vbscan_ptj1" u 1:(BONSAY_fact*$2*25) ls 6 t 'BONSAY',\
"../WHIZARD/LO/hist_ptHardestJet.dat" using 1:($2*WHIZARD_fact) ls 10 title 'WHIZARD',\


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
set xlabel 'P_T(j_1) [GeV]'

set ylabel 'Ratio /VBFNLO' offset 1

plot \
"<paste ../VBFNLO/LO/hist.ptj1.dat ../VBFNLO/LO/hist.ptj1.dat" u (($1+$2)/2):($15*VBFNLO_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) ls 1 t 'VBFNLO',\
"<paste ../VBFNLO/LO/hist.ptj1.dat ../MG5_aMC/LO/Pt_j1_LO.dat" u (($1+$2)/2):($11)/($7*VBFNLO_fact*($2-$1)) ls 2 t 'MG5\_aMC',\
"<paste ../VBFNLO/LO/hist.ptj1.dat ../POWHEG/LO/PT_jet_1-_VBF_CUTS_index___5.dat" u (($1+$2)/2):($11*POWHEG_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) ls 3 t 'POWHEG',\
"<paste ../VBFNLO/LO/hist.ptj1.dat ../Recola/LO/histogram_transverse_momentum_j1_born.dat" u (($1+$2)/2):($11*RECOLA_fact*($2-$1)/($7*VBFNLO_fact*($2-$1))) ls 4 t 'Recola',\
"<paste ../VBFNLO/LO/hist.ptj1.dat ../BONSAY/NLO/nlo0-9.vbscan_ptj1" u (($1+$2)/2):(BONSAY_fact*$10*25/($7*VBFNLO_fact*($2-$1))) ls 6 t 'BONSAY',\
"<paste ../VBFNLO/LO/hist.ptj1.dat ../WHIZARD/LO/hist_ptHardestJet.dat" using 9:(($10*WHIZARD_fact)/($7*VBFNLO_fact*($2-$1))) ls 10 title 'WHIZARD',\




unset multiplot

!open "ptj1_LO.pdf"
