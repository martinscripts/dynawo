within Dynawo.Examples.KundurTwoArea.TestCases;

model ExampleB2 "Kundur two-area system with buses, lines and transformers, loads, shunts and generators."
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
  //
  // parameters for all AVRs
  parameter Types.Time tRSeconds = 0.01;
  parameter Types.PerUnit vIMaxPu = 99;
  parameter Types.PerUnit vIMinPu = -99;
  parameter Types.Time tCSeconds = 1e-9;
  parameter Types.Time tBSeconds = 1e-9;
  parameter Types.Time tC1Seconds = 1e-9;
  parameter Types.Time tB1Seconds = 1e-9;
  parameter Types.PerUnit kAPu = 200;
  parameter Types.Time tASeconds = 1e-9;
  parameter Types.PerUnit vAMaxPu = 4;
  parameter Types.PerUnit vAMinPu = -4;
  parameter Types.PerUnit vRMaxPu = 4;
  parameter Types.PerUnit vRMinPu = -4;
  parameter Types.PerUnit kCPu = 1e-9;
  parameter Types.PerUnit kFPu = 1e-9;
  parameter Types.Time tFSeconds = 1;
  parameter Types.PerUnit kLrPu = 1e-9;
  parameter Types.PerUnit iLrPu = 3;
  //
  // avr01
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.St1a avr_gen01(
    
    Efd0Pu=gen01.Efd0Pu,
    IlrPu=iLrPu,
    Ir0Pu=gen01.If0Pu,
    Ka=kAPu,
    Kc=kCPu,
    Kf=kFPu,
    Klr=kLrPu, PositionPss = 0, PositionUel = 0, UOel0Pu = 99,Us0Pu=gen01.UStator0Pu,
    VaMaxPu=vAMaxPu, 
    VaMinPu=vAMinPu, 
    ViMaxPu=vIMaxPu, 
    ViMinPu=vIMinPu,
    VrMaxPu=vRMaxPu, 
    VrMinPu=vRMinPu,
    tA=tASeconds,
    tB=tBSeconds,
    tB1=tB1Seconds,
    tC=tCSeconds,
    tC1=tC1Seconds,
    tF=tFSeconds,
    tR=tRSeconds
    ) annotation(
    Placement(visible = true, transformation(origin = {-270, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr02
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.St1a avr_gen02(
    
    Efd0Pu=gen02.Efd0Pu,
    IlrPu=iLrPu,
    Ir0Pu=gen02.If0Pu,
    Ka=kAPu,
    Kc=kCPu,
    Kf=kFPu,
    Klr=kLrPu, PositionPss = 0, PositionUel = 0, UOel0Pu = 99,Us0Pu=gen02.UStator0Pu,
    VaMaxPu=vAMaxPu, 
    VaMinPu=vAMinPu, 
    ViMaxPu=vIMaxPu, 
    ViMinPu=vIMinPu,
    VrMaxPu=vRMaxPu, 
    VrMinPu=vRMinPu,
    tA=tASeconds,
    tB=tBSeconds,
    tB1=tB1Seconds,
    tC=tCSeconds,
    tC1=tC1Seconds,
    tF=tFSeconds,
    tR=tRSeconds
  ) annotation(
    Placement(visible = true, transformation(origin = {-124, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr03
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.St1a avr_gen03(
    
    Efd0Pu=gen03.Efd0Pu,
    IlrPu=iLrPu,
    Ir0Pu=gen03.If0Pu,
    Ka=kAPu,
    Kc=kCPu,
    Kf=kFPu,
    Klr=kLrPu, PositionPss = 0, PositionUel = 0, UOel0Pu = 99,Us0Pu=gen03.UStator0Pu,
    VaMaxPu=vAMaxPu, 
    VaMinPu=vAMinPu, 
    ViMaxPu=vIMaxPu, 
    ViMinPu=vIMinPu,
    VrMaxPu=vRMaxPu, 
    VrMinPu=vRMinPu,
    tA=tASeconds,
    tB=tBSeconds,
    tB1=tB1Seconds,
    tC=tCSeconds,
    tC1=tC1Seconds,
    tF=tFSeconds,
    tR=tRSeconds
  ) annotation(
    Placement(visible = true, transformation(origin = {278, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  // avr04
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.St1a avr_gen04(
    
    Efd0Pu=gen04.Efd0Pu,
    IlrPu=iLrPu,
    Ir0Pu=gen04.If0Pu,
    Ka=kAPu,
    Kc=kCPu,
    Kf=kFPu,
    Klr=kLrPu, PositionPss = 0, PositionUel = 0, UOel0Pu = 99,Us0Pu=gen04.UStator0Pu,
    VaMaxPu=vAMaxPu, 
    VaMinPu=vAMinPu, 
    ViMaxPu=vIMaxPu, 
    ViMinPu=vIMinPu,
    VrMaxPu=vRMaxPu, 
    VrMinPu=vRMinPu,
    tA=tASeconds,
    tB=tBSeconds,
    tB1=tB1Seconds,
    tC=tCSeconds,
    tC1=tC1Seconds,
    tF=tFSeconds,
    tR=tRSeconds
  ) annotation(
    Placement(visible = true, transformation(origin = {132, -78}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //
  //
equation
//
// gen01
  gen01.efdPu.value = avr_gen01.EfdPu;
  gen01.ifPu = avr_gen01.IrPu;
  gen01.omegaRefPu.value = 1;
  gen01.PmPu.value = gen01.Pm0Pu;
  gen01.UStatorPu.value = avr_gen01.UsPu;
//
  avr_gen01.UsRefPu = if time>stepTimeSeconds then avr_gen01.UsRef0Pu*(1+deltaU_gen01) else avr_gen01.UsRef0Pu;
  avr_gen01.UOelPu = avr_gen01.UOel0Pu;
  avr_gen01.UPssPu = 0;
  avr_gen01.USclOelPu = avr_gen01.USclOel0Pu;
  avr_gen01.USclUelPu = avr_gen01.USclUel0Pu;
  avr_gen01.UUelPu = avr_gen01.UUel0Pu;
//
// gen02
  gen02.efdPu.value = avr_gen02.EfdPu;
  gen02.ifPu = avr_gen02.IrPu;
  gen02.omegaRefPu.value = 1;
  gen02.PmPu.value = gen02.Pm0Pu;
  gen02.UStatorPu.value = avr_gen02.UsPu;
//
  avr_gen02.UsRefPu = if time>stepTimeSeconds then avr_gen02.UsRef0Pu*(1+deltaU_gen02) else avr_gen02.UsRef0Pu;
  avr_gen02.UOelPu = avr_gen02.UOel0Pu;
  avr_gen02.UPssPu = 0;
  avr_gen02.USclOelPu = avr_gen02.USclOel0Pu;
  avr_gen02.USclUelPu = avr_gen02.USclUel0Pu;
  avr_gen02.UUelPu = avr_gen02.UUel0Pu;
//
// gen03
  gen03.efdPu.value = avr_gen03.EfdPu;
  gen03.ifPu = avr_gen03.IrPu;
  gen03.omegaRefPu.value = 1;
  gen03.PmPu.value = gen03.Pm0Pu;
  gen03.UStatorPu.value = avr_gen03.UsPu;
//
  avr_gen03.UsRefPu = if time>stepTimeSeconds then avr_gen03.UsRef0Pu*(1+deltaU_gen03) else avr_gen03.UsRef0Pu;
  avr_gen03.UOelPu = avr_gen03.UOel0Pu;
  avr_gen03.UPssPu = 0;
  avr_gen03.USclOelPu = avr_gen03.USclOel0Pu;
  avr_gen03.USclUelPu = avr_gen03.USclUel0Pu;
  avr_gen03.UUelPu = avr_gen03.UUel0Pu;
//
// gen04
  gen04.efdPu.value = avr_gen04.EfdPu;
  gen04.ifPu = avr_gen04.IrPu;
  gen04.omegaRefPu.value = 1;
  gen04.PmPu.value = gen04.Pm0Pu;
  gen04.UStatorPu.value = avr_gen04.UsPu;
//
  avr_gen04.UsRefPu = if time>stepTimeSeconds then avr_gen04.UsRef0Pu*(1+deltaU_gen04) else avr_gen04.UsRef0Pu;
  avr_gen04.UOelPu = avr_gen04.UOel0Pu;
  avr_gen04.UPssPu = 0;
  avr_gen04.USclOelPu = avr_gen04.USclOel0Pu;
  avr_gen04.USclUelPu = avr_gen04.USclUel0Pu;
  avr_gen04.UUelPu = avr_gen04.UUel0Pu;
//
  annotation(
    Diagram,
    Icon,
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.0001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end ExampleB2;
