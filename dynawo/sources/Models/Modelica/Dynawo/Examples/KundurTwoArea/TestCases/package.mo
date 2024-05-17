within Dynawo.Examples.KundurTwoArea;

package TestCases "Kundur two-area test system simulation cases"
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
  extends Icons.Package;
  
  


  annotation(
    Documentation(info = "<html><head></head><body>The TestCases package contains the test cases as defined in [1], Example 12.6.<div><br></div><h1>Load Flow</h1><div>LoadFlow.mo uses a static version (no dynamic models) of the model to reproduce the load flow results (P, Q, abs(u), angle(u), inter area P exchange) as given in [1].&nbsp;</div><div><br></div><div><br></div><h1>Example A&nbsp;</h1><div><br></div><div>ExampleA.mo uses the dynamic version of the model (dynamic synchronous machine models) without governor and without AVR (constant excitation voltage).&nbsp;</div><div><br></div><div>As stated in [1], the settings of the ZIP-Loads P7 and P9 are changed to constant active current and constant reactive impedance.</div><div>This leads to a different initial operation point than in the LoadFlow.mo.</div><div><br></div><div>This example is used to extract the system's eigenvalues and compare to the reference eigenvalues in [1].</div><div><br></div><h1>Example B1</h1><div>ExampleB1.mo includes the AVR <i>DC1A</i>&nbsp;for each of the synchronous machines.</div><div>TODO loads constant PQ or not?</div><div><br></div><div><br></div><div><br></div><div>[1] Prabha Kundur,&nbsp;<i>Power System Stability and Control</i>&nbsp;</div></body></html>"));
end TestCases;
