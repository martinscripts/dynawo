within Dynawo.Examples;

package KundurTwoArea "Kundur Two Area test system used for small signal stability studies"
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
    uses(Modelica(version = "3.2.3")),
    preferredView = "info",
    Documentation(info = "<html><head></head><body>This package contains the two-area test system described in Example 12.6 of Prabha Kundur's Power System Stability and Control.<div><br></div><div>Fom more information also see&nbsp;https://colib.net/testCases/.</div></body></html>"));
end KundurTwoArea;
