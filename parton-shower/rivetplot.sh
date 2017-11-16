#! /bin/sh

rivet-mkhtml \
  NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  Powheg.yoda\
:"Title=Powheg+Pythia 8"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  Herwig.yoda\
:"Title=VBFNLO 3+Herwig 7"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\

