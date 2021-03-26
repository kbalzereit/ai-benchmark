model a_tank_stable
   extends SuperModel;
   
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-162, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {-210, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 2, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {192, -48}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-180, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.45, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {76, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {126, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {100, -52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = valve1_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {80, -22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-152, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = pump0_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-174, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 1), nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.75, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {16, -22}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-116, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_fault_tank1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {64, -114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = valve_fault_tank1_real) annotation(
    Placement(visible = true, transformation(origin = {38, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve0(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-66, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = valve0_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-82, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(realExpression3.y, valve0.opening) annotation(
    Line(points = {{-70, 20}, {-66, 20}, {-66, -20}, {-66, -20}}, color = {0, 0, 127}));
  connect(valve0.port_b, tank1.ports[1]) annotation(
    Line(points = {{-56, -28}, {-22, -28}, {-22, -60}, {12, -60}, {12, -42}, {16, -42}}, color = {0, 127, 255}));
  connect(pipe4.port_b, valve0.port_a) annotation(
    Line(points = {{-106, 2}, {-86, 2}, {-86, -28}, {-76, -28}, {-76, -28}}, color = {0, 127, 255}));
  connect(tank1.ports[2], valve_fault_tank1.port_a) annotation(
    Line(points = {{16, -42}, {18, -42}, {18, -114}, {54, -114}, {54, -114}}, color = {0, 127, 255}));
  connect(tank1.ports[3], pipe1.port_a) annotation(
    Line(points = {{16, -42}, {20, -42}, {20, -52}, {66, -52}, {66, -52}}, color = {0, 127, 255}));
  connect(valve_fault_tank1.port_b, sink.ports[2]) annotation(
    Line(points = {{74, -114}, {180, -114}, {180, -48}, {180, -48}}, color = {0, 127, 255}));
  connect(realExpression6.y, valve_fault_tank1.opening) annotation(
    Line(points = {{49, -94}, {64, -94}, {64, -106}}, color = {0, 0, 127}));
  connect(pipe2.port_b, sink.ports[1]) annotation(
    Line(points = {{136, -52}, {180, -52}, {180, -48}, {180, -48}}, color = {0, 127, 255}));
  connect(realExpression1.y, valve1.opening) annotation(
    Line(points = {{91, -22}, {95.5, -22}, {95.5, -22}, {100, -22}, {100, -33}, {100, -33}, {100, -44}}, color = {0, 0, 127}));
  connect(pipe1.port_b, valve1.port_a) annotation(
    Line(points = {{86, -52}, {88, -52}, {88, -52}, {90, -52}, {90, -52}, {90, -52}}, color = {0, 127, 255}));
  connect(valve1.port_b, pipe2.port_a) annotation(
    Line(points = {{110, -52}, {113, -52}, {113, -52}, {116, -52}, {116, -52}, {117, -52}, {117, -52}, {116, -52}}, color = {0, 127, 255}));
  connect(realExpression2.y, pump.N_in) annotation(
    Line(points = {{-162, 64}, {-152, 64}, {-152, 44}, {-152, 44}}, color = {0, 0, 127}));

  connect(pump.port_b, pipe4.port_a) annotation(
    Line(points = {{-142, 34}, {-136, 34}, {-136, 2}, {-126, 2}, {-126, 2}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump.port_a) annotation(
    Line(points = {{-170, 34}, {-166, 34}, {-166, 34}, {-162, 34}, {-162, 34}, {-162, 34}, {-162, 34}, {-162, 34}}, color = {0, 127, 255}));
  connect(source.ports[1], pipe.port_a) annotation(
    Line(points = {{-200, 34}, {-190, 34}, {-190, 34}, {-190, 34}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end a_tank_stable;
