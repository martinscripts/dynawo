within Dynawo.Electrical.HVDC.Standard.ACVoltageControl;

/*
* Copyright (c) 2015-2019, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source time domain simulation tool for power systems.
*/

model QRefQUCalc

  import Modelica;
  import Dynawo;
  import Dynawo.Types;
  import Dynawo.Connectors;
  import Dynawo.Electrical.SystemBase;

  parameter Types.PerUnit SlopeURefPu;
  parameter Types.PerUnit SlopeQRefPu;
  parameter Types.PerUnit Lambda;
  parameter Types.PerUnit Kiacvoltagecontrol;
  parameter Types.PerUnit Kpacvoltagecontrol;
  parameter Types.ReactivePowerPu QMinCombPu;
  parameter Types.ReactivePowerPu QMaxCombPu;
  parameter Types.PerUnit DeadBandU;

  Modelica.Blocks.Interfaces.RealInput QRefPu(start = Q0Pu) "Reference reactive power in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput URefPu(start = U0Pu) "Reference voltage in p.u (base UNom)" annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput UPu(start = U0Pu) "Voltage module in p.u (base UNom)" annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput QPu(start = Q0Pu) "Reactive power in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Blocks.Interfaces.RealOutput QRefUPu(start = Q0Pu) "Reference reactive power in U mode in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {110, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput QRefQPu(start = Q0Pu) "Reference reactive power in Q mode in p.u (base SNom)" annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-61, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.DeadZone deadZone(deadZoneAtInit = true, uMax = DeadBandU, uMin = -DeadBandU)  annotation(
    Placement(visible = true, transformation(origin = {-32, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = Lambda)  annotation(
    Placement(visible = true, transformation(origin = {-66, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-5, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter(Rising = SlopeURefPu)  annotation(
    Placement(visible = true, transformation(origin = {-85, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.SlewRateLimiter slewRateLimiter1(Rising = SlopeQRefPu)  annotation(
    Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.NonElectrical.Blocks.Continuous.PIAntiWindup PI(Ki = Kiacvoltagecontrol, Kp = Kpacvoltagecontrol, uMax = QMaxCombPu, uMin = QMinCombPu)  annotation(
    Placement(visible = true, transformation(origin = {25, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
protected

  parameter Types.ReactivePowerPu Q0Pu;
  parameter Types.VoltageModulePu U0Pu;

equation
  connect(UPu, feedback.u2) annotation(
    Line(points = {{-120, -20}, {-61, -20}, {-61, 12}}, color = {0, 0, 127}));
  connect(UPu, feedback.u2) annotation(
    Line(points = {{-120, -20}, {-61, -20}, {-61, 12}}, color = {0, 0, 127}));
  connect(feedback.y, deadZone.u) annotation(
    Line(points = {{-52, 20}, {-44, 20}}, color = {0, 0, 127}));
  connect(QPu, gain.u) annotation(
    Line(points = {{-120, -60}, {-78, -60}, {-78, -60}, {-78, -60}}, color = {0, 0, 127}));
  connect(deadZone.y, feedback1.u1) annotation(
    Line(points = {{-21, 20}, {-13, 20}}, color = {0, 0, 127}));
  connect(gain.y, feedback1.u2) annotation(
    Line(points = {{-55, -60}, {-5, -60}, {-5, 12}}, color = {0, 0, 127}));
  connect(QRefPu, slewRateLimiter1.u) annotation(
    Line(points = {{-120, 80}, {-83, 80}, {-83, 80}, {-82, 80}}, color = {0, 0, 127}));
  connect(slewRateLimiter1.y, QRefQPu) annotation(
    Line(points = {{-59, 80}, {101, 80}, {101, 80}, {110, 80}}, color = {0, 0, 127}));
  connect(URefPu, slewRateLimiter.u) annotation(
    Line(points = {{-120, 20}, {-97, 20}, {-97, 20}, {-97, 20}}, color = {0, 0, 127}));
  connect(slewRateLimiter.y, feedback.u1) annotation(
    Line(points = {{-74, 20}, {-70, 20}, {-70, 20}, {-69, 20}}, color = {0, 0, 127}));
  connect(feedback1.y, PI.u) annotation(
    Line(points = {{4, 20}, {11, 20}, {11, 20}, {13, 20}}, color = {0, 0, 127}));
  connect(PI.y, QRefUPu) annotation(
    Line(points = {{36, 20}, {110, 20}}, color = {0, 0, 127}));
  annotation(preferredView = "diagram",
    Diagram(coordinateSystem(grid = {1, 1})),
    Icon(coordinateSystem(grid = {1, 1})));

end QRefQUCalc;