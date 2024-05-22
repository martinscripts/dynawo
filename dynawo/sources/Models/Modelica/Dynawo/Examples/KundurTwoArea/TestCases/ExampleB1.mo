within Dynawo.Examples.KundurTwoArea.TestCases;

model ExampleB1 "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
  /*
              * Copyright (c) 2022, RTE (http://www.rte-france.com)
              * See AUTHORS.txt
              * All rights reserved.
              * This Source Code Form is subject to the terms of the Mozilla Public
              * License, v. 2.0. If a copy of the MPL was not distributed with this
              * file, you can obtain one at http://mozilla.org/MPL/2.0/.
              * SPDX-License-Identifier: MPL-2.0
              *
              * This file is part of Dynawo, an hybrid C++/Modelica open source suite
              * of simulation tools for power systems.
              */
  extends KundurTwoArea.Grid.FullDynamicModel;
  extends Icons.Example;
  // parameters for all AVRs
   parameter Real AEx = 0.0056;
   parameter Real BEx = 1.075;
   parameter Real Ka = 20;
   parameter Real Ke = 1;
   parameter Real Kf = 0.125;
   parameter Integer PositionUel = 0;
   parameter Real VrMaxPu = 5;
   parameter Real VrMinPu = -3;
   parameter Real tA = 0.055;
   parameter Real tB = 1e-9;
   parameter Real tC = 1e-9;
   parameter Real tE = 0.36;
   parameter Real tF = 1.8;
   parameter Real tR = 0.05;
  //
  // avr01
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen01(AEx = AEx, BEx = BEx, Efd0Pu = gen01.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen01, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {-270, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr02
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen02(AEx = AEx, BEx = BEx, Efd0Pu = gen02.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen02, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {-124, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr03
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen03(AEx = AEx, BEx = BEx, Efd0Pu = gen03.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen03, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {278, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr04
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen04(AEx = AEx, BEx = BEx, Efd0Pu = gen04.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen04, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {132, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  //
equation
//
// gen01
  gen01.efdPu.value = avr_gen01.EfdPu;
  gen01.omegaRefPu.value = 1;
  gen01.PmPu.value = gen01.Pm0Pu;
  gen01.UStatorPu.value = avr_gen01.UsPu;
//
  avr_gen01.UsRefPu = avr_gen01.UsRef0Pu;
  avr_gen01.UOelPu = avr_gen01.UOel0Pu;
  avr_gen01.UPssPu = 0;
  avr_gen01.USclOelPu = avr_gen01.USclOel0Pu;
  avr_gen01.USclUelPu = avr_gen01.USclUel0Pu;
  avr_gen01.UUelPu = avr_gen01.UUel0Pu;
//
// gen02
  gen02.efdPu.value = avr_gen02.EfdPu;
  gen02.omegaRefPu.value = 1;
  gen02.PmPu.value = gen02.Pm0Pu;
  gen02.UStatorPu.value = avr_gen02.UsPu;
//
  avr_gen02.UsRefPu = avr_gen02.UsRef0Pu;
  avr_gen02.UOelPu = avr_gen02.UOel0Pu;
  avr_gen02.UPssPu = 0;
  avr_gen02.USclOelPu = avr_gen02.USclOel0Pu;
  avr_gen02.USclUelPu = avr_gen02.USclUel0Pu;
  avr_gen02.UUelPu = avr_gen02.UUel0Pu;
//
// gen03
  gen03.efdPu.value = avr_gen03.EfdPu;
  gen03.omegaRefPu.value = 1;
  gen03.PmPu.value = gen03.Pm0Pu;
  gen03.UStatorPu.value = avr_gen03.UsPu;
//
  avr_gen03.UsRefPu = avr_gen03.UsRef0Pu;
  avr_gen03.UOelPu = avr_gen03.UOel0Pu;
  avr_gen03.UPssPu = 0;
  avr_gen03.USclOelPu = avr_gen03.USclOel0Pu;
  avr_gen03.USclUelPu = avr_gen03.USclUel0Pu;
  avr_gen03.UUelPu = avr_gen03.UUel0Pu;
//
// gen04
  gen04.efdPu.value = avr_gen04.EfdPu;
  gen04.omegaRefPu.value = 1;
  gen04.PmPu.value = gen04.Pm0Pu;
  gen04.UStatorPu.value = avr_gen04.UsPu;
//
  avr_gen04.UsRefPu = avr_gen04.UsRef0Pu;
  avr_gen04.UOelPu = avr_gen04.UOel0Pu;
  avr_gen04.UPssPu = 0;
  avr_gen04.USclOelPu = avr_gen04.USclOel0Pu;
  avr_gen04.USclUelPu = avr_gen04.USclUel0Pu;
  avr_gen04.UUelPu = avr_gen04.UUel0Pu;
//
  annotation(
    Diagram,
    Icon,
    experiment(StartTime = 0, StopTime = 0.25, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ExampleB1;
