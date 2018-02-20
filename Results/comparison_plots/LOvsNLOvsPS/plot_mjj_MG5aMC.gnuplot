reset

set lmargin 10
set rmargin 0

set terminal postscript portrait enhanced mono dashed lw 1.0 "Helvetica" 14
set terminal pdf font "Helvetica,12" enhanced dashed size 8 cm, 12 cm
#set size ratio 0.75
set key font ",11"
set key samplen "1.1"
set output "mjj_mg5amc.pdf"
set style line 100 dt 2 lc rgb "black" lw 1

set style line 1 dt 1 lc rgb "black"lw 1.8 ps 0.35
set style line 2 dt 1 lc rgb "red"lw 1.8 pt 7 ps 0.35
set style line 3 dt 1 lc rgb "#00a000" pt 13 ps 0.7 lw 1.8
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
set key at graph 1, graph 0.8 noautotitles spacing 2.4

plot \
"../../MG5_aMC/NLO/M_j1_j2_NLO.dat" u (($1+$2)/2):($3) w points ls 1 t 'NLO',\
"../../MG5_aMC/LO/M_j1_j2_LO.dat" u (($1+$2)/2):($3) w points ls 2 t 'LO',\
"../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat" u (($1+$2)/2):($3/1000.) ls 3 t 'NLO+PY8',\
"../../../parton-shower/MG5_aMC/run_HWPP_5M_NLOPS//m_jj.dat" u (($1+$2)/2):($3/1000.) ls 13 t 'NLO+HWPP',\
"../../../parton-shower/MG5_aMC/run_PY8_1M_LOPS//m_jj.dat" u (($1+$2)/2):($3/1000.) ls 4 t 'LO+PY8',\

unset label
set yrange [0.7:1.3]
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

set ylabel 'Ratio /NLO+PY8' offset 1

plot \
1 ls 3,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../MG5_aMC/NLO/M_j1_j2_NLO.dat"  u (($1+$2)/2):($10/$3*1000.) ls 1,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../MG5_aMC/LO/M_j1_j2_LO.dat"  u (($1+$2)/2):($10/$3*1000.) ls 2,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../MG5_aMC/NLO/M_j1_j2_NLO.dat"  u (($1+$2)/2):($10/$3*1000.) w points ls 1,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../MG5_aMC/LO/M_j1_j2_LO.dat"  u (($1+$2)/2):($10/$3*1000.) w points ls 2,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../../parton-shower/MG5_aMC/run_HWPP_5M_NLOPS//m_jj.dat"  u (($1+$2)/2):($10/$3) ls 13,\
"<paste ../../../parton-shower/MG5_aMC/run_PY8_10M_NLOPS//m_jj.dat ../../../parton-shower/MG5_aMC/run_PY8_1M_LOPS//m_jj.dat"  u (($1+$2)/2):($10/$3) ls 4,\




unset multiplot

!open "mjj_mg5amc.pdf"
