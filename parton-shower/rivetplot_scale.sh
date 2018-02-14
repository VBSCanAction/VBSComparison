#! /bin/sh

rivet-mkhtml -o rivet-NLOPSvariation_scale \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatNLO-DipoleShower_scale.yoda\
:"Title=VBFNLO 3+H7-Dipole"\
:"LineColor=blue"\
:"ErrorBands=1"\
:"ErrorBandColor=blue"\
:"RatioPlotErrorBandColor=blue"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_scalestat.yoda\
:"Title=MG5_aMC+Pythia 8(scale+stat)"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_scale.yoda\
:"Title=MG5_aMC+Pythia 8(scale)"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\

rivet-mkhtml -o rivet-NLOPSvariation_VBFNLOscale \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatNLO-DipoleShower_scale.yoda\
:"Title=VBFNLO 3+H7-Dipole"\
:"LineColor=blue"\
:"ErrorBands=1"\
:"ErrorBandColor=blue"\
:"RatioPlotErrorBandColor=blue"\
:"ErrorBandOpacity=0.3"\

rivet-mkhtml -o rivet-NLOPSvariation_MG5aMCscale \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_scalestat.yoda\
:"Title=MG5_aMC+Pythia 8(scale+stat)"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_scale.yoda\
:"Title=MG5_aMC+Pythia 8(scale)"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\

rivet-mkhtml -o rivet-NLOPSvariation_MG5aMCPDF \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_pdfstat.yoda\
:"Title=MG5_aMC+Pythia 8(PDF+stat)"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_pdf.yoda\
:"Title=MG5_aMC+Pythia 8(PDF)"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\

rivet-mkhtml -o rivet-NLOPSvariation_MG5aMCboth \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO"\
:"ErrorBands=1"\
:"ErrorBandColor=red"\
:"RatioPlotErrorBandColor=red"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_allstat.yoda\
:"Title=MG5_aMC+Pythia 8(both+stat)"\
:"LineColor=green"\
:"ErrorBands=1"\
:"ErrorBandColor=green"\
:"RatioPlotErrorBandColor=green"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_all.yoda\
:"Title=MG5_aMC+Pythia 8(both)"\
:"LineColor=brown"\
:"ErrorBands=1"\
:"ErrorBandColor=brown"\
:"RatioPlotErrorBandColor=brown"\
:"ErrorBandOpacity=0.3"\

