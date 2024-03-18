within Dynawo.Examples.KundurTwoArea.Grid;

model LoadFlow_mwe
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
  extends KundurTwoArea.Grid.BaseClasses_mwe.NetworkWithLoadsGenerators(
  P0PuGen01 = 7.0,
  Q0PuGen01 = -1.85,
  U0PuGen01 = 1.03,
  UAngle0Gen01 = 20.2 /180*Modelica.Constants.pi,
  P0PuGen02 = 7.0,
  Q0PuGen02 = -2.35,
  U0PuGen02 = 1.01,
  UAngle0Gen02 = 10.5 /180*Modelica.Constants.pi,
  P0PuGen03 = 7.19,
  Q0PuGen03 = -1.76,
  U0PuGen03 = 1.03,
  UAngle0Gen03 = -6.8 /180*Modelica.Constants.pi,
  P0PuGen04 = 7.0,
  Q0PuGen04 = -2.02,
  U0PuGen04 = 1.01,
  UAngle0Gen04 = -17.6 /180*Modelica.Constants.pi,
  P0PuLoad07 = 9.67,
  Q0PuLoad07 = 1.0,
  P0PuLoad09 = 17.67,
  Q0PuLoad09 = 1.0,
  Q0PuShunt07 = -2.0,
  Q0PuShunt09 = -3.5
  );
  extends Icons.Example;
  
  Types.ActivePowerPu P_slack;
  Types.ReactivePowerPu Q_slack;

equation
  P_slack = ComplexMath.real(slack01.terminal.V * ComplexMath.conj(slack01.terminal.i));
  Q_slack = ComplexMath.imag(slack01.terminal.V * ComplexMath.conj(slack01.terminal.i));

annotation(
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end LoadFlow_mwe;
