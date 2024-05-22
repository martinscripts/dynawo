within Dynawo.Examples.KundurTwoArea.Grid;

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
  extends KundurTwoArea.Grid.NetworkWithLoads;
  // constant active current
  // constant reactive impedance
  //
  // Parameters gen01
  parameter Types.ReactivePowerPu P0PuGen01 = -7.0;
  parameter Types.ReactivePowerPu Q0PuGen01 = -1.85;
  parameter Types.VoltageModulePu U0PuGen01 = 1.03;
  parameter Types.Angle UAngle0Gen01 = 20.2 / 180 * Modelica.Constants.pi;
  parameter Real HSecondsGen01 = 6.5;
  //
  // Parameters gen02
  parameter Types.ReactivePowerPu P0PuGen02 = -7.0;
  parameter Types.ReactivePowerPu Q0PuGen02 = -2.35;
  parameter Types.VoltageModulePu U0PuGen02 = 1.01;
  parameter Types.Angle UAngle0Gen02 = 10.5 / 180 * Modelica.Constants.pi;
  parameter Real HSecondsGen02 = HSecondsGen01;
  //
  // Parameters gen03
  parameter Types.ReactivePowerPu P0PuGen03 = -7.19;
  parameter Types.ReactivePowerPu Q0PuGen03 = -1.76;
  parameter Types.VoltageModulePu U0PuGen03 = 1.03;
  parameter Types.Angle UAngle0Gen03 = -6.8 / 180 * Modelica.Constants.pi;
  parameter Real HSecondsGen03 = 6.175;
  //
  // Parameters gen04
  parameter Types.ReactivePowerPu P0PuGen04 = -7.0;
  parameter Types.ReactivePowerPu Q0PuGen04 = -2.02;
  parameter Types.VoltageModulePu U0PuGen04 = 1.01;
  parameter Types.Angle UAngle0Gen04 = -17.0 / 180 * Modelica.Constants.pi;
  parameter Real HSecondsGen04 = HSecondsGen03;
  //
  // Parameters for all generators
  parameter Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.Kundur;
  parameter Dynawo.Types.PerUnit Kd = 0;
  parameter Dynawo.Types.ActivePower PNomAlt = 850;
  parameter Dynawo.Types.ActivePower PNomTurb = 900;
  parameter Dynawo.Types.PerUnit RTfPu = 0;
  parameter Dynawo.Types.PerUnit RaPu = 0.0025;
  parameter Dynawo.Types.ApparentPowerModule SNom = 900;
  parameter Dynawo.Types.ApparentPowerModule SnTfo = SNom;
  parameter Dynawo.Types.Time Tpd0 = 8.0;
  parameter Dynawo.Types.Time Tppd0 = 0.03;
  parameter Dynawo.Types.Time Tppq0 = 0.05;
  parameter Dynawo.Types.Time Tpq0 = 0.4;
  parameter Dynawo.Types.VoltageModule UBaseHV = bus01.UNom;
  parameter Dynawo.Types.VoltageModule UBaseLV = bus01.UNom;
  parameter Dynawo.Types.VoltageModule UNom = bus01.UNom;
  parameter Dynawo.Types.VoltageModule UNomHV = bus01.UNom;
  parameter Dynawo.Types.VoltageModule UNomLV = bus01.UNom;
  parameter Dynawo.Types.PerUnit XTfPu = 0;
  parameter Dynawo.Types.PerUnit XdPu = 1.8;
  parameter Dynawo.Types.PerUnit XqPu = 1.7;
  parameter Dynawo.Types.PerUnit XlPu = 0.2;
  parameter Dynawo.Types.PerUnit XpdPu = 0.3;
  parameter Dynawo.Types.PerUnit XpqPu = 0.55;
  parameter Dynawo.Types.PerUnit XppdPu = 0.25;
  parameter Dynawo.Types.PerUnit XppqPu = 0.25;
  parameter Real md = Asat;
  parameter Real mq = Asat;
  parameter Real nd = Bsat;
  parameter Real nq = Bsat;
  parameter Real Asat = 0.015;
  parameter Real Bsat = 9.6;
  //
  // parameters for all AVRs
  parameter Real efdPu = 1;
  // random guess for constant field voltage
  //
  // gen01
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen01(DPu = Kd, ExcitationPu = ExcitationPu, H = HSecondsGen01, P0Pu = P0PuGen01, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen01, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, State0 = Dynawo.Electrical.Constants.state.Closed1, SwitchOffSignal10 = false, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen01, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen01, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {-265, 69}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  //
  // gen02
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen02(DPu = Kd, ExcitationPu = ExcitationPu, H = HSecondsGen02, P0Pu = P0PuGen02, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen02, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen02, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen02, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {-129, -43}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  //
  // gen03
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen03(DPu = Kd, ExcitationPu = ExcitationPu, H = HSecondsGen03, P0Pu = P0PuGen03, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen03, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, SwitchOffSignal20 = false, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen03, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen03, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {269, 69}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  //
  // gen04
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings gen04(DPu = Kd, ExcitationPu = ExcitationPu, H = HSecondsGen04, P0Pu = P0PuGen04, PNomAlt = PNomAlt, PNomTurb = PNomTurb, Q0Pu = Q0PuGen04, RTfPu = RTfPu, RaPu = RaPu, SNom = SNom, SnTfo = SnTfo, Tpd0 = Tpd0, Tppd0 = Tppd0, Tppq0 = Tppq0, Tpq0 = Tpq0, U0Pu = U0PuGen04, UBaseHV = UBaseHV, UBaseLV = UBaseLV, UNom = UNom, UNomHV = UNomHV, UNomLV = UNomLV, UPhase0 = UAngle0Gen04, XTfPu = XTfPu, XdPu = XdPu, XlPu = XlPu, XpdPu = XpdPu, XppdPu = XppdPu, XppqPu = XppqPu, XpqPu = XpqPu, XqPu = XqPu, md = md, mq = mq, nd = nd, nq = nq) annotation(
    Placement(visible = true, transformation(origin = {131, -51}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  //
  //
equation
//
// gen01
  gen01.switchOffSignal1.value = false;
  gen01.switchOffSignal2.value = false;
  gen01.switchOffSignal3.value = false;
//
// gen02
  gen02.switchOffSignal1.value = false;
  gen02.switchOffSignal2.value = false;
  gen02.switchOffSignal3.value = false;
//
// gen03
  gen03.switchOffSignal1.value = false;
  gen03.switchOffSignal2.value = false;
  gen03.switchOffSignal3.value = false;
//
// gen04
  gen04.switchOffSignal1.value = false;
  gen04.switchOffSignal2.value = false;
  gen04.switchOffSignal3.value = false;
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
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.00025),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end FullDynamicModel;
