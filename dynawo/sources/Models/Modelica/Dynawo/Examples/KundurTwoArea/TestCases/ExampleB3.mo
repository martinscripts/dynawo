within Dynawo.Examples.KundurTwoArea.TestCases;

model ExampleB3 "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
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
  extends KundurTwoArea.TestCases.ExampleB2(tCSeconds=1, tBSeconds=10);
  extends Icons.Example;
 
  annotation(
    Diagram,
    Icon,
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ExampleB3;
