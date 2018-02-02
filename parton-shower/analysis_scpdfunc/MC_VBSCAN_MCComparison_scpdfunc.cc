// -*- C++ -*-
#include "Rivet/Analysis.hh"
#include "Rivet/Projections/FinalState.hh"
#include "Rivet/Projections/FastJets.hh"
#include "Rivet/Projections/MissingMomentum.hh"
#include "Rivet/Projections/DressedLeptons.hh"
#include "Rivet/Projections/PromptFinalState.hh"
#include "Rivet/Projections/VetoedFinalState.hh"
#include "YODA/Histo1D.h"

namespace Rivet {

  //MZ Make the histo array global
  Rivet::Histo1DPtr  _h_fiducial[26][112];

  /// @brief Add a short analysis description here
  class MC_VBSCAN_MCComparison : public Analysis {
  public:

    /// Constructor
    DEFAULT_RIVET_ANALYSIS_CTOR(MC_VBSCAN_MCComparison);


    /// @name Analysis methods
    //@{

    /// Book histograms and initialise projections before the run
    void init() {

      // Complete final state
      FinalState fs(-MAXDOUBLE, MAXDOUBLE, 0*GeV);

      // Projection for dressed electrons and muons
      IdentifiedFinalState photons(fs);
      photons.acceptIdPair(PID::PHOTON);

      IdentifiedFinalState el_id(fs);
      el_id.acceptIdPair(PID::ELECTRON);
      PromptFinalState electrons(el_id);
      addProjection(electrons, "Electrons");
      DressedLeptons dressed_electrons(photons, electrons, 0.1, Cuts::open(), true, false);
      addProjection(dressed_electrons, "DressedElectrons");

      IdentifiedFinalState mu_id(fs);
      mu_id.acceptIdPair(PID::MUON);
      PromptFinalState muons(mu_id);
      addProjection(muons, "Muons");
      DressedLeptons dressed_muons(photons, muons, 0.1, Cuts::open(), true, false);
      addProjection(dressed_muons, "DressedMuons");

      // Jets, anti-kt 0.4
      VetoedFinalState fsJets; //final state for jet finding: veto leptons and neutrinos
      fsJets.vetoNeutrinos();
      fsJets.addVetoOnThisFinalState(dressed_electrons);
      fsJets.addVetoOnThisFinalState(dressed_muons);
      declare(FastJets(fsJets, FastJets::ANTIKT, 0.4), "Jets");

      // Missing momentum
      declare(MissingMomentum(), "MET");

      // Histograms
      string wgt_id[112] = {"0", \
          "PDF=  260000 NNPDF30_nlo_as_0118", "PDF=  260001 NNPDF30_nlo_as_0118", "PDF=  260002 NNPDF30_nlo_as_0118", \
          "PDF=  260003 NNPDF30_nlo_as_0118", "PDF=  260004 NNPDF30_nlo_as_0118", "PDF=  260005 NNPDF30_nlo_as_0118", \
          "PDF=  260006 NNPDF30_nlo_as_0118", "PDF=  260007 NNPDF30_nlo_as_0118", "PDF=  260008 NNPDF30_nlo_as_0118", \
          "PDF=  260009 NNPDF30_nlo_as_0118", "PDF=  260010 NNPDF30_nlo_as_0118", "PDF=  260011 NNPDF30_nlo_as_0118", \
          "PDF=  260012 NNPDF30_nlo_as_0118", "PDF=  260013 NNPDF30_nlo_as_0118", "PDF=  260014 NNPDF30_nlo_as_0118", \
          "PDF=  260015 NNPDF30_nlo_as_0118", "PDF=  260016 NNPDF30_nlo_as_0118", "PDF=  260017 NNPDF30_nlo_as_0118", \
          "PDF=  260018 NNPDF30_nlo_as_0118", "PDF=  260019 NNPDF30_nlo_as_0118", "PDF=  260020 NNPDF30_nlo_as_0118", \
          "PDF=  260021 NNPDF30_nlo_as_0118", "PDF=  260022 NNPDF30_nlo_as_0118", "PDF=  260023 NNPDF30_nlo_as_0118", \
          "PDF=  260024 NNPDF30_nlo_as_0118", "PDF=  260025 NNPDF30_nlo_as_0118", "PDF=  260026 NNPDF30_nlo_as_0118", \
          "PDF=  260027 NNPDF30_nlo_as_0118", "PDF=  260028 NNPDF30_nlo_as_0118", "PDF=  260029 NNPDF30_nlo_as_0118", \
          "PDF=  260030 NNPDF30_nlo_as_0118", "PDF=  260031 NNPDF30_nlo_as_0118", "PDF=  260032 NNPDF30_nlo_as_0118", \
          "PDF=  260033 NNPDF30_nlo_as_0118", "PDF=  260034 NNPDF30_nlo_as_0118", "PDF=  260035 NNPDF30_nlo_as_0118", \
          "PDF=  260036 NNPDF30_nlo_as_0118", "PDF=  260037 NNPDF30_nlo_as_0118", "PDF=  260038 NNPDF30_nlo_as_0118", \
          "PDF=  260039 NNPDF30_nlo_as_0118", "PDF=  260040 NNPDF30_nlo_as_0118", "PDF=  260041 NNPDF30_nlo_as_0118", \
          "PDF=  260042 NNPDF30_nlo_as_0118", "PDF=  260043 NNPDF30_nlo_as_0118", "PDF=  260044 NNPDF30_nlo_as_0118", \
          "PDF=  260045 NNPDF30_nlo_as_0118", "PDF=  260046 NNPDF30_nlo_as_0118", "PDF=  260047 NNPDF30_nlo_as_0118", \
          "PDF=  260048 NNPDF30_nlo_as_0118", "PDF=  260049 NNPDF30_nlo_as_0118", "PDF=  260050 NNPDF30_nlo_as_0118", \
          "PDF=  260051 NNPDF30_nlo_as_0118", "PDF=  260052 NNPDF30_nlo_as_0118", "PDF=  260053 NNPDF30_nlo_as_0118", \
          "PDF=  260054 NNPDF30_nlo_as_0118", "PDF=  260055 NNPDF30_nlo_as_0118", "PDF=  260056 NNPDF30_nlo_as_0118", \
          "PDF=  260057 NNPDF30_nlo_as_0118", "PDF=  260058 NNPDF30_nlo_as_0118", "PDF=  260059 NNPDF30_nlo_as_0118", \
          "PDF=  260060 NNPDF30_nlo_as_0118", "PDF=  260061 NNPDF30_nlo_as_0118", "PDF=  260062 NNPDF30_nlo_as_0118", \
          "PDF=  260063 NNPDF30_nlo_as_0118", "PDF=  260064 NNPDF30_nlo_as_0118", "PDF=  260065 NNPDF30_nlo_as_0118", \
          "PDF=  260066 NNPDF30_nlo_as_0118", "PDF=  260067 NNPDF30_nlo_as_0118", "PDF=  260068 NNPDF30_nlo_as_0118", \
          "PDF=  260069 NNPDF30_nlo_as_0118", "PDF=  260070 NNPDF30_nlo_as_0118", "PDF=  260071 NNPDF30_nlo_as_0118", \
          "PDF=  260072 NNPDF30_nlo_as_0118", "PDF=  260073 NNPDF30_nlo_as_0118", "PDF=  260074 NNPDF30_nlo_as_0118", \
          "PDF=  260075 NNPDF30_nlo_as_0118", "PDF=  260076 NNPDF30_nlo_as_0118", "PDF=  260077 NNPDF30_nlo_as_0118", \
          "PDF=  260078 NNPDF30_nlo_as_0118", "PDF=  260079 NNPDF30_nlo_as_0118", "PDF=  260080 NNPDF30_nlo_as_0118", \
          "PDF=  260081 NNPDF30_nlo_as_0118", "PDF=  260082 NNPDF30_nlo_as_0118", "PDF=  260083 NNPDF30_nlo_as_0118", \
          "PDF=  260084 NNPDF30_nlo_as_0118", "PDF=  260085 NNPDF30_nlo_as_0118", "PDF=  260086 NNPDF30_nlo_as_0118", \
          "PDF=  260087 NNPDF30_nlo_as_0118", "PDF=  260088 NNPDF30_nlo_as_0118", "PDF=  260089 NNPDF30_nlo_as_0118", \
          "PDF=  260090 NNPDF30_nlo_as_0118", "PDF=  260091 NNPDF30_nlo_as_0118", "PDF=  260092 NNPDF30_nlo_as_0118", \
          "PDF=  260093 NNPDF30_nlo_as_0118", "PDF=  260094 NNPDF30_nlo_as_0118", "PDF=  260095 NNPDF30_nlo_as_0118", \
          "PDF=  260096 NNPDF30_nlo_as_0118", "PDF=  260097 NNPDF30_nlo_as_0118", "PDF=  260098 NNPDF30_nlo_as_0118", \
          "PDF=  260099 NNPDF30_nlo_as_0118", "PDF=  260100 NNPDF30_nlo_as_0118", \
          "central valu", \
          "dyn=  10 muR=0.10000E+01 muF=0.10000E+01", "dyn=  10 muR=0.10000E+01 muF=0.20000E+01", "dyn=  10 muR=0.10000E+01 muF=0.50000E+00", \
          "dyn=  10 muR=0.20000E+01 muF=0.10000E+01", "dyn=  10 muR=0.20000E+01 muF=0.20000E+01", "dyn=  10 muR=0.20000E+01 muF=0.50000E+00", \
          "dyn=  10 muR=0.50000E+00 muF=0.10000E+01", "dyn=  10 muR=0.50000E+00 muF=0.20000E+01", "dyn=  10 muR=0.50000E+00 muF=0.50000E+00"};

      //YODA::Histo1D *** _h_fiducial=new YODA::Histo1D[26][112];

      //YODA::Histo1D * _h_fiducial;
      //_h_fiducial = new Histo1D[26][112];
      //
      for (int i=0; i<112; i++){
        _h_fiducial[11][i] = bookHisto1D("crosssection " + wgt_id[i], 1, 12999.5, 13000.5);
        _h_fiducial[12][i] = bookHisto1D("jetsinclusive " + wgt_id[i], 7, -0.5, 6.5);
        _h_fiducial[13][i] = bookHisto1D("jetsexclusive " + wgt_id[i], 7, -0.5, 6.5);
        _h_fiducial[14][i] = bookHisto1D("m_jj " + wgt_id[i], 40, 0, 4000);
        _h_fiducial[15][i] = bookHisto1D("Deltay_jj " + wgt_id[i], 20, 0, 10);
        _h_fiducial[16][i] = bookHisto1D("pT_j1 " + wgt_id[i], 40, 0, 1000);
        _h_fiducial[17][i] = bookHisto1D("y_j1 " + wgt_id[i], 20, -5, 5);
        _h_fiducial[18][i] = bookHisto1D("pT_j2 " + wgt_id[i], 40, 0, 1000);
        _h_fiducial[19][i] = bookHisto1D("y_j2 " + wgt_id[i], 20, -5, 5);
        _h_fiducial[20][i] = bookHisto1D("m_ll " + wgt_id[i], 40, 0, 4000);
        _h_fiducial[21][i] = bookHisto1D("z_e " + wgt_id[i], 30, 0, 1.5);
        _h_fiducial[22][i] = bookHisto1D("z_mu " + wgt_id[i], 30, 0, 1.5);
        _h_fiducial[23][i] = bookHisto1D("pT_j3 " + wgt_id[i], 100, 0, 1000);
        _h_fiducial[24][i] = bookHisto1D("y_j3 " + wgt_id[i], 20, -5, 5);
        _h_fiducial[25][i] = bookHisto1D("z_j3 " + wgt_id[i], 30, 0, 1.5);
      }

    }


    /// Perform the per-event analysis
    void analyze(const Event& event) {

      // MET vetoing
      const MissingMomentum& met = apply<MissingMomentum>(event, "MET");
      if (met.vectorEt().mod() < 40*GeV) vetoEvent;

      // Get electron
      vector<DressedLepton> electrons = apply<DressedLeptons>(event, "DressedElectrons").dressedLeptons();
      if (electrons.size() < 1) vetoEvent;
      std::sort(electrons.begin(), electrons.end() ,
                [](const DressedLepton& l1, const DressedLepton& l2) {
                  return (l1.constituentLepton().pT() > l2.constituentLepton().pT()); });
      if (electrons[0].pT() < 20*GeV || electrons[0].abseta() > 2.5)  vetoEvent;

      // Get muon
      vector<DressedLepton> muons = apply<DressedLeptons>(event, "DressedMuons").dressedLeptons();
      if (muons.size() < 1) vetoEvent;
      std::sort(muons.begin(), muons.end() ,
                [](const DressedLepton& l1, const DressedLepton& l2) {
                  return (l1.constituentLepton().pT() > l2.constituentLepton().pT()); });
      if (muons[0].pT() < 20*GeV || muons[0].abseta() > 2.5)  vetoEvent;

      // Require same-sign leading leptons
      if (electrons[0].charge()*muons[0].charge() < 0) vetoEvent;

      // Delta R,ll cut
      double minDRll = DBL_MAX;
      for (size_t i = 0; i < electrons.size(); ++i) {
        for (size_t j = i+1; j < electrons.size(); ++j) {
          minDRll = min(minDRll, deltaR(electrons[i], electrons[j]));
        }
      }
      for (size_t i = 0; i < muons.size(); ++i) {
        for (size_t j = i+1; j < muons.size(); ++j) {
          minDRll = min(minDRll, deltaR(muons[i], muons[j]));
        }
      }
      for (size_t i = 0; i < electrons.size(); ++i) {
        for (size_t j = 0; j < muons.size(); ++j) {
          minDRll = min(minDRll, deltaR(electrons[i], muons[j]));
        }
      }
      if (minDRll < 0.3) vetoEvent;

      // Get jets
      const Jets& jets = apply<FastJets>(event, "Jets").jetsByPt(Cuts::pT > 30*GeV && Cuts::abseta < 4.5);

      // Remove jet if lepton too close
      vector<FourMomentum> filterjets;
      for (const Jet& j: jets)
        if ( all(electrons, DeltaRGtr(j, 0.3)) && all(muons, DeltaRGtr(j, 0.3)) )
          filterjets.push_back(j.momentum());

      // Now jet cuts
      if (filterjets.size() < 2) vetoEvent;
      double mjj = (filterjets[0] + filterjets[1]).mass();
      if ( mjj < 500*GeV ) vetoEvent;
      double deltayjj = deltaEta(filterjets[0],filterjets[1]);
      if ( deltayjj < 2.5 ) vetoEvent;


      //cout << "EVWGT" << event.weight() << " " << event.weights(0) << " " << event.weights(1) << " " << event.weights(2) << endl;
      // Histograms
      for (int i=0; i<112; i++){
        // cross section
        _h_fiducial[11][i]->fill(13000, event.weights(i));
        // inclusive jets
        for (size_t i = 0; i<=filterjets.size(); ++i)
          _h_fiducial[12][i]->fill(i, event.weights(i));
        // exclusive jets
        _h_fiducial[13][i]->fill(filterjets.size(), event.weights(i));
        // m_jj, deltayjj
        _h_fiducial[14][i]->fill(mjj, event.weights(i));
        _h_fiducial[15][i]->fill(deltayjj, event.weights(i));
        // pT_j1, y_j1
        _h_fiducial[16][i]->fill(filterjets[0].perp(), event.weights(i));
        _h_fiducial[17][i]->fill(filterjets[0].eta(), event.weights(i));
        // pT_j2, y_j2
        _h_fiducial[18][i]->fill(filterjets[1].perp(), event.weights(i));
        _h_fiducial[19][i]->fill(filterjets[1].eta(), event.weights(i));
        // m_ll
        _h_fiducial[20][i]->fill((electrons[0].momentum()+muons[0].momentum()).mass(), event.weights(i));
        // z_e+
        double avgj12 = (filterjets[0].eta()+filterjets[1].eta())/2.;
        double norm12 = abs(filterjets[0].eta()-filterjets[1].eta());
        double z = abs( electrons[0].eta() - avgj12 ) / norm12;
        _h_fiducial[21][i]->fill(z, event.weights(i));
        // z_mu
        z = abs( muons[0].eta() - avgj12 ) / norm12;
        _h_fiducial[22][i]->fill(z, event.weights(i));
        if (filterjets.size() > 2) {
          // pT_j3, y_j3
          _h_fiducial[23][i]->fill(filterjets[2].perp(), event.weights(i));
          _h_fiducial[24][i]->fill(filterjets[2].eta(), event.weights(i));
          // z_j3
          z = abs( filterjets[2].eta() - avgj12 ) / norm12;
          _h_fiducial[25][i]->fill(z, event.weights(i));
        }
      }

    }

    /// Normalise histograms etc., after the run
    void finalize() {

      for (int i=0; i<112; i++){
          scale(_h_fiducial[11][i], 1./femtobarn);
          scale(_h_fiducial[12][i], 1./femtobarn);
          scale(_h_fiducial[13][i], 1./femtobarn);
          scale(_h_fiducial[14][i], 1./femtobarn);
          scale(_h_fiducial[15][i], 1./femtobarn);
          scale(_h_fiducial[16][i], 1./femtobarn);
          scale(_h_fiducial[17][i], 1./femtobarn);
          scale(_h_fiducial[18][i], 1./femtobarn);
          scale(_h_fiducial[19][i], 1./femtobarn);
          scale(_h_fiducial[20][i], 1./femtobarn);
          scale(_h_fiducial[21][i], 1./femtobarn);
          scale(_h_fiducial[22][i], 1./femtobarn);
          scale(_h_fiducial[23][i], 1./femtobarn);
          scale(_h_fiducial[24][i], 1./femtobarn);
          scale(_h_fiducial[25][i], 1./femtobarn);
          //factor was crossSection()/femtobarn/sumOfWeights()
      }

    }

    //@}


    /// @name Histograms
    //@{
    Histo1DPtr _h_fiducial11;
    Histo1DPtr _h_fiducial12;
    Histo1DPtr _h_fiducial13;
    Histo1DPtr _h_fiducial14;
    Histo1DPtr _h_fiducial15;
    Histo1DPtr _h_fiducial16;
    Histo1DPtr _h_fiducial17;
    Histo1DPtr _h_fiducial18;
    Histo1DPtr _h_fiducial19;
    Histo1DPtr _h_fiducial20;
    Histo1DPtr _h_fiducial21;
    Histo1DPtr _h_fiducial22;
    Histo1DPtr _h_fiducial23;
    Histo1DPtr _h_fiducial24;
    Histo1DPtr _h_fiducial25;
    //@}


  };


  // The hook for the plugin system
  DECLARE_RIVET_PLUGIN(MC_VBSCAN_MCComparison);


}
