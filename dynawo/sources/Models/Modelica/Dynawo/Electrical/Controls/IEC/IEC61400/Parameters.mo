within Dynawo.Electrical.Controls.IEC.IEC61400;

/*
* Copyright (c) 2024, RTE (http://www.rte-france.com)
* See AUTHORS.txt
* All rights reserved.
* This Source Code Form is subject to the terms of the Mozilla Public
* License, v. 2.0. If a copy of the MPL was not distributed with this
* file, you can obtain one at http://mozilla.org/MPL/2.0/.
* SPDX-License-Identifier: MPL-2.0
*
* This file is part of Dynawo, an hybrid C++/Modelica open source suite of simulation tools for power systems.
*/

package Parameters "Parameters of lookup tables for variable dependencies in the context of IEC N°61400-27-1"
  extends Icons.Package;
  
record Aerodynamic2d
  parameter Types.ActivePowerPu DPOmegaThetaPu "Aerodynamic power partial derivative, pitch dependent term with respect to changes in Wind Turbine Rotor speed in pu, typical value = 0.028" annotation(Dialog(tab = "Aerodynamic"));
  parameter Types.ActivePowerPu DPOmega0Pu "Aerodynamic power partial derivative, constant term with respect to changes in Wind Turbine Rotor speed in pu, typical value = 0.48" annotation(Dialog(tab = "Aerodynamic"));
  parameter Types.ActivePowerPu DPThetaPu "Aerodynamic power partial derivative with respect to changes in pitch angle in pu, typical value = -0.03" annotation(Dialog(tab = "Aerodynamic"));
  parameter Types.ActivePowerPu PAvailPu "Available power in pu (base SNom), typical value = active power setpoint" annotation(Dialog(tab = "Aerodynamic"));
  parameter Types.PerUnit Theta0 "Pitch angle of the wind turbine in degrees, if not derated, typical value = 0.0" annotation(Dialog(tab = "Aerodynamic"));
end Aerodynamic2d;

record GridMeasurementControl
  parameter Types.PerUnit DfcMaxPu "Maximum frequency control ramp rate in pu/s (base fNom), typical value = 1" annotation(Dialog(tab = "Measurement", group = "Control"));
  parameter Types.Time tfcFilt "Filter time constant for frequency control measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Control"));
  parameter Types.Time tIcFilt "Filter time constant for current control measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Control"));
  parameter Types.Time tPcFilt "Filter time constant for active power control measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Control"));
  parameter Types.Time tQcFilt "Filter time constant for reactive power control measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Control"));
  parameter Types.Time tUcFilt "Filter time constant for voltage control measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Control"));
end GridMeasurementControl;

record GridMeasurementProtection
  parameter Types.PerUnit DfpMaxPu "Maximum frequency protection ramp rate in pu/s (base fNom), typical value = 1" annotation(Dialog(tab = "Measurement", group = "Protection"));
  parameter Types.Time tfpFilt "Filter time constant for frequency protection measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Protection"));
  parameter Types.Time tIpFilt "Filter time constant for current protection measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Protection"));
  parameter Types.Time tPpFilt "Filter time constant for active power protection measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Protection"));
  parameter Types.Time tQpFilt "Filter time constant for reactive power protection measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Protection"));
  parameter Types.Time tUpFilt "Filter time constant for voltage protection measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement", group = "Protection"));
end GridMeasurementProtection;

record GridMeasurementWPP
  parameter Types.AngularVelocityPu DfMaxPu "Maximum frequency ramp rate in pu/s (base omegaNom), typical value = 1" annotation(Dialog(tab = "Measurement"));
  parameter Types.Time tfFilt "Filter time constant for frequency measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement"));
  parameter Types.Time tIFilt "Filter time constant for current measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement"));
  parameter Types.Time tPFilt "Filter time constant for active power measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement"));
  parameter Types.Time tQFilt "Filter time constant for reactive power measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement"));
  parameter Types.Time tUFilt "Filter time constant for voltage measurement in s, typical value = 0.005" annotation(Dialog(tab = "Measurement"));
end GridMeasurementWPP;

record CurrentLimiter
 parameter Types.CurrentModulePu IMaxDipPu "Maximum current during voltage dip at converter terminal in pu (base UNom, SNom), typical value = 1.3" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
  parameter Types.CurrentModulePu IMaxPu "Maximum continuous current at converter terminal in pu (base UNom, SNom), typical value = 1.3" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
  parameter Types.PerUnit Kpqu "Partial derivative of reactive current limit against voltage in pu (base UNom, SNom), typical value = 20" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
  parameter Boolean MdfsLim "Limitation of type 3 stator current (false: total current limitation, true: stator current limitation), typical value = false" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
  parameter Boolean Mqpri "Prioritization of reactive power during FRT (false: active power priority, true: reactive power priority), typical value = true" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
  parameter Types.VoltageModulePu UpquMaxPu "WT voltage in the operation point where zero reactive power can be delivered, in pu (base UNom), typical value = 1.1" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
end CurrentLimiter;

record CurrentLimiter2015
  parameter Types.Time tUFiltcl "Voltage filter time constant in s" annotation(Dialog(tab = "CurrentLimiter", group = "Parameters"));
end CurrentLimiter2015;

record InitialQLimits
    parameter Types.ReactivePowerPu QMax0Pu "Initial maximum reactive power at grid terminal in pu (base SNom) (generator convention)" annotation(Dialog(tab = "Initialization"));
    parameter Types.ReactivePowerPu QMin0Pu "Initial minimum reactive power at grid terminal in pu (base SNom) (generator convention)" annotation(Dialog(tab = "Initialization"));
end InitialQLimits;

record InitialQSetpoint
    parameter Types.PerUnit XWT0Pu "Initial reactive power or voltage reference at grid terminal in pu (base SNom or UNom) (generator convention)" annotation(  Dialog(tab = "Operating point"));
end InitialQSetpoint;

record InitialQSetpointWPP
  parameter Types.PerUnit X0Pu "Initial reactive power or voltage reference at grid terminal in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "Operating point"));
  parameter Types.PerUnit XWT0Pu "Initial reactive power or voltage reference at grid terminal in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "Operating point"));
end InitialQSetpointWPP;

record LinearCommunication
  parameter Types.Time tLag "Communication lag time constant in s" annotation(Dialog(tab = "LinearCommunication"));
  parameter Types.Time tLead "Communication lead time constant in s" annotation(Dialog(tab = "LinearCommunication"));
end LinearCommunication;

record Mechanical
  parameter Types.PerUnit CdrtPu "Drive train damping in pu (base SNom, omegaNom), typical value = 0.3" annotation(Dialog(tab = "Mechanical"));
  parameter Types.Time Hgen "Generator inertia time constant in s, typical value = 5" annotation(Dialog(tab = "Mechanical"));
  parameter Types.Time Hwtr "WT rotor inertia time constant in s, typical value = 5" annotation(Dialog(tab = "Mechanical"));
  parameter Types.PerUnit KdrtPu "Drive train stiffness in pu (base SNom, omegaNom), typical value = 200" annotation(Dialog(tab = "Mechanical"));
end Mechanical;

record PControlWPP2015
  parameter Types.Time tpft "Lead time constant in the reference value transfer function in s" annotation(Dialog(tab = "PControlWP"));
  parameter Types.Time tpfv "Lag time constant in the reference value transfer function in s" annotation(Dialog(tab = "PControlWP"));
  parameter Types.Time tWPfFiltP "Filter time constant for frequency measurement in s" annotation(Dialog(tab = "PControlWP"));
  parameter Types.Time tWPPFiltP "Filter time constant for active power measurement in s" annotation(Dialog(tab = "PControlWP"));
end PControlWPP2015; 

record PControlWPP
  parameter Types.PerUnit DPRefMaxPu "Maximum positive ramp rate for PD power reference in pu/s (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit DPRefMinPu "Minimum negative ramp rate for PD power reference in pu/s (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit DPwpRefMaxPu "Maximum positive ramp rate for WP power reference in pu/s (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit DPwpRefMinPu "Minimum negative ramp rate for WP power reference in pu/s (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit Kiwpp "Power PI controller integration gain in pu/s (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit Kpwpp "Power PI controller proportional gain in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.PerUnit KwppRef "Power reference gain in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.ActivePowerPu PKiwppMaxPu "Maximum active power reference from integration in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.ActivePowerPu PKiwppMinPu "Minimum active power reference from integration in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.ActivePowerPu PRefMaxPu "Maximum PD power reference in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.ActivePowerPu PRefMinPu "Minimum PD power reference in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
end PControlWPP;

record PControlWPP2020
  parameter Types.ActivePowerPu PErrMaxPu "Maximum control error for power PI controller in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
  parameter Types.ActivePowerPu PErrMinPu "Minimum negative control error for power PI controller in pu (base SNom)" annotation(Dialog(tab = "PControlWP"));
end PControlWPP2020;

record PControlWT4Base
  parameter Types.PerUnit Kpaw "Anti-windup gain for active power in pu/s (base SNom)" annotation(Dialog(tab = "PControl"));
end PControlWT4Base;

record PControlWT3 "Parameters used in Type 3a P control including torque PI controller"
  extends Dynawo.Electrical.Sources.IEC.BaseConverters.Parameters.SNom;
  extends Dynawo.Electrical.Sources.IEC.BaseConverters.Parameters.IntegrationTimeStep;
  parameter Types.ActivePowerPu DPMaxPu "Maximum ramp rate of wind turbine power, typical value = 999" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.ActivePowerPu DPRefMax4abPu "Maximum ramp rate for reference power of the wind turbine, typical value = 0.3" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.ActivePowerPu DPRefMin4abPu "Minimum ramp rate for reference power of the wind turbine, typical value = -0.3" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.PerUnit KDtd "Active drive train damping: gain, typical value = 1.5" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Boolean MOmegaTMax "Mode for source of rotational speed for maximum torque calculation (false: OmegaWtr -- true: OmegaRef), typical value = true" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Boolean MOmegaTqpi "Mode for source of rotational speed for torque PI controller error calculation (false: OmegaGen -- true: OmegaWtr), typical value = false" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Boolean MpUScale "Enable voltage scaling for power reference during a voltage dip (false: no scaling -- true: u scaling), typical value = false" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.AngularVelocityPu OmegaDtdPu "Active drive train damping: frequency, derived from two-mass model parameters, typical value = 11.3" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.AngularVelocityPu OmegaOffsetPu "Offset from the reference value to limit controller action during rotor speed changes, typical value = 0" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.ActivePowerPu PDtdMaxPu "Active drive train damping: maximum power, typical value = 0.15" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Real TableOmegaPPu[:,:] = [0, 0.76; 0.3, 0.76; 0.31, 0.86; 0.4, 0.94; 0.5, 1; 1, 1] "Lookup table for power as a function of speed, typical value = [0, 0.76; 0.3, 0.76; 0.31, 0.86; 0.4, 0.94; 0.5, 1; 1, 1]" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.Time tOmegafiltp3 "Filter time constant for measuring generator speed, typical value = 0.005" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.Time tOmegaRef "Time constant in the speed reference filter, typical value = 0.005" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.Time tPord "Power order lag time constant, typical value = 0.01" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.PerUnit Zeta "Active drive train damping: damping coefficient, typical value = 0.5" annotation(Dialog(tab = "PControl", group = "PControl"));
  parameter Types.PerUnit DTauMaxPu "Torque ramp rate limit, as required by some grid codes, typical value = 0.25" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.PerUnit DTauUvrtMaxPu "Torque rise rate limit during UVRT, typical value = 0" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.PerUnit KIp  "Integrator time constant of the PI controller, typical value = 5" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.PerUnit KPp  "Proportional gain of the PI controller, typical value = 8" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Boolean MPUvrt  "Mode for UVRT power control (false: reactive power control -- true: voltage control), typical value = true" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.PerUnit TauEMinPu  "Minimum torque for the electrical generator, typical value = 0.001" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.PerUnit TauUscalePu  "Voltage scaling factor for reset torque, typical value = 1" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.Time tDvs  "Time delay following deep a voltage dip, typical value = 0.05" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.VoltageModulePu UDvsPu  "Voltage limit for maintaining UVRT status after a deep voltage dip, typical value = 0.15" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.VoltageModulePu UpDipPu  "Voltage dip threshold for active power control, often different from converter thresholds (e.g., 0.8), typical value = 0.9" annotation(Dialog(tab = "PControl", group = "TorquePi"));
  parameter Types.ActivePower PBaseMeasurement "Base power for incoming active power measurement values in MW or MVA, typical value = SystemBase.SnRef";
  
  // initial parameters
  extends Dynawo.Electrical.Sources.IEC.BaseConverters.Parameters.InitialPGrid;
  final parameter Types.ActivePowerPu POrd0Pu = -P0Pu * SystemBase.SnRef / SNom "Initial active power order in pu (base SNom) (generator convention)" annotation(Dialog(tab = "Initialization"));
  final parameter Types.ActivePowerPu PWtcFilt0Pu = -P0Pu "Initial measured active power in pu (base SystemBase.SnRef) (generator convention)" annotation(Dialog(tab = "Initialization"));
  final parameter Types.PerUnit OmegaRef0Pu = Modelica.Math.Vectors.interpolate(TableOmegaPPu[:,1], TableOmegaPPu[:,2], POrd0Pu) "Initial value for omegaRef (output of omega(p) characteristic) in pu (base SystemBase.omegaRef0Pu)" annotation(Dialog(tab = "Initialization"));
  final parameter Types.PerUnit TauEMax0Pu = POrd0Pu / (if MOmegaTMax then OmegaRef0Pu else SystemBase.omega0Pu) "Initial value of maximum torque signal tauEMaxPu in pu (base SNom/OmegaNom)" annotation(Dialog(tab = "Initialization"));
end PControlWT3;

record PControlWT4
  parameter Boolean MpUScale "Voltage scaling for power reference during voltage dip (true: u scaling, false: no scaling)" annotation(Dialog(tab = "PControl"));
  parameter Types.VoltageModulePu UpDipPu "Voltage dip threshold for power control in pu (base UNom)" annotation(Dialog(tab = "PControl"));
end PControlWT4;

record PControlWT4a
  extends PControlWT4;
  parameter Types.PerUnit DPMaxP4APu "Maximum WT power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.PerUnit DPRefMax4APu "Maximum WT reference power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.PerUnit DPRefMin4APu "Minimum WT reference power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Boolean MpUScale "Voltage scaling for power reference during voltage dip (true: u scaling, false: no scaling)" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPOrdP4A "Power order lag time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPWTRef4A "Reference power order lag time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.VoltageModulePu UpDipPu "Voltage dip threshold for power control in pu (base UNom)" annotation(Dialog(tab = "PControl"));
end PControlWT4a; 

record PControlWT4a2015
  parameter Types.PerUnit DPMaxP4APu "Maximum WT power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPOrdP4A "Power order lag time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tUFiltP4A "Filter time constant for voltage measurement in s" annotation(Dialog(tab = "PControl"));
end PControlWT4a2015;

record PControlWT4b
  extends PControlWT4;
  parameter Types.PerUnit DPMaxP4BPu "Maximum WT power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.PerUnit DPRefMax4BPu "Maximum WT reference power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.PerUnit DPRefMin4BPu "Minimum WT reference power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPAero "Reference power order lag time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPOrdP4B "Power order lag time constant in s" annotation(Dialog(tab = "PControl"));
end PControlWT4b;

record PControlWT4b2015
  parameter Types.PerUnit DPMaxP4BPu "Maximum WT power ramp rate in pu/s (base SNom) (generator convention)" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPAero "Aerodynamic power response time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tPOrdP4B "Power order lag time constant in s" annotation(Dialog(tab = "PControl"));
  parameter Types.Time tUFiltP4B "Filter time constant for voltage measurement in s" annotation(Dialog(tab = "PControl"));
end PControlWT4b2015;

record PitchAngleControl
  parameter Real DThetaCmax "Pitch maximum positive ramp rate of power PI controller, typical value = 6" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real DThetaCmin  "Pitch dependent term of aerodynamic power partial derivative with respect to changes in Wind Turbine Rotor speed, typical value = -3" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real DThetaMax "Pitch maximum positive ramp rate in degrees/s, typical value = 6" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real DThetaMin "Pitch maximum negative ramp rate in degrees/s, typical value = -3" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real DThetaOmegamax "Pitch maximum positive ramp rate of speed PI controller in degrees/s, typical value = 6" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real DThetaOmegamin "Pitch maximum negative ramp rate of speed PI controller in degrees/s, typical value = -3" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real KIcPu "Integration gain of power PI controller, typical value = 1e-9" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real KIomegaPu "Integration gain of Speed PI controller, typical value = 15" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real KPcPu "Proportional gain of power PI controller, typical value = 0" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real KPomegaPu "Proportional gain of speed PI controller, typical value = 15" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real KPXPu "Cross coupling pitch gain , typical value = 0.03" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaCmax "Maximum WT pitch angle of power PI controller in degrees, typical value = 35" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaCmin "Minimum WT pitch angle of power PI controller in degrees, typical value = 0" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaMax "Maximum WT pitch angle in degrees, typical value = 35" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaMin "Minimum WT pitch angle in degrees, typical value = 0" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaOmegamax "Maximum WT pitch angle of speed PI controller in degrees, typical value = 35" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real ThetaOmegamin "Minimum WT pitch angle of speed PI controller in degrees, typical value = 0" annotation(Dialog(tab = "PitchAngleCtrl"));
  parameter Real TTheta "WT pitch time constant in s, typical value = 0.25" annotation(Dialog(tab = "PitchAngleCtrl"));
end PitchAngleControl;

record Pll
  parameter Types.Time tPll "PLL first order filter time constant in s" annotation(Dialog(tab = "PLL"));
  parameter Types.VoltageModulePu UPll1Pu "Voltage below which the angle of the voltage is filtered and possibly also frozen, in pu (base UNom)" annotation(Dialog(tab = "PLL"));
  parameter Types.VoltageModulePu UPll2Pu "Voltage below which the angle of the voltage is frozen, in pu (base UNom) (UPll2Pu < UPll1Pu typically)" annotation(Dialog(tab = "PLL"));
end Pll;

record QControlWPP
  parameter Types.PerUnit DXRefMaxPu "Maximum positive ramp rate for WT reactive power or voltage reference in pu/s (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit DXRefMinPu "Minimum negative ramp rate for WT reactive power or voltage reference in pu/s (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit Kiwpx "Reactive power or voltage PI controller integral gain in pu/s (base SNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit Kpwpx "Reactive power or voltage PI controller proportional gain in pu (base SNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit KwpqRef "Reactive power reference gain in pu (base SNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit Kwpqu "Voltage controller cross coupling gain in pu (base SNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Integer MwpqMode "Control mode (0 : reactive power reference, 1 : power factor reference, 2 : UQ static, 3 : voltage control)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.Time tUqFilt "Time constant for the UQ static mode in s" annotation(Dialog(tab = "QControlWP"));
  parameter Types.VoltageModulePu UwpqDipPu "Voltage threshold for UVRT detection in pu (base UNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XKiwpxMaxPu "Maximum WT reactive power or voltage reference from integration in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XKiwpxMinPu "Minimum WT reactive power or voltage reference from integration in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XRefMaxPu "Maximum WT reactive power or voltage reference in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XRefMinPu "Minimum WT reactive power or voltage reference in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
end QControlWPP;

record QControlWPP2015
  parameter Types.Time tWPPFiltQ "Filter time constant for active power measurement in s" annotation(Dialog(tab = "QControlWP"));
  parameter Types.Time tWPQFiltQ "Filter time constant for reactive power measurement in s" annotation(Dialog(tab = "QControlWP"));
  parameter Types.Time tWPUFiltQ "Filter time constant for voltage measurement in s" annotation(Dialog(tab = "QControlWP"));
  parameter Types.Time txft "Lead time constant in the reference value transfer function in s" annotation(Dialog(tab = "QControlWP"));
  parameter Types.Time txfv "Lag time constant in the reference value transfer function in s" annotation(Dialog(tab = "QControlWP"));
end QControlWPP2015;

record QControlWPP2020
  parameter Types.PerUnit RwpDropPu "Resistive component of voltage drop impedance in pu (base UNom, SNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.VoltageModulePu UwpqRisePu "Voltage threshold for OVRT detection in pu (base UNom)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XErrMaxPu "Maximum reactive power or voltage error input to PI controller in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XErrMinPu "Minimum reactive power or voltage error input to PI controller in pu (base SNom or UNom) (generator convention)" annotation(Dialog(tab = "QControlWP"));
  parameter Types.PerUnit XwpDropPu "Inductive component of voltage drop impedance in pu (base UNom, SNom)" annotation(Dialog(tab = "QControlWP"));
end QControlWPP2020;

record QControlWT2015
  parameter Integer MqUvrt "UVRT Q control modes (0-2) (see Table 23, section 5.6.5.7, page 51 of the IEC norm N°61400-27-1:2015)" annotation(Dialog(tab = "QControl"));
  parameter Types.Time tPFiltQ "Active power filter time constant in s" annotation(Dialog(tab = "QControl"));
  parameter Types.Time tUFiltQ "Voltage filter time constant in s" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu Udb1Pu "Voltage dead band lower limit in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu Udb2Pu "Voltage dead band upper limit in pu (base UNom)" annotation(Dialog(tab = "QControl"));
end QControlWT2015;

record QControlWT2020
  parameter Types.VoltageModulePu DUdb1Pu "Voltage change dead band lower limit (typically negative) in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu DUdb2Pu "Voltage change dead band upper limit (typically positive) in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kpufrt "Voltage PI controller proportional gain during FRT in pu (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Integer Mqfrt "FRT Q control modes (0-3) (see Table 29, section 7.7.5, page 60 of the IEC norm N°61400-27-1:2020)" annotation(Dialog(tab = "QControl"));
  parameter Types.Time tUss "Steady-state voltage filter time constant in s" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu UqRisePu "Voltage threshold for OVRT detection in Q control in pu (base UNom)" annotation(Dialog(tab = "QControl"));
end QControlWT2020;

record QControlWTBase
   extends RDropXDrop;
   parameter Types.PerUnit IqH1Pu "Maximum reactive current injection during dip in pu (base UNom, SNom) (generator convention)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit IqMaxPu "Maximum reactive current injection in pu (base UNom, SNom) (generator convention)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit IqMinPu "Minimum reactive current injection in pu (base UNom, SNom) (generator convention)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit IqPostPu "Post-fault reactive current injection in pu (base UNom, SNom) (generator convention)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kiq "Reactive power PI controller integration gain in pu/s (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kiu "Voltage PI controller integration gain in pu/s (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kpq "Reactive power PI controller proportional gain in pu (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kpu "Voltage PI controller proportional gain in pu (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.PerUnit Kqv "Voltage scaling factor for FRT current in pu (base UNom, SNom)" annotation(Dialog(tab = "QControl"));
  parameter Integer MqG "General Q control mode (0-4): Voltage control (0), Reactive power control (1), Open loop reactive power control (2), Power factor control (3), Open loop power factor control (4)" annotation(Dialog(tab = "QControl"));
  parameter Types.Time tPost "Length of time period where post-fault reactive power is injected, in s" annotation(Dialog(tab = "QControl"));
  parameter Types.Time tQord "Reactive power order lag time constant in s" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu UMaxPu "Maximum voltage in voltage PI controller integral term in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu UMinPu "Minimum voltage in voltage PI controller integral term in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu UqDipPu "Voltage threshold for UVRT detection in Q control in pu (base UNom)" annotation(Dialog(tab = "QControl"));
  parameter Types.VoltageModulePu URef0Pu "User-defined bias in voltage reference in pu (base UNom)" annotation(Dialog(tab = "QControl"));
end QControlWTBase;

record RDropXDrop
  parameter Types.PerUnit RDropPu "Resistive component of voltage drop impedance in pu (base UNom, SNom)" annotation(  Dialog(tab = "QControl"));
  parameter Types.PerUnit XDropPu "Inductive component of voltage drop impedance in pu (base UNom, SNom)" annotation(  Dialog(tab = "QControl"));

end RDropXDrop; 

record TableCurrentLimit
  parameter Real TableIpMaxUwt11 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt12 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt21 = 0.1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt22 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt31 = 0.15 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt32 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt41 = 0.9 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt42 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt51 = 0.925 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt52 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt61 = 1.075 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt62 = 1.0001 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt71 = 1.1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt72 = 1.0001 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIpMaxUwt[:,:] = [TableIpMaxUwt11, TableIpMaxUwt12; TableIpMaxUwt21, TableIpMaxUwt22; TableIpMaxUwt31, TableIpMaxUwt32; TableIpMaxUwt41, TableIpMaxUwt42; TableIpMaxUwt51, TableIpMaxUwt52; TableIpMaxUwt61, TableIpMaxUwt62; TableIpMaxUwt71, TableIpMaxUwt72] "Voltage dependency of active current limits" annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));

  parameter Real TableIqMaxUwt11 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt12 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt21 = 0.1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt22 = 0 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt31 = 0.15 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt32 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt41 = 0.9 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt42 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt51 = 0.925 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt52 = 0.33 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt61 = 1.075 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt62 = 0.33 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt71 = 1.1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt72 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt81 = 1.1001 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt82 = 1 annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
  parameter Real TableIqMaxUwt[:,:] = [TableIqMaxUwt11, TableIqMaxUwt12; TableIqMaxUwt21, TableIqMaxUwt22; TableIqMaxUwt31, TableIqMaxUwt32; TableIqMaxUwt41, TableIqMaxUwt42; TableIqMaxUwt51, TableIqMaxUwt52; TableIqMaxUwt61, TableIqMaxUwt62; TableIqMaxUwt71, TableIqMaxUwt72; TableIqMaxUwt81, TableIqMaxUwt82] "Voltage dependency of reactive current limits" annotation(Dialog(tab = "CurrentLimiter", group = "Tables"));
end TableCurrentLimit;

record TableGridProtection
  parameter Real TabletUoverUwtfilt11 = 1 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt12 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt21 = 1.5 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt22 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt31 = 2 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt32 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt41 = 2.01 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt42 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt51 = 2.02 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt52 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt61 = 2.03 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt62 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt71 = 2.04 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt72 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt81 = 2.05 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt82 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUoverUwtfilt[:,:] = [TabletUoverUwtfilt11, TabletUoverUwtfilt12; TabletUoverUwtfilt21, TabletUoverUwtfilt22; TabletUoverUwtfilt31, TabletUoverUwtfilt32; TabletUoverUwtfilt41, TabletUoverUwtfilt42; TabletUoverUwtfilt51, TabletUoverUwtfilt52; TabletUoverUwtfilt61, TabletUoverUwtfilt62; TabletUoverUwtfilt71, TabletUoverUwtfilt72; TabletUoverUwtfilt81, TabletUoverUwtfilt82] "Disconnection time versus over voltage lookup table" annotation(Dialog(tab = "Protection", group = "Tables"));

  parameter Real TabletUunderUwtfilt11 = 0 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt12 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt21 = 0.5 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt22 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt31 = 1 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt32 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt41 = 1.01 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt42 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt51 = 1.02 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt52 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt61 = 1.03 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt62 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt71 = 1.04 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt72 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real TabletUunderUwtfilt[:,:] = [TabletUunderUwtfilt11, TabletUunderUwtfilt12; TabletUunderUwtfilt21, TabletUunderUwtfilt22; TabletUunderUwtfilt31, TabletUunderUwtfilt32; TabletUunderUwtfilt41, TabletUunderUwtfilt42; TabletUunderUwtfilt51, TabletUunderUwtfilt52; TabletUunderUwtfilt61, TabletUunderUwtfilt62; TabletUunderUwtfilt71, TabletUunderUwtfilt72] "Disconnection time versus under voltage lookup table" annotation(Dialog(tab = "Protection", group = "Tables"));

  parameter Real Tabletfoverfwtfilt11 = 1 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt12 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt21 = 1.5 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt22 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt31 = 2 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt32 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt41 = 2.01 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt42 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfoverfwtfilt[:,:] = [Tabletfoverfwtfilt11, Tabletfoverfwtfilt12; Tabletfoverfwtfilt21, Tabletfoverfwtfilt22; Tabletfoverfwtfilt31, Tabletfoverfwtfilt32; Tabletfoverfwtfilt41, Tabletfoverfwtfilt42] "Disconnection time versus over frequency lookup table" annotation(Dialog(tab = "Protection", group = "Tables"));

  parameter Real Tabletfunderfwtfilt11 = 0 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt12 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt21 = 0.5 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt22 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt31 = 1 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt32 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt41 = 1.01 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt42 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt51 = 1.02 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt52 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt61 = 1.03 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt62 = 0.33 annotation(Dialog(tab = "Protection", group = "Tables"));
  parameter Real Tabletfunderfwtfilt[:,:] = [Tabletfunderfwtfilt11, Tabletfunderfwtfilt12; Tabletfunderfwtfilt21, Tabletfunderfwtfilt22; Tabletfunderfwtfilt31, Tabletfunderfwtfilt32; Tabletfunderfwtfilt41, Tabletfunderfwtfilt42; Tabletfunderfwtfilt51, Tabletfunderfwtfilt52; Tabletfunderfwtfilt61, Tabletfunderfwtfilt62] "Disconnection time versus under frequency lookup table" annotation(Dialog(tab = "Protection", group = "Tables"));
end TableGridProtection;

record TablePControl
  parameter Real TablePwpBiasfwpFiltCom11 = 0.95 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom12 = 1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom21 = 1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom22 = 0 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom31 = 1.05 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom32 = -1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom41 = 1.06 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom42 = -1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom51 = 1.07 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom52 = -1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom61 = 1.08 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom62 = -1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom71 = 1.09 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom72 = -1 annotation(Dialog(tab = "PControl", group = "Tables"));
  parameter Real TablePwpBiasfwpFiltCom[:,:] = [TablePwpBiasfwpFiltCom11, TablePwpBiasfwpFiltCom12; TablePwpBiasfwpFiltCom21, TablePwpBiasfwpFiltCom22; TablePwpBiasfwpFiltCom31, TablePwpBiasfwpFiltCom32; TablePwpBiasfwpFiltCom41, TablePwpBiasfwpFiltCom42; TablePwpBiasfwpFiltCom51, TablePwpBiasfwpFiltCom52; TablePwpBiasfwpFiltCom61, TablePwpBiasfwpFiltCom62; TablePwpBiasfwpFiltCom71, TablePwpBiasfwpFiltCom72] "Table for defining power variation versus frequency" annotation(Dialog(tab = "PControl", group = "Tables"));
end TablePControl;

record TableQControl2015
  parameter Real TableQwpUErr11 = -0.05 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr12 = 1.21 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr21 = 0 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr22 = 0.21 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr31 = 0.05 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr32 = -0.79 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr41 = 0.06 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr42 = -0.79 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr51 = 0.07 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr52 = -0.79 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr61 = 0.08 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr62 = -0.79 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr[:,:] = [TableQwpUErr11, TableQwpUErr12; TableQwpUErr21, TableQwpUErr22; TableQwpUErr31, TableQwpUErr32; TableQwpUErr41, TableQwpUErr42; TableQwpUErr51, TableQwpUErr52; TableQwpUErr61, TableQwpUErr62] "Table for the UQ static mode" annotation(Dialog(tab = "QControlWP", group = "Tables"));
end TableQControl2015;

record TableQControl2020
  parameter Real TableQwpMaxPwpFiltCom11 = 0 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom12 = 0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom21 = 0.5 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom22 = 0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom31 = 1 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom32 = 0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMaxPwpFiltCom[:,:] = [TableQwpMaxPwpFiltCom11, TableQwpMaxPwpFiltCom12; TableQwpMaxPwpFiltCom21, TableQwpMaxPwpFiltCom22; TableQwpMaxPwpFiltCom31, TableQwpMaxPwpFiltCom32] "Power dependent reactive power maximum limit" annotation(Dialog(tab = "QControlWP", group = "Tables"));

  parameter Real TableQwpMinPwpFiltCom11 = 0 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom12 = -0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom21 = 0.5 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom22 = -0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom31 = 1 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom32 = -0.33 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpMinPwpFiltCom[:,:] = [TableQwpMinPwpFiltCom11, TableQwpMinPwpFiltCom12; TableQwpMinPwpFiltCom21, TableQwpMinPwpFiltCom22; TableQwpMinPwpFiltCom31, TableQwpMinPwpFiltCom32] "Power dependent reactive power minimum limit" annotation(Dialog(tab = "QControlWP", group = "Tables"));

  parameter Real TableQwpUErr11 = -0.05 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr12 = 1.21 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr21 = 0 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr22 = 0.21 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr31 = 0.05 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr32 = -0.79 annotation(Dialog(tab = "QControlWP", group = "Tables"));
  parameter Real TableQwpUErr[:,:] = [TableQwpUErr11, TableQwpUErr12; TableQwpUErr21, TableQwpUErr22; TableQwpUErr31, TableQwpUErr32] "Table for the UQ static mode" annotation(Dialog(tab = "QControlWP", group = "Tables"));
end TableQControl2020;

record TableQLimit
  parameter Real TableQMaxUwtcFilt11 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt12 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt21 = 0.001 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt22 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt31 = 0.8 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt32 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt41 = 1.2 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt42 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt51 = 1.21 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt52 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt61 = 1.22 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt62 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxUwtcFilt[:,:] = [TableQMaxUwtcFilt11, TableQMaxUwtcFilt12; TableQMaxUwtcFilt21, TableQMaxUwtcFilt22; TableQMaxUwtcFilt31, TableQMaxUwtcFilt32; TableQMaxUwtcFilt41, TableQMaxUwtcFilt42; TableQMaxUwtcFilt51, TableQMaxUwtcFilt52; TableQMaxUwtcFilt61, TableQMaxUwtcFilt62] "Voltage dependency of reactive power maximum limit" annotation(Dialog(tab = "QLimiter", group = "Tables"));

  parameter Real TableQMinUwtcFilt11 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt12 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt21 = 0.001 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt22 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt31 = 0.8 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt32 = -0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt41 = 1.2 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt42 = -0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinUwtcFilt[:,:] = [TableQMinUwtcFilt11, TableQMinUwtcFilt12; TableQMinUwtcFilt21, TableQMinUwtcFilt22; TableQMinUwtcFilt31, TableQMinUwtcFilt32; TableQMinUwtcFilt41, TableQMinUwtcFilt42] "Voltage dependency of reactive power minimum limit" annotation(Dialog(tab = "QLimiter", group = "Tables"));

  parameter Real TableQMaxPwtcFilt11 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt12 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt21 = 0.001 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt22 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt31 = 0.3 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt32 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt41 = 1 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt42 = 0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMaxPwtcFilt[:,:] = [TableQMaxPwtcFilt11, TableQMaxPwtcFilt12; TableQMaxPwtcFilt21, TableQMaxPwtcFilt22; TableQMaxPwtcFilt31, TableQMaxPwtcFilt32; TableQMaxPwtcFilt41, TableQMaxPwtcFilt42] "Active power dependency of reactive power maximum limit" annotation(Dialog(tab = "QLimiter", group = "Tables"));

  parameter Real TableQMinPwtcFilt11 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt12 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt21 = 0.001 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt22 = 0 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt31 = 0.3 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt32 = -0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt41 = 1 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt42 = -0.33 annotation(Dialog(tab = "QLimiter", group = "Tables"));
  parameter Real TableQMinPwtcFilt[:,:] = [TableQMinPwtcFilt11, TableQMinPwtcFilt12; TableQMinPwtcFilt21, TableQMinPwtcFilt22; TableQMinPwtcFilt31, TableQMinPwtcFilt32; TableQMinPwtcFilt41, TableQMinPwtcFilt42] "Active power dependency of reactive power minimum limit" annotation(Dialog(tab = "QLimiter", group = "Tables"));
end TableQLimit;

record QLimiter
  parameter Boolean QlConst "True if limits are constant" annotation(  Dialog(tab = "QLimiter"));
    parameter Types.ReactivePowerPu QMaxPu "Constant maximum reactive power at grid terminal in pu (base SNom) (generator convention)" annotation(  Dialog(tab = "QLimiter"));
    parameter Types.ReactivePowerPu QMinPu "Constant minimum reactive power at grid terminal in pu (base SNom) (generator convention)" annotation(  Dialog(tab = "QLimiter"));
end QLimiter;

record QLimiter2015
  parameter Types.Time tPFiltql "Filter time constant for active power measurement in s" annotation(Dialog(tab = "QLimiter"));
  parameter Types.Time tUFiltql "Filter time constant for voltage measurement in s" annotation(Dialog(tab = "QLimiter"));
end QLimiter2015;

record GridProtection
  parameter Types.PerUnit fOverPu "WT over frequency protection activation threshold in pu (base fNom)" annotation(Dialog(tab = "Protection", group = "Param"));
  parameter Types.PerUnit fUnderPu "WT under frequency protection activation threshold in pu (base fNom)" annotation(Dialog(tab = "Protection", group = "Param"));
  parameter Types.VoltageModulePu UOverPu "WT over voltage protection activation threshold in pu (base UNom)" annotation(Dialog(tab = "Protection", group = "Param"));
  parameter Types.VoltageModulePu UUnderPu "WT under voltage protection activation threshold in pu (base UNom)" annotation(Dialog(tab = "Protection", group = "Param"));
end GridProtection;

record UfMeasurement2015
  parameter Types.AngularVelocityPu DfMaxPu "Maximum frequency ramp rate in pu/s (base omegaNom)" annotation(Dialog(tab = "UfMeasurement"));
  parameter Boolean Mzc "Zero crossing measurement mode (true = 1 if the wind turbine protection system uses zero crossings to detect the frequency - otherwise false = 0)" annotation(Dialog(tab = "UfMeasurement"));
  parameter Types.Time tfFilt "Filter time constant for frequency measurement in s" annotation(Dialog(tab = "UfMeasurement"));
  parameter Types.Time tphiFilt "Filter time constant for voltage angle measurement in s" annotation(Dialog(tab = "UfMeasurement"));
  parameter Types.Time tUFilt "Filter time constant for voltage measurement in s" annotation(Dialog(tab = "UfMeasurement"));
end UfMeasurement2015;

annotation(
  preferredView = "text");
end Parameters;