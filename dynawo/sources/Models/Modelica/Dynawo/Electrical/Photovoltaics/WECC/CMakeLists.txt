# Copyright (c) 2021, RTE (http://www.rte-france.com)
# See AUTHORS.txt
# All rights reserved.
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, you can obtain one at http://mozilla.org/MPL/2.0/.
# SPDX-License-Identifier: MPL-2.0
#
# This file is part of Dynawo, an hybrid C++/Modelica open source suite of simulation tools for power systems.

add_subdirectory(BaseClasses B)

set(MODEL_FILES
  package.mo
  package.order
  PVCurrentSourceB.mo
  PVCurrentSourceB.extvar
  PVCurrentSourceBNoPlantControl.mo
  PVCurrentSourceBNoPlantControl.extvar
  PVCurrentSource_INIT.mo
  PVVoltageSourceA.mo
  PVVoltageSourceA.extvar
  PVVoltageSourceANoPlantControl.mo
  PVVoltageSourceANoPlantControl.extvar
  PVVoltageSourceB.mo
  PVVoltageSourceB.extvar
  PVVoltageSourceBNoPlantControl.mo
  PVVoltageSourceBNoPlantControl.extvar
  PVVoltageSource_INIT.mo
  )

#
# Modelica models install
#
foreach( MODEL_FILE ${MODEL_FILES} )
    install_model_file(${MODEL_FILE})
endforeach( MODEL_FILE )
