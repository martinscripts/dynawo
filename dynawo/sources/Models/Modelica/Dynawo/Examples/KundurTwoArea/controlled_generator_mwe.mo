within Dynawo.Examples.KundurTwoArea;

model controlled_generator_mwe
  final parameter Dynawo.Types.VoltageModulePu U0GenPu = 0.99779;
  final parameter Dynawo.Types.Angle U0PhaseGen = -0.0697665;
  final parameter Dynawo.Types.VoltageModulePu loadU0ImPu = -0.103322;
  final parameter Dynawo.Types.VoltageModulePu loadU0RePu = 0.98165;
  
  Dynawo.Electrical.Buses.InfiniteBusWithVariations infiniteBusWithVariations(U0Pu = 1, UEvtPu = 0.5, UPhase = 0, omega0Pu = 1, omegaEvtPu = 1, tOmegaEvtEnd = 999999, tOmegaEvtStart = 99999, tUEvtEnd = 10.2, tUEvtStart = 10) annotation(
    Placement(visible = true, transformation(origin = {0, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Lines.Line line(RPu = 0, XPu = 0.05) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Dynawo.Electrical.Buses.Bus bus annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Dynawo.Electrical.Lines.Line line1(RPu = 0, XPu = 0.05) annotation(
    Placement(visible = true, transformation(origin = {30, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Dynawo.Electrical.Loads.LoadZIP loadZIP(Ip = 1, Iq = 0, Pp = 0, Pq = 0, Zp = 0, Zq = 1, i0Pu = Complex(0.7, 0.2), s0Pu = Complex(0.7, 0.2), u0Pu = Complex(loadU0RePu, loadU0ImPu)) annotation(
    Placement(visible = true, transformation(origin = {46, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  // params from nordic system: g06, Thermal
  Dynawo.Examples.BaseClasses.InitializedGeneratorSynchronousFourWindings Generator(DPu = 0, ExcitationPu = Dynawo.Electrical.Machines.OmegaRef.BaseClasses.GeneratorSynchronousParameters.ExcitationPuType.NoLoad, H = 6, P0Pu = 0.7, PNomAlt = 700, PNomTurb = 700, Q0Pu = -0.2, RTfPu = 0, RaPu = 0.0015, SNom = 1000, SnTfo = 1000, Tpd0 = 7.0, Tppd0 = 0.05, Tppq0 = 0.05, Tpq0 = 1.5, U0Pu = U0GenPu, UBaseHV = 15, UBaseLV = 15, UNom = 15, UNomHV = 15, UNomLV = 15, UPhase0 = U0PhaseGen, XTfPu = 0, XdPu = 2.20, XlPu = 0.15, XpdPu = 0.30, XppdPu = 0.20, XppqPu = 0.20, XpqPu = 0.4, XqPu = 2.00, md = 0.1, mq = 0.1, nd = 6.0257, nq = 6.0257) annotation(
    Placement(visible = true, transformation(origin = {-19, -37}, extent = {{-11, -11}, {11, 11}}, rotation = 0)));
  Dynawo.Electrical.Controls.Machines.VoltageRegulators.Standard.Dc1a avrDc1a(AEx = 0.0056, BEx = 1.075, Efd0Pu = Generator.Efd0Pu, Ka = 20, Ke = 1, Kf = 0.125, PositionUel = 0, Us0Pu = U0GenPu, VrMaxPu = 5, VrMinPu = -3, tA = 0.055, tB = 1e-9, tC = 1e-9, tE = 0.36, tF = 1.8, tR = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-18, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));


initial equation
  der(Generator.lambdafPu) = 0;
  der(Generator.lambdaDPu) = 0;
  der(Generator.lambdaQ1Pu) = 0;
  der(Generator.lambdaQ2Pu) = 0;
  der(Generator.theta) = 0;
  der(Generator.omegaPu.value) = 0;
  
equation
  loadZIP.PRefPu = 0.7;
  loadZIP.QRefPu = 0.2;
  loadZIP.deltaP = 0;
  loadZIP.deltaQ = 0;
  loadZIP.switchOffSignal1.value = false;
  loadZIP.switchOffSignal2.value = false;
  line.switchOffSignal1.value = false;
  line.switchOffSignal2.value = false;
  line1.switchOffSignal1.value = false;
  line1.switchOffSignal2.value = false;
  Generator.switchOffSignal1.value = false;
  Generator.switchOffSignal2.value = false;
  Generator.switchOffSignal3.value = false;
  Generator.efdPu.value = avrDc1a.EfdPu;
  Generator.UStatorPu.value = avrDc1a.UsPu;
  Generator.omegaRefPu.value = 1;
  Generator.PmPu.value = Generator.Pm0Pu;
  avrDc1a.UsRefPu = avrDc1a.UsRef0Pu;
  avrDc1a.UOelPu = avrDc1a.UOel0Pu;
  avrDc1a.UPssPu = 0;
  avrDc1a.USclOelPu = avrDc1a.USclOel0Pu;
  avrDc1a.USclUelPu = avrDc1a.USclUel0Pu;
  avrDc1a.UUelPu = avrDc1a.UUel0Pu;
  connect(line.terminal1, infiniteBusWithVariations.terminal) annotation(
    Line(points = {{0, 40}, {0, 60}}, color = {0, 0, 255}));
  connect(line.terminal2, bus.terminal) annotation(
    Line(points = {{0, 20}, {0, 0}}, color = {0, 0, 255}));
  connect(loadZIP.terminal, line1.terminal1) annotation(
    Line(points = {{46, -28}, {46, -12}, {40, -12}}, color = {0, 0, 255}));
  connect(line1.terminal2, bus.terminal) annotation(
    Line(points = {{20, -12}, {8, -12}, {8, 0}, {0, 0}}, color = {0, 0, 255}));
  connect(Generator.terminal, bus.terminal) annotation(
    Line(points = {{-18, -36}, {-18, -10}, {-8, -10}, {-8, 0}, {0, 0}}, color = {0, 0, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 20, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_commandLineOptions = "--matchingAlgorithm=PFPlusExt --indexReductionMethod=dynamicStateSelection -d=initialization,NLSanalyticJacobian --daemode",
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "euler"));
end controlled_generator_mwe;
