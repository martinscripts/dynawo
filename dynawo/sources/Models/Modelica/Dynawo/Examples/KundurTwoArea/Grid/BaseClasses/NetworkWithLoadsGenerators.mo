within Dynawo.Examples.KundurTwoArea.Grid.BaseClasses;

model NetworkWithLoadsGenerators "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
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
  extends Dynawo.Examples.KundurTwoArea.Grid.BaseClasses.NetworkWithLoads;
  parameter Types.ReactivePowerPu P0PuGen01;
  parameter Types.ReactivePowerPu Q0PuGen01;
  parameter Types.VoltageModulePu U0PuGen01;
  parameter Types.Angle UAngle0Gen01;
  parameter Types.ReactivePowerPu P0PuGen02;
  parameter Types.ReactivePowerPu Q0PuGen02;
  parameter Types.VoltageModulePu U0PuGen02;
  parameter Types.Angle UAngle0Gen02;
  parameter Types.ReactivePowerPu P0PuGen03;
  parameter Types.ReactivePowerPu Q0PuGen03;
  parameter Types.VoltageModulePu U0PuGen03;
  parameter Types.Angle UAngle0Gen03;
  parameter Types.ReactivePowerPu P0PuGen04;
  parameter Types.ReactivePowerPu Q0PuGen04;
  parameter Types.VoltageModulePu U0PuGen04;
  parameter Types.Angle UAngle0Gen04;
  Dynawo.Electrical.Machines.Simplified.GeneratorPVFixed gen02(QGen0Pu = Q0PuGen02, PGen0Pu = P0PuGen02, U0Pu=U0PuGen02, u0Pu=Complex(U0PuGen02*Modelica.Math.cos(UAngle0Gen02), U0PuGen02*Modelica.Math.sin(UAngle0Gen02))) annotation(
    Placement(visible = true, transformation(origin = {-130, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Buses.InfiniteBus slack01(UPhase = UAngle0Gen01, UPu = U0PuGen01)  annotation(
    Placement(visible = true, transformation(origin = {-260, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Machines.Simplified.GeneratorPVFixed gen03(PGen0Pu = P0PuGen03, QGen0Pu = Q0PuGen03, U0Pu = U0PuGen03, u0Pu = Complex(U0PuGen03 * Modelica.Math.cos(UAngle0Gen03), U0PuGen03 * Modelica.Math.sin(UAngle0Gen03))) annotation(
    Placement(visible = true, transformation(origin = {274, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Machines.Simplified.GeneratorPVFixed gen04(PGen0Pu = P0PuGen04, QGen0Pu = Q0PuGen04, U0Pu = U0PuGen04, u0Pu = Complex(U0PuGen04 * Modelica.Math.cos(UAngle0Gen04), U0PuGen04 * Modelica.Math.sin(UAngle0Gen04))) annotation(
    Placement(visible = true, transformation(origin = {130, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  gen02.switchOffSignal1.value = false;
  gen02.switchOffSignal2.value = false;
  gen02.switchOffSignal3.value = false;
  gen03.switchOffSignal1.value = false;
  gen03.switchOffSignal2.value = false;
  gen03.switchOffSignal3.value = false;
  gen04.switchOffSignal1.value = false;
  gen04.switchOffSignal2.value = false;
  gen04.switchOffSignal3.value = false;
  connect(gen02.terminal, bus02.terminal) annotation(
    Line(points = {{-130, -48}, {-130, -20}}, color = {0, 0, 255}));
  connect(slack01.terminal, bus01.terminal) annotation(
    Line(points = {{-260, 70}, {-240, 70}}, color = {0, 0, 255}));
  connect(gen04.terminal, bus04.terminal) annotation(
    Line(points = {{130, -46}, {130, -20}}, color = {0, 0, 255}));
  connect(bus03.terminal, gen03.terminal) annotation(
    Line(points = {{240, 70}, {274, 70}}, color = {0, 0, 255}));
  annotation(
    Diagram,
    Icon);
end NetworkWithLoadsGenerators;
