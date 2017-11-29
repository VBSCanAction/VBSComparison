#! /bin/sh

rivet-mkhtml \
VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
Powheg/Powheg.yoda\
:"Title=Powheg+Pythia 8"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
VBFNLO/Herwig-MCatNLO-DipoleShower.yoda\
:"Title=VBFNLO 3+Herwig 7"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\
Powheg/lhef.yoda\
:"Title=Powheg-lhef"\
:"LineColor=blue"\
:"ErrorBands=1"\
:"ErrorBandColor=blue"\
:"RatioPlotErrorBandColor=blue"\
:"ErrorBandOpacity=0.3"\
PHANTOM/plots_loose_cuts/PHANTOM_5M.yoda\
:"Title=PHANTOM"\
:"LineColor=magenta"\
:"ErrorBands=1"\
:"ErrorBandColor=magenta"\
:"RatioPlotErrorBandColor=magenta"\
:"ErrorBandOpacity=0.3"\


