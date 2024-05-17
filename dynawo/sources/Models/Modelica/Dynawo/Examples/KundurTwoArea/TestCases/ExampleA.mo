within Dynawo.Examples.KundurTwoArea.TestCases;

model ExampleA "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
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
equation
//
// gen01
  gen01.efdPu.value = gen01.Efd0Pu;
  gen01.omegaRefPu.value = 1;
  gen01.PmPu.value = gen01.Pm0Pu;
//
// gen02
  gen02.efdPu.value = gen02.Efd0Pu;
  gen02.omegaRefPu.value = 1;
  gen02.PmPu.value = gen02.Pm0Pu;
//
// gen03
  gen03.efdPu.value = gen03.Efd0Pu;
  gen03.omegaRefPu.value = 1;
  gen03.PmPu.value = gen03.Pm0Pu;
//
// gen04
  gen04.efdPu.value = gen04.Efd0Pu;
  gen04.omegaRefPu.value = 1;
  gen04.PmPu.value = gen04.Pm0Pu;
  annotation(
    Diagram,
    Icon,
    experiment(StartTime = 0, StopTime = 25, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"),
  Documentation(info = "<html><head></head><body><h1><br></h1></body></html>"));
end ExampleA;
