within Dynawo.Examples.KundurTwoArea.TestCases;

model LoadFlow
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
  extends KundurTwoArea.Grid.FullStaticModel;
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
end LoadFlow;
