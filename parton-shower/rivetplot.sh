#! /bin/sh

cp ../Setup/RivetAnalysis/MC_VBSCAN_MCComparison_NLO.plot ../Setup/RivetAnalysis/MC_VBSCAN_MCComparison.plot
rivet-mkhtml -o rivet-NLOPS \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO (fixed order)"\
:"LineColor={[rgb]{0.40,0.40,0.40}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.40,0.40,0.40}}"\
:"RatioPlotErrorBandColor={[rgb]{0.40,0.40,0.40}}"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_HWPP_5M_NLOPS.yoda\
:"Title=MG5_aMC+H++ 2.7.1"\
:"LineColor={[rgb]{0.46,0.44,0.70}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.46,0.44,0.70}}"\
:"RatioPlotErrorBandColor={[rgb]{0.46,0.44,0.70}}"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_all.yoda\
:"Title=MG5_aMC+Pythia 8"\
:"LineColor={[rgb]{0.91,0.16,0.54}}"\
:"LineStyle=solid"\
:"ErrorBands=1"\
:"ErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"RatioPlotErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_5M_NLOPS_error_scale.yoda\
:"Title="\
:"LineColor={[rgb]{0.91,0.16,0.54}}"\
:"ErrorBands=1"\
:"ErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"RatioPlotErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"ErrorBandOpacity=0.5"\
  Powheg/Powheg.yoda\
:"Title=Powheg+Pythia 8"\
:"LineColor={[rgb]{0.85,0.37,0.01}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.85,0.37,0.01}}"\
:"RatioPlotErrorBandColor={[rgb]{0.85,0.37,0.01}}"\
:"ErrorBandOpacity=0.3"\
  Powheg/lhef.yoda\
:"Title=Powheg-no shower"\
:"LineColor={[rgb]{0.85,0.37,0.01}}"\
:"LineStyle=dashed"\
:"ErrorBands=0"\
  VBFNLO/Herwig-MCatNLO-DefaultShower.yoda\
:"Title=VBFNLO 3+H7-Default"\
:"LineColor={[rgb]{0.40,0.65,0.12}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.40,0.65,0.12}}"\
:"RatioPlotErrorBandColor={[rgb]{0.40,0.65,0.12}}"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatNLO-DipoleShower_scale.yoda\
:"Title=VBFNLO 3+H7-Dipole"\
:"LineColor={[rgb]{0.11,0.62,0.47}}"\
:"LineStyle=solid"\
:"ErrorBands=1"\
:"ErrorBandColor={[rgb]{0.11,0.62,0.47}}"\
:"RatioPlotErrorBandColor={[rgb]{0.11,0.62,0.47}}"\
:"ErrorBandOpacity=0.3"\


cp ../Setup/RivetAnalysis/MC_VBSCAN_MCComparison_LO.plot ../Setup/RivetAnalysis/MC_VBSCAN_MCComparison.plot
rivet-mkhtml -o rivet-LOPS \
  VBFNLO/VBFNLO-NLO.yoda\
:"Title=NLO (fixed order)"\
:"LineColor={[rgb]{0.40,0.40,0.40}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.40,0.40,0.40}}"\
:"RatioPlotErrorBandColor={[rgb]{0.40,0.40,0.40}}"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_HWPP_1M_LOPS.yoda\
:"Title=MG5_aMC+H++ 2.7.1"\
:"LineColor={[rgb]{0.46,0.44,0.70}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.46,0.44,0.70}}"\
:"RatioPlotErrorBandColor={[rgb]{0.46,0.44,0.70}}"\
:"ErrorBandOpacity=0.3"\
  MG5_aMC/run_PY8_1M_LOPS.yoda\
:"Title=MG5_aMC+Pythia 8"\
:"LineColor={[rgb]{0.91,0.16,0.54}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"RatioPlotErrorBandColor={[rgb]{0.91,0.16,0.54}}"\
:"ErrorBandOpacity=0.3"\
  PHANTOM/plots_loose_cuts2/phantom_norm_hwpp-scaled.yoda\
:"Title=PHANTOM+H++ 2.7.1"\
:"LineColor={[rgb]{0.65,0.46,0.11}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.65,0.46,0.11}}"\
:"RatioPlotErrorBandColor={[rgb]{0.65,0.46,0.11}}"\
:"ErrorBandOpacity=0.3"\
  PHANTOM/plots_loose_cuts2/phantom_norm-scaled.yoda\
:"Title=PHANTOM+Pythia 8"\
:"LineColor={[rgb]{0.90,0.67,0.01}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.90,0.67,0.01}}"\
:"RatioPlotErrorBandColor={[rgb]{0.90,0.67,0.01}}"\
:"ErrorBandOpacity=0.3"\
  VBFNLO/Herwig-MCatLO-DipoleShower.yoda\
:"Title=VBFNLO 3+H7-Dipole"\
:"LineColor={[rgb]{0.11,0.62,0.47}}"\
:"LineStyle=solid"\
:"ErrorBands=0"\
:"ErrorBandColor={[rgb]{0.11,0.62,0.47}}"\
:"RatioPlotErrorBandColor={[rgb]{0.11,0.62,0.47}}"\
:"ErrorBandOpacity=0.3"\
