model three_tanks_pumps_stable
  extends SuperModel_three_tanks;
  
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-162, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {-210, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 4, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {202, -20}, extent = {{12, 12}, {-12, -12}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-180, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.25, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {6, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {56, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {30, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = valve1_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {10, 82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-152, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = pump0_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-174, 64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, crossArea = 1, height = 1, level(fixed = true, start = 0.5), nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {108, 28}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump1(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {180, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {206, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {230, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = 820) annotation(
    Placement(visible = true, transformation(origin = {158, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, crossArea = 1, height = 1, level(fixed = true, start = 0.5), nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-62, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-116, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-96, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank2(redeclare package Medium = Medium, crossArea = 1, height = 1, level(fixed = true, start = 0.5), nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-42, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {26, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear3(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {50, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = valve3_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {30, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = Medium, diameter = 0.25, length = 1) annotation(
    Placement(visible = true, transformation(origin = {76, -38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_fault_tank2(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {12, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valve_fault_tank1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 40) annotation(
    Placement(visible = true, transformation(origin = {-58, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = valve_fault_tank2_real) annotation(
    Placement(visible = true, transformation(origin = {20, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = valve_fault_tank1_real) annotation(
    Placement(visible = true, transformation(origin = {-82, 134}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression7(y = valve2_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {206, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(valve_fault_tank1.port_b, sink.ports[4]) annotation(
    Line(points = {{-48, 118}, {136, 118}, {136, -50}, {166, -50}, {166, -22}, {190, -22}, {190, -20}}, color = {0, 127, 255}));
  connect(tank1.ports[3], valve_fault_tank1.port_a) annotation(
    Line(points = {{-62, 10}, {-64, 10}, {-64, -12}, {-26, -12}, {-26, 82}, {-68, 82}, {-68, 118}, {-68, 118}}, color = {0, 127, 255}));
  connect(realExpression5.y, valveLinear3.opening) annotation(
    Line(points = {{42, -8}, {50, -8}, {50, -30}, {50, -30}}, color = {0, 0, 127}));
  connect(realExpression3.y, valve_fault_tank2.opening) annotation(
    Line(points = {{32, -82}, {38, -82}, {38, -104}, {12, -104}, {12, -104}}, color = {0, 0, 127}));
  connect(valve_fault_tank2.port_b, sink.ports[3]) annotation(
    Line(points = {{22, -112}, {190, -112}, {190, -20}, {190, -20}}, color = {0, 127, 255}));
  connect(tank2.ports[3], valve_fault_tank2.port_a) annotation(
    Line(points = {{-42, -80}, {-42, -80}, {-42, -112}, {2, -112}, {2, -112}}, color = {0, 127, 255}));
  connect(realExpression7.y, valveLinear2.opening) annotation(
    Line(points = {{218, 48}, {230, 48}, {230, 22}, {230, 22}}, color = {0, 0, 127}));
  connect(realExpression2.y, pump.N_in) annotation(
    Line(points = {{-162, 64}, {-152, 64}, {-152, 44}, {-152, 44}}, color = {0, 0, 127}));
  connect(realExpression6.y, valve_fault_tank1.opening) annotation(
    Line(points = {{-70, 134}, {-58, 134}, {-58, 126}, {-58, 126}}, color = {0, 0, 127}));
  connect(pipe7.port_b, sink.ports[2]) annotation(
    Line(points = {{86, -38}, {150, -38}, {150, -20}, {190, -20}, {190, -20}}, color = {0, 127, 255}));
  connect(valveLinear3.port_b, pipe7.port_a) annotation(
    Line(points = {{60, -38}, {66, -38}, {66, -38}, {66, -38}}, color = {0, 127, 255}));
  connect(pipe6.port_b, valveLinear3.port_a) annotation(
    Line(points = {{36, -38}, {40, -38}, {40, -38}, {40, -38}}, color = {0, 127, 255}));
  connect(tank2.ports[2], pipe6.port_a) annotation(
    Line(points = {{-42, -80}, {-28, -80}, {-28, -92}, {2, -92}, {2, -38}, {16, -38}, {16, -38}}, color = {0, 127, 255}));
  connect(pipe5.port_b, tank2.ports[1]) annotation(
    Line(points = {{-86, -88}, {-48, -88}, {-48, -80}, {-42, -80}}, color = {0, 127, 255}));
  connect(pump.port_b, pipe5.port_a) annotation(
    Line(points = {{-142, 34}, {-136, 34}, {-136, -88}, {-106, -88}, {-106, -88}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank1.ports[1]) annotation(
    Line(points = {{-106, 2}, {-68, 2}, {-68, 10}, {-62, 10}}, color = {0, 127, 255}));
  connect(pump.port_b, pipe4.port_a) annotation(
    Line(points = {{-142, 34}, {-136, 34}, {-136, 2}, {-126, 2}, {-126, 2}}, color = {0, 127, 255}));
  connect(tank1.ports[2], pipe1.port_a) annotation(
    Line(points = {{-62, 10}, {-58, 10}, {-58, 10}, {-4, 10}, {-4, 52}, {-4, 52}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump.port_a) annotation(
    Line(points = {{-170, 34}, {-166, 34}, {-166, 34}, {-162, 34}, {-162, 34}, {-162, 34}, {-162, 34}, {-162, 34}}, color = {0, 127, 255}));
  connect(source.ports[1], pipe.port_a) annotation(
    Line(points = {{-200, 34}, {-190, 34}, {-190, 34}, {-190, 34}}, color = {0, 127, 255}));
  connect(realExpression4.y, pump1.N_in) annotation(
    Line(points = {{170, 44}, {180, 44}, {180, 24}, {180, 24}}, color = {0, 0, 127}));
  connect(valveLinear2.port_b, sink.ports[1]) annotation(
    Line(points = {{240, 14}, {248, 14}, {248, -4}, {184, -4}, {184, -18}, {190, -18}, {190, -20}}, color = {0, 127, 255}));
  connect(pipe3.port_b, valveLinear2.port_a) annotation(
    Line(points = {{216, 14}, {220, 14}, {220, 14}, {220, 14}}, color = {0, 127, 255}));
  connect(pump1.port_b, pipe3.port_a) annotation(
    Line(points = {{190, 14}, {196, 14}, {196, 14}, {196, 14}}, color = {0, 127, 255}));
  connect(tank.ports[1], pump1.port_a) annotation(
    Line(points = {{108, 8}, {110, 8}, {110, -4}, {160, -4}, {160, 14}, {170, 14}, {170, 14}}, color = {0, 127, 255}));
  connect(pipe2.port_b, tank.ports[2]) annotation(
    Line(points = {{66, 52}, {76, 52}, {76, -6}, {102, -6}, {102, 8}, {108, 8}}, color = {0, 127, 255}));
  connect(realExpression1.y, valveLinear1.opening) annotation(
    Line(points = {{21, 82}, {30, 82}, {30, 60}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, pipe2.port_a) annotation(
    Line(points = {{40, 52}, {46, 52}, {46, 52}, {46, 52}}, color = {0, 127, 255}));
  connect(pipe1.port_b, valveLinear1.port_a) annotation(
    Line(points = {{16, 52}, {20, 52}, {20, 52}, {20, 52}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end three_tanks_pumps_stable;
