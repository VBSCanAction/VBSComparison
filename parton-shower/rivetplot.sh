#! /bin/sh

rivet-mkhtml -o rivet-NLOPS \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatNLO-DipoleShower.yoda\
:"Title=VBFNLO 3+Herwig 7-Dipole"\
:"LineColor=blue"\
:"ErrorBands=1"\
:"ErrorBandColor=blue"\
:"RatioPlotErrorBandColor=blue"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatNLO-DefaultShower.yoda\
:"Title=VBFNLO 3+Herwig 7-QTilde"\
:"LineColor=cyan"\
:"ErrorBands=1"\
:"ErrorBandColor=cyan"\
:"RatioPlotErrorBandColor=cyan"\
:"ErrorBandOpacity=0.3"\
  Powheg/Powheg.yoda\
:"Title=Powheg+Pythia 8"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  Powheg/lhef.yoda\
:"Title=Powheg-no shower"\
:"LineColor=green"\
:"LineStyle=dashed"\
  MG5_aMC/run_HWPP_5M_NLOPS.yoda\
:"Title=MG5_aMC+Herwig 2.7.1"\
:"LineColor=magenta"\
:"ErrorBands=1"\
:"ErrorBandColor=magenta"\
:"RatioPlotErrorBandColor=magenta"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_10M_NLOPS.yoda\
:"Title=MG5_aMC+Pythia 8"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\


rivet-mkhtml -o rivet-LOPS \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatLO-DipoleShower.yoda\
:"Title=VBFNLO 3+Herwig 7"\
:"LineColor=blue"\
:"ErrorBands=1"\
:"ErrorBandColor=blue"\
:"RatioPlotErrorBandColor=blue"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_1M_LOPS.yoda\
:"Title=MG5_aMC+Pythia 8"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_HWPP_1M_LOPS.yoda\
:"Title=MG5_aMC+Herwig++ 2.7.1"\
:"LineColor=magenta"\
:"ErrorBands=1"\
:"ErrorBandColor=magenta"\
:"RatioPlotErrorBandColor=magenta"\
:"ErrorBandOpacity=0.3"\
  PHANTOM/plots_loose_cuts2/phantom_norm-scaled.yoda\
:"Title=PHANTOM+Pythia 8"\
:"LineColor=cyan"\
:"ErrorBands=1"\
:"ErrorBandColor=cyan"\
:"RatioPlotErrorBandColor=cyan"\
:"ErrorBandOpacity=0.3"\
  PHANTOM/plots_loose_cuts2/phantom_norm_hwpp-scaled.yoda\
:"Title=PHANTOM+Herwig++ 2.7.1"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
