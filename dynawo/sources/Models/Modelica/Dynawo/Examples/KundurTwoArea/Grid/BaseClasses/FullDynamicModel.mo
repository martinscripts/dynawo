within Dynawo.Examples.KundurTwoArea.Grid.BaseClasses;

model FullDynamicModel "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
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
  extends KundurTwoArea.Grid.BaseClasses.NetworkWithLoads(P0PuLoad07 = 9.67, Q0PuLoad07 = 1.0, Q0PuShunt07 = -2.0, P0PuLoad09 = 17.67, Q0PuLoad09 = 1.0, Q0PuShunt09 = -3.5);
  //
  // Parameters gen01
  final parameter Types.ReactivePowerPu P0PuGen01 = 7.0;
  final parameter Types.ReactivePowerPu Q0PuGen01 = 1.85;
  final parameter Types.VoltageModulePu U0PuGen01 = 1.03;
  final parameter Types.Angle UAngle0Gen01 = 20.2 / 180 * Modelica.Constants.pi;
  final parameter Real HSecondsGen01 = 6.5;
  //
  // Parameters gen02
  final parameter Types.ReactivePowerPu P0PuGen02 = 7.0;
  final parameter Types.ReactivePowerPu Q0PuGen02 = 2.35;
  final parameter Types.VoltageModulePu U0PuGen02 = 1.01;
  final parameter Types.Angle UAngle0Gen02 = 10.5 / 180 * Modelica.Constants.pi;
  final parameter Real HSecondsGen02 = HSecondsGen01;
  //
  // Parameters gen03
  final parameter Types.ReactivePowerPu P0PuGen03 = 7.19;
  final parameter Types.ReactivePowerPu Q0PuGen03 = 1.76;
  final parameter Types.VoltageModulePu U0PuGen03 = 1.03;
  final parameter Types.Angle UAngle0Gen03 = -6.8 / 180 * Modelica.Constants.pi;
  final parameter Real HSecondsGen03 = 6.175;
  //
  // Parameters gen04
  final parameter Types.ReactivePowerPu P0PuGen04 = 7.0;
  final parameter Types.ReactivePowerPu Q0PuGen04 = 2.02;
  final parameter Types.VoltageModulePu U0PuGen04 = 1.01;
  final parameter Types.Angle UAngle0Gen04 = -17.0 / 180 * Modelica.Constants.pi;
  final parameter Real HSecondsGen04 = HSecondsGen03;
  //
  // Parameters for all generators
  final parameter Real Kd = 0;
  final parameter Dynawo.Types.ActivePower PNomAlt = 1000;
  final parameter Dynawo.Types.ActivePower PNomTurb = PNomAlt;
  final parameter Real RTfPu = 0;
  final parameter Real RaPu = 0.0025;
  final parameter Dynawo.Types.ApparentPowerModule SNom = 1500;
  final parameter Dynawo.Types.ApparentPowerModule SnTfo = SNom;
  final parameter Dynawo.Types.Time Tpd0 = 8.0;
  final parameter Dynawo.Types.Time Tppd0 = 0.03;
  final parameter Dynawo.Types.Time Tppq0 = 0.05;
  final parameter Dynawo.Types.Time Tpq0 = 0.4;
  final parameter Dynawo.Types.VoltageModule UBaseHV = Dynawo.Electrical.SystemBase.SnRef;
  final parameter Dynawo.Types.VoltageModule UBaseLV = Dynawo.Electrical.SystemBase.SnRef;
  final parameter Dynawo.Types.VoltageModule UNom = bus01.UNom;
  final parameter Dynawo.Types.VoltageModule UNomHV = bus01.UNom;
  final parameter Dynawo.Types.VoltageModule UNomLV = bus01.UNom;
  final parameter Real XTfPu = 0;
  final parameter Real XdPu = 1.8;
  final parameter Real XlPu = 0.2;
  final parameter Real XpdPu = 0.3;
  final parameter Real XppdPu = 0.25;
  final parameter Real XppqPu = 0.25;
  final parameter Real XpqPu = 0.55;
  final parameter Real XqPu = 1.7;
  final parameter Real md = Asat;
  final parameter Real mq = Asat;
  final parameter Real nd = Bsat;
  final parameter Real nq = Bsat;
  final parameter Real Asat = 0.015;
  final parameter Real Bsat = 9.6;
  //
  // parameters for all AVRs
  final parameter Real AEx = Asat; 
  final parameter Real BEx = Bsat; 
  final parameter Real Ka = 20; 
  final parameter Real Ke = 1; 
  final parameter Real Kf = 0.125; 
  final parameter Integer PositionUel = 0; 
  final parameter Real VrMaxPu = 5; 
  final parameter Real VrMinPu = -3; 
  final parameter Real tA = 0.055; 
  final parameter Real tB = 1e-9; 
  final parameter Real tC = 1e-9; 
  final parameter Real tE = 0.36;
  final parameter Real tF = 1.8; 
  final parameter Real tR = 0.05;
  //
  // gen01
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen01(DPu = Kd, ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad, H = HSecondsGen01, P0Pu = P0PuGen01, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen01, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, SwitchOffSignal10 = false, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen01, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen01, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {-265, 69}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  // avr01
    Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen01(AEx = AEx, BEx = BEx, Efd0Pu = gen01.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen01, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {-270, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // gen02
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen02(DPu = Kd, ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad, H = HSecondsGen01, P0Pu = P0PuGen01, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen01, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen01, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen01, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {-129, -43}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  // avr02
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen02(AEx = AEx, BEx = BEx, Efd0Pu = gen02.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen02, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {-124, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // gen03
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen03(DPu = Kd, ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad, H = HSecondsGen01, P0Pu = P0PuGen01, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen01, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen01, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen01, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {269, 69}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  // avr03
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen03(AEx = AEx, BEx = BEx, Efd0Pu = gen03.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen03, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {278, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // gen04
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen04(DPu = Kd, ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad, H = HSecondsGen01, P0Pu = P0PuGen01, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen01, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen01, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen01, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {131, -51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  // avr04
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avr_gen04(AEx = AEx, BEx = BEx, Efd0Pu = gen04.Efd0Pu, Ka = Ka, Ke = Ke, Kf = Kf, PositionUel = PositionUel, Us0Pu = U0PuGen04, VrMaxPu = VrMaxPu, VrMinPu = VrMinPu, tA = tA, tB = tB, tC = tC, tE = tE, tF = tF, tR = tR) annotation(
    Placement(visible = true, transformation(origin = {132, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  //
equation
  //
  // gen01
  gen01.switchOffSignal1.value = false;
  gen01.switchOffSignal2.value = false;
  gen01.switchOffSignal3.value = false;
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
  gen02.switchOffSignal1.value = false;
  gen02.switchOffSignal2.value = false;
  gen02.switchOffSignal3.value = false;
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
  gen03.switchOffSignal1.value = false;
  gen03.switchOffSignal2.value = false;
  gen03.switchOffSignal3.value = false;
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
  gen04.switchOffSignal1.value = false;
  gen04.switchOffSignal2.value = false;
  gen04.switchOffSignal3.value = false;
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
  //
  connect(gen02.terminal, bus02.terminal) annotation(
    Line(points = {{-128, -42}, {-130, -42}, {-130, -20}}, color = {0, 0, 255}));
  connect(gen03.terminal, bus03.terminal) annotation(
    Line(points = {{269, 69}, {240, 69}, {240, 70}}, color = {0, 0, 255}));
  connect(gen04.terminal, bus04.terminal) annotation(
    Line(points = {{132, -50}, {130, -50}, {130, -20}}, color = {0, 0, 255}));
  connect(gen01.terminal, bus01.terminal) annotation(
    Line(points = {{-265, 69}, {-255, 69}, {-255, 70}, {-240, 70}}, color = {0, 0, 255}));
  annotation(
    Diagram,
    Icon,
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.005),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --daeMode",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end FullDynamicModel;
