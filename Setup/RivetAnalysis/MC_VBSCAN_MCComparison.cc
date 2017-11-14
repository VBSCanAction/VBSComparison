// -*- C++ -*-
#include "Rivet/Analysis.hh"
#include "Rivet/Projections/FinalState.hh"
#include "Rivet/Projections/FastJets.hh"
#include "Rivet/Projections/MissingMomentum.hh"
#include "Rivet/Projections/DressedLeptons.hh"
#include "Rivet/Projections/PromptFinalState.hh"
#include "Rivet/Projections/VetoedFinalState.hh"

namespace Rivet {


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
      _h_fiducial11 = bookHisto1D("crosssection", 1, 12999.5, 13000.5);
      _h_fiducial12 = bookHisto1D("jetsinclusive", 7, -0.5, 6.5);
      _h_fiducial13 = bookHisto1D("jetsexclusive", 7, -0.5, 6.5);
      _h_fiducial14 = bookHisto1D("m_jj", 40, 0, 4000);
      _h_fiducial15 = bookHisto1D("Deltay_jj", 20, 0, 10);
      _h_fiducial16 = bookHisto1D("pT_j1", 40, 0, 1000);
      _h_fiducial17 = bookHisto1D("y_j1", 20, -5, 5);
      _h_fiducial18 = bookHisto1D("pT_j2", 40, 0, 1000);
      _h_fiducial19 = bookHisto1D("y_j2", 20, -5, 5);
      _h_fiducial20 = bookHisto1D("m_ll", 40, 0, 4000);
      _h_fiducial21 = bookHisto1D("z_e", 30, 0, 1.5);
      _h_fiducial22 = bookHisto1D("z_mu", 30, 0, 1.5);
      _h_fiducial23 = bookHisto1D("pT_j3", 100, 0, 1000);
      _h_fiducial24 = bookHisto1D("y_j3", 20, -5, 5);
      _h_fiducial25 = bookHisto1D("z_j3", 30, 0, 1.5);

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

      // Histograms
        // cross section
        _h_fiducial11->fill(13000, event.weight());
        // inclusive jets
        for (size_t i = 0; i<=filterjets.size(); ++i)
          _h_fiducial12->fill(i, event.weight());
        // exclusive jets
        _h_fiducial13->fill(filterjets.size(), event.weight());
        // m_jj, deltayjj
        _h_fiducial14->fill(mjj, event.weight());
        _h_fiducial15->fill(deltayjj, event.weight());
        // pT_j1, y_j1
        _h_fiducial16->fill(filterjets[0].perp(), event.weight());
        _h_fiducial17->fill(filterjets[0].eta(), event.weight());
        // pT_j2, y_j2
        _h_fiducial18->fill(filterjets[1].perp(), event.weight());
        _h_fiducial19->fill(filterjets[1].eta(), event.weight());
        // m_ll
        _h_fiducial20->fill((electrons[0].momentum()+muons[0].momentum()).mass(), event.weight());
        // z_e+
        double avgj12 = (filterjets[0].eta()+filterjets[1].eta())/2.;
        double norm12 = abs(filterjets[0].eta()-filterjets[1].eta());
        double z = abs( electrons[0].eta() - avgj12 ) / norm12;
        _h_fiducial21->fill(z, event.weight());
        // z_mu
        z = abs( muons[0].eta() - avgj12 ) / norm12;
        _h_fiducial22->fill(z, event.weight());
        if (filterjets.size() > 2) {
          // pT_j3, y_j3
          _h_fiducial23->fill(filterjets[2].perp(), event.weight());
          _h_fiducial24->fill(filterjets[2].eta(), event.weight());
          // z_j3
          z = abs( filterjets[2].eta() - avgj12 ) / norm12;
          _h_fiducial25->fill(z, event.weight());
        }

    }

    /// Normalise histograms etc., after the run
    void finalize() {

      scale(_h_fiducial11, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial12, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial13, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial14, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial15, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial16, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial17, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial18, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial19, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial20, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial21, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial22, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial23, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial24, crossSection()/femtobarn/sumOfWeights());
      scale(_h_fiducial25, crossSection()/femtobarn/sumOfWeights());

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
