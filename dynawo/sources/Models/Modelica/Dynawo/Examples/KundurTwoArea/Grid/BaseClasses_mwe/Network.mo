within Dynawo.Examples.KundurTwoArea.Grid.BaseClasses_mwe;

model Network "Kundur two-area system with buses, lines and transformers"
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
  Dynawo.Electrical.Buses.Bus bus01 annotation(
    Placement(visible = true, transformation(origin = {-240, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Buses.Bus bus07 annotation(
    Placement(visible = true, transformation(origin = {-60, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Buses.Bus bus06 annotation(
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Buses.Bus bus05 annotation(
    Placement(visible = true, transformation(origin = {-178, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Lines.Line line0506(BPu = bLinePu / 2 * lengthLine0506Km, GPu = 0, RPu = rLinePu * lengthLine0506Km, XPu = xLinePu * lengthLine0506Km) annotation(
    Placement(visible = true, transformation(origin = {-148, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Lines.Line line0607(BPu = bLinePu / 2 * lengthLine0607Km, GPu = 0, RPu = rLinePu * lengthLine0607Km, XPu = xLinePu * lengthLine0607Km) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // Transformer parameters
  final parameter Types.PerUnit xTrPu = 0.15 "Step-uptransformer reactance in pu (SnTr base)";
  final parameter Types.VoltageModule U1TrKv = 20 "Primary (low voltage) transformer voltage in kV";
  final parameter Types.VoltageModule U2TrKv = 230 "Secondary (high voltage) transformer voltage in kV";
  final parameter Types.ApparentPowerModule SnTr = 900 "Transformer rated power in MVA";
  final parameter Types.PerUnit xTrSystemBasePu = xTrPu / SnTr * Dynawo.Electrical.SystemBase.SnRef "Step-uptransformer reactance in pu (system base SnRef)";
  // Line parameters
  final parameter Real lengthLine0506Km = 25;
  final parameter Real lengthLine0607Km = 10;
  final parameter Real lengthLine0708Km = 110;
  final parameter Real lengthLine0809Km = 110;
  final parameter Real lengthLine0910Km = 10;
  final parameter Real lengthLine1011Km = 25;
  final parameter Types.PerUnit rLinePu = 0.0001 "Resistance in pu/km";
  final parameter Types.PerUnit xLinePu = 0.001 "Reactance in pu/km";
  final parameter Types.PerUnit bLinePu = 0.00175 "Susceptance in pu/km";
  final parameter Types.ApparentPowerModule SRLine = 100 "Line rated power in MVA";
  Dynawo.Electrical.Transformers.TransformerFixedRatio tr0105(BPu = 0, GPu = 0, RPu = 0, XPu = xTrSystemBasePu, rTfoPu = 1) annotation(
    Placement(visible = true, transformation(origin = {-208, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Transformers.TransformerFixedRatio tr0206(BPu = 0, GPu = 0, RPu = 0, XPu = xTrSystemBasePu, rTfoPu = 1) annotation(
    Placement(visible = true, transformation(origin = {-130, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Dynawo.Electrical.Buses.Bus bus02 annotation(
    Placement(visible = true, transformation(origin = {-130, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//line_4032_4044.switchOffSignal1.value = false; // to be disconnected to clear short circuit
  connect(bus05.terminal, line0506.terminal1) annotation(
    Line(points = {{-178, 70}, {-158, 70}}, color = {0, 0, 255}));
  connect(line0506.terminal2, bus06.terminal) annotation(
    Line(points = {{-138, 70}, {-120, 70}}, color = {0, 0, 255}));
  connect(bus06.terminal, line0607.terminal1) annotation(
    Line(points = {{-120, 70}, {-100, 70}}, color = {0, 0, 255}));
  connect(line0607.terminal2, bus07.terminal) annotation(
    Line(points = {{-80, 70}, {-60, 70}}, color = {0, 0, 255}));
// Switchoff signals
// Lines
  line0506.switchOffSignal1.value = false;
  line0506.switchOffSignal2.value = false;
  line0607.switchOffSignal1.value = false;
  line0607.switchOffSignal2.value = false;
// Transformers
  tr0105.switchOffSignal1.value = false;
  tr0105.switchOffSignal2.value = false;
  tr0206.switchOffSignal1.value = false;
  tr0206.switchOffSignal2.value = false;
  connect(bus01.terminal, tr0105.terminal1) annotation(
    Line(points = {{-240, 70}, {-218, 70}}, color = {0, 0, 255}));
  connect(tr0105.terminal2, bus05.terminal) annotation(
    Line(points = {{-198, 70}, {-178, 70}}, color = {0, 0, 255}));
  connect(tr0206.terminal2, bus06.terminal) annotation(
    Line(points = {{-130, 28}, {-130, 64}, {-120, 64}, {-120, 70}}, color = {0, 0, 255}));
  connect(tr0206.terminal1, bus02.terminal) annotation(
    Line(points = {{-130, 8}, {-130, -20}}, color = {0, 0, 255}));
  annotation(
    preferredView = "diagram",
    Diagram(coordinateSystem(extent = {{-300, -100}, {300, 100}})),
    Icon(coordinateSystem(extent = {{-300, -100}, {300, 100}})));
end Network;
