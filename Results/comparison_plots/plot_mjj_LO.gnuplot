reset

set lmargin 10
set rmargin 0

set terminal postscript portrait enhanced mono dashed lw 1.0 "Helvetica" 14
set terminal pdf font "Helvetica,12" enhanced dashed size 8 cm, 12 cm
#set size ratio 0.75
set key font ",11"
set key samplen "1.1"
set output "mjj_LO.pdf"
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
PHANTOM_fact=1e-3 #numbers are in fb/GeV
stats '../WHIZARD/LO/hist_invariantMassOfTwoHardestJets.dat' every ::0 using 5 nooutput
n_entries_WHIZARD = int(STATS_sum)
WHIZARD_fact=1e-3/n_entries_WHIZARD


set label "e^+mu^+{/Symbol nn}jj production at the LHC, 13 TeV" font ",12" at graph 0.03, graph 0.94
set label "MonteCarlo comparison, LO fixed order" font ",10" at graph 0.03, graph 0.88
set xrange [0:4000]
set yrange [1e-6:1e-3]
set logscale y
set origin 0.00, 0.5
set size 0.9, 0.4
set bmargin 0
set tmargin 0
set xtics 500 nomirror
set ytics 10
#set ytics 100
set mxtics 10
set mytics 10
set ylabel "{/Symbol s} per bin [pb]"
#set xtics nomirror
set format y "10^{%T}"

set format x ''
set key at graph 0.45, graph 0.55 noautotitles spacing 2.5

plot \
"../VBFNLO/LO/hist.mjj.dat" u (($1+$2)/2):($7*VBFNLO_fact*($2-$1)) ls 1 t 'VBFNLO',\
"../MG5_aMC/LO/M_j1_j2_LO.dat" u (($1+$2)/2):($3) ls 2 t 'MG5\_aMC',\
"../POWHEG/LO/M_j1j2tag_-_VBF_CUTS_index___3.dat" u (($1+$2)/2):($3*POWHEG_fact*($2-$1)) ls 3 t 'POWHEG',\
"../Recola/LO/histogram_invariant_mass_mjj12_born.dat" u (($2+$3)/2):($4*RECOLA_fact*($3-$2)) ls 4 t 'MoCaNLO+Recola',\
"../BONSAY/LO/ew-lo.mjj" u 1:(BONSAY_fact*$2*100) ls 6 t 'BONSAY',\
"../WHIZARD/LO/hist_invariantMassOfTwoHardestJets.dat" using 1:($2*WHIZARD_fact) ls 10 title 'WHIZARD',\
"../PHANTOM/LO/EW6/mjj.dat" using (($1+$2)/2):($3*PHANTOM_fact*($2-$1)) ls 8 title 'PHANTOM',\


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
set xlabel 'M(j_1j_2) [GeV]'

set ylabel 'Ratio /MoCaNLO+Recola' offset 1

plot \
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../VBFNLO/LO/hist.mjj.dat" u (($2+$3)/2):($25*VBFNLO_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 1 t 'VBFNLO',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../MG5_aMC/LO/M_j1_j2_LO.dat" u (($2+$3)/2):($21)/($4*RECOLA_fact*($3-$2)) ls 2 t 'MG5\_aMC',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../POWHEG/LO/M_j1j2tag_-_VBF_CUTS_index___3.dat" u (($2+$3)/2):($21*POWHEG_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 3 t 'POWHEG',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../Recola/LO/histogram_invariant_mass_mjj12_born.dat" u (($2+$3)/2):($22*RECOLA_fact*($3-$2)/($4*RECOLA_fact*($3-$2))) ls 4 t 'MoCaNLO+Recola',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../BONSAY/LO/ew-lo.mjj" u (($2+$3)/2):(BONSAY_fact*$20*100/($4*RECOLA_fact*($3-$2))) ls 6 t 'BONSAY',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../WHIZARD/LO/hist_invariantMassOfTwoHardestJets.dat" using 19:(($20*WHIZARD_fact)/($4*RECOLA_fact*($3-$2))) ls 10 title 'WHIZARD',\
"<paste ../Recola/LO/histogram_invariant_mass_mjj12_born.dat ../PHANTOM/LO/EW6/mjj.dat" using (($2+$3)/2):(($21*PHANTOM_fact*($3-$2))/($4*RECOLA_fact*($3-$2))) ls 8 title 'PHANTOM',\

unset multiplot

!open "mjj_LO.pdf"
