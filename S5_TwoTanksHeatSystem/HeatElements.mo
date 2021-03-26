model HeatElementBase_Failures  
  extends SuperModel_Heat;
  replaceable package Medium = Modelica.Media.Water.StandardWater constrainedby Modelica.Media.Interfaces.PartialMedium;
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 1), nPorts = 5, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5)}, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {-60, 26}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source_warm(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(90), nPorts = 1, p = system.p_ambient, use_T = true) 
  annotation(
    Placement(visible = true, transformation(origin = {-238, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear3(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-136, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-222, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = valve3_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-158, 104}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-212, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_HeatTransfer = true, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-186, 108}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = pump_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-214, 132}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-164, 86}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink_warm(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(90), nPorts = 2, p = system.p_ambient, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-220, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-132, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = valve1_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-206, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-104, 6}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-180, 4}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Machines.PrescribedPump pump1(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_HeatTransfer = true, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Machines.PrescribedPump pump2(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_HeatTransfer = true, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {8, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 1), nPorts = 5, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5)}, use_HeatTransfer = true) annotation(
    Placement(visible = true, transformation(origin = {72, 30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {54, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.FixedBoundary sink_cold(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 2, p = system.p_ambient, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {206, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = pump2_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-16, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = pump1_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {-16, -48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source_cold(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 2, p = system.p_ambient, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {206, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {160, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {92, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {126, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe8(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {110, 94}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe9(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {172, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveLinear valveLinear4(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {86, 76}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = valve2_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {106, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression7(y = valve4_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {118, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Machines.PrescribedPump pump3(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_HeatTransfer = true, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {142, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression8(y = pump3_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {142, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe10(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {52, -94}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe11(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-24, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveLinear valveLinear5(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-126, -62}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression9(y = valve5_leak) annotation(
    Placement(visible = true, transformation(origin = {-168, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear6(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {86, -88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression10(y = valve6_leak) annotation(
    Placement(visible = true, transformation(origin = {130, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression13(y = temp_tank)  annotation(
    Placement(visible = true, transformation(origin = {-28, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature2 annotation(
    Placement(visible = true, transformation(origin = {18, 32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.PrescribedTemperature prescribedTemperature1 annotation(
    Placement(visible = true, transformation(origin = {-118, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression12(y = temp_tank1)  annotation(
    Placement(visible = true, transformation(origin = {-168, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(pipe11.port_b, tank1.ports[3]) annotation(
    Line(points = {{-34, -20}, {-48, -20}, {-48, 6}, {-60, 6}}, color = {0, 127, 255}));
  connect(pipe11.port_a, pump1.port_b) annotation(
    Line(points = {{-14, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(realExpression5.y, pump1.N_in) annotation(
    Line(points = {{-5, -48}, {2, -48}, {2, -48}, {9, -48}, {9, -30}, {9, -30}}, color = {0, 0, 127}));
  connect(pipe1.port_b, pump1.port_a) annotation(
    Line(points = {{44, -20}, {32, -20}, {32, -20}, {20, -20}, {20, -20}, {20, -20}, {20, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(pipe1.port_a, tank.ports[1]) annotation(
    Line(points = {{64, -20}, {71, -20}, {71, 10}, {72, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_b, tank.ports[2]) annotation(
    Line(points = {{62, -94}, {62, -40}, {72, -40}, {72, 10}}, color = {0, 127, 255}));
  connect(pipe10.port_a, pump2.port_b) annotation(
    Line(points = {{42, -94}, {18, -94}}, color = {0, 127, 255}));
  connect(realExpression4.y, pump2.N_in) annotation(
    Line(points = {{-5, -68}, {3, -68}, {3, -84}, {7, -84}, {7, -84}, {7, -84}, {7, -84}}, color = {0, 0, 127}));
  connect(tank1.ports[4], pipe5.port_a) annotation(
    Line(points = {{-60, 6}, {-60, -94}}, color = {0, 127, 255}));
  connect(pipe5.port_b, pump2.port_a) annotation(
    Line(points = {{-40, -94}, {-2, -94}}, color = {0, 127, 255}));  
  when time > 100 then
    reinit(tank.level, 0.8);
    reinit(tank1.level, 0.8);
  end when;

  connect(tank.heatPort, prescribedTemperature2.port) annotation(
    Line(points = {{52, 30}, {28, 30}, {28, 32}, {28, 32}}, color = {191, 0, 0}));
  connect(tank1.heatPort, prescribedTemperature1.port) annotation(
    Line(points = {{-80, 26}, {-108, 26}, {-108, 34}, {-108, 34}}, color = {191, 0, 0}));
  connect(realExpression12.y, prescribedTemperature1.T) annotation(
    Line(points = {{-156, 38}, {-128, 38}, {-128, 34}, {-130, 34}, {-130, 34}}, color = {0, 0, 127}));
  connect(realExpression13.y, prescribedTemperature2.T) annotation(
    Line(points = {{-16, 32}, {4, 32}, {4, 32}, {6, 32}}, color = {0, 0, 127}));
  connect(realExpression10.y, valveLinear6.opening) annotation(
    Line(points = {{120, -72}, {86, -72}, {86, -80}, {86, -80}}, color = {0, 0, 127}));
  connect(valveLinear6.port_b, sink_cold.ports[2]) annotation(
    Line(points = {{96, -88}, {196, -88}, {196, -32}, {196, -32}}, color = {0, 127, 255}));
  connect(tank.ports[5], valveLinear6.port_a) annotation(
    Line(points = {{72, 10}, {76, 10}, {76, -88}}, color = {0, 127, 255}));
  connect(tank.ports[4], pipe7.port_a) annotation(
    Line(points = {{72, 10}, {82, 10}, {82, -30}}, color = {0, 127, 255}));
  connect(realExpression9.y, valveLinear5.opening) annotation(
    Line(points = {{-156, -84}, {-128, -84}, {-128, -70}, {-126, -70}, {-126, -70}}, color = {0, 0, 127}));
  connect(valveLinear5.port_b, sink_warm.ports[2]) annotation(
    Line(points = {{-136, -62}, {-212, -62}, {-212, 4}, {-210, 4}}, color = {0, 127, 255}));
  connect(tank1.ports[5], valveLinear5.port_a) annotation(
    Line(points = {{-60, 6}, {-116, 6}, {-116, -62}, {-116, -62}}, color = {0, 127, 255}));
  connect(source_cold.ports[1], pipe9.port_a) annotation(
    Line(points = {{196, 92}, {182, 92}}, color = {0, 127, 255}));
  connect(pipe6.port_b, sink_cold.ports[1]) annotation(
    Line(points = {{170, -32}, {196, -32}}, color = {0, 127, 255}));
  connect(realExpression8.y, pump3.N_in) annotation(
    Line(points = {{142, 65}, {142, 82}}, color = {0, 0, 127}));
  connect(pump3.port_a, pipe9.port_b) annotation(
    Line(points = {{152, 92}, {162, 92}, {162, 92}, {162, 92}}, color = {0, 127, 255}));
  connect(pump3.port_b, pipe8.port_a) annotation(
    Line(points = {{132, 92}, {120, 92}, {120, 94}, {120, 94}}, color = {0, 127, 255}));
  connect(realExpression7.y, valveLinear4.opening) annotation(
    Line(points = {{118, 53}, {119, 53}, {119, 76}, {94, 76}}, color = {0, 0, 127}));
  connect(valveLinear4.port_b, tank.ports[3]) annotation(
    Line(points = {{86, 66}, {78, 66}, {78, 10}, {72, 10}}, color = {0, 127, 255}));
  connect(pipe8.port_b, valveLinear4.port_a) annotation(
    Line(points = {{100, 94}, {86, 94}, {86, 86}, {86, 86}}, color = {0, 127, 255}));
  connect(realExpression6.y, valveLinear2.opening) annotation(
    Line(points = {{118, -2}, {126, -2}, {126, -22}, {126, -22}}, color = {0, 0, 127}));
  connect(valveLinear2.port_b, pipe6.port_a) annotation(
    Line(points = {{136, -30}, {136, -33}, {150, -33}, {150, -32}}, color = {0, 127, 255}));
  connect(pipe7.port_b, valveLinear2.port_a) annotation(
    Line(points = {{102, -30}, {116, -30}}, color = {0, 127, 255}));
  connect(valveLinear3.port_b, tank1.ports[1]) annotation(
    Line(points = {{-126, 70}, {-64, 70}, {-64, 8}, {-60, 8}, {-60, 6}}, color = {0, 127, 255}));
  connect(pipe3.port_b, sink_warm.ports[1]) annotation(
    Line(points = {{-190, 4}, {-210, 4}}, color = {0, 127, 255}));
  connect(pipe3.port_a, valveLinear1.port_b) annotation(
    Line(points = {{-170, 4}, {-142, 4}, {-142, 6}, {-142, 6}}, color = {0, 127, 255}));
  connect(realExpression3.y, valveLinear1.opening) annotation(
    Line(points = {{-194, -30}, {-132, -30}, {-132, -2}}, color = {0, 0, 127}));
  connect(pipe2.port_b, valveLinear1.port_a) annotation(
    Line(points = {{-114, 6}, {-122, 6}}, color = {0, 127, 255}));
  connect(tank1.ports[2], pipe2.port_a) annotation(
    Line(points = {{-60, 6}, {-94, 6}}, color = {0, 127, 255}));
  connect(realExpression2.y, valveLinear3.opening) annotation(
    Line(points = {{-147, 104}, {-136, 104}, {-136, 78}}, color = {0, 0, 127}));
  connect(valveLinear3.port_a, pipe.port_b) annotation(
    Line(points = {{-146, 70}, {-146, 86}, {-154, 86}}, color = {0, 127, 255}));
  connect(pump.port_b, pipe.port_a) annotation(
    Line(points = {{-176, 108}, {-176, 109}, {-174, 109}, {-174, 86}}, color = {0, 127, 255}));
  connect(realExpression1.y, pump.N_in) annotation(
    Line(points = {{-203, 132}, {-184.5, 132}, {-184.5, 118}, {-186, 118}}, color = {0, 0, 127}));
  connect(pipe4.port_b, pump.port_a) annotation(
    Line(points = {{-202, 108}, {-196, 108}}, color = {0, 127, 255}));
  connect(source_warm.ports[1], pipe4.port_a) annotation(
    Line(points = {{-228, 108}, {-222, 108}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end HeatElementBase_Failures;
