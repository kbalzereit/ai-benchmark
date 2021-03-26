model four_tanks_stable
  extends SuperModel_four_tanks;
  replaceable package Medium = Modelica.Media.Water.StandardWater;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-162, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
Modelica.Fluid.Sources.FixedBoundary source(redeclare package Medium = Modelica.Media.Water.StandardWater, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {-210, 34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Modelica.Media.Water.StandardWater, crossArea = 2, height = 15, level_start = 2, nPorts = 5, portsData =         {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 12), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.3, height = 2), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.3, height = 1), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.3, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 1, height = 10)}) annotation(
    Placement(visible = true, transformation(origin = {-22, 94}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank2(redeclare package Medium = Modelica.Media.Water.StandardWater, crossArea = 2, height = 10, level_start = 2, nPorts = 4, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 7), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.28, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 1, height = 5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-108, -8}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank3(redeclare package Medium = Modelica.Media.Water.StandardWater, crossArea = 2, height = 10, level_start = 2, nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.2, height = 7), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.3, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 1, height = 5)}) annotation(
    Placement(visible = true, transformation(origin = {80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank4(redeclare package Medium = Modelica.Media.Water.StandardWater, crossArea = 2, height = 15, level_start = 2, nPorts = 5, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.28, height = 12), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.3, height = 12), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 1, height = 10), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-10, -102}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.2, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-44, 154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.3, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-110, 32}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(replaceable package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.3, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {84, 38}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.28, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-50, -122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.3, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-4, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.5, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {120, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 0.3, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {108, 118}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT sink(redeclare package Medium = Modelica.Media.Water.StandardWater, nPorts = 6, p = system.p_ambient) annotation(
    Placement(visible = true, transformation(origin = {246, -144}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-106, 154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, 170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-76, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-64, 46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear3(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {38, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = valve3) annotation(
    Placement(visible = true, transformation(origin = {28, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-108, -68}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = 1) annotation(
    Placement(visible = true, transformation(origin = {-146, -68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear5(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {38, -30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = 1) annotation(
    Placement(visible = true, transformation(origin = {70, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));  
  Modelica.Fluid.Valves.ValveLinear valveLinear6(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {28, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = valve6_jammed) annotation(
    Placement(visible = true, transformation(origin = {26, -130}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear7(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {4, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression7(y = 0) annotation(
    Placement(visible = true, transformation(origin = {-12, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tank1_overflow(threshold = 0.0001)  annotation(
    Placement(visible = true, transformation(origin = {46, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe overflow1(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 1, height_ab = -1, length = 1, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {158, 144}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {20, 144}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tank2_overflow(threshold = 0.0001)  annotation(
    Placement(visible = true, transformation(origin = {-30, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe overflow2(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 1, height_ab = -1, length = 1, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {150, -50}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {-20, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tank3_overflow(threshold = 0.0001)  annotation(
    Placement(visible = true, transformation(origin = {138, 24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe overflow3(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 1, height_ab = -1, length = 1, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {188, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate3(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {122, -4}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.GreaterThreshold tank4_overflow(threshold = 0.0001)  annotation(
    Placement(visible = true, transformation(origin = {88, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe overflow4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true, diameter = 1, height_ab = -1, length = 1, m_flow_start = 0) annotation(
    Placement(visible = true, transformation(origin = {128, -112}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {58, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_source_tank1(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {-72, 154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_tank1_tank3(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {74, 72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_tank1_tank2(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {-110, 64}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_tank3_tank4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {38, -56}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_tank2_tank4(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {-108, -112}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_tank4_sink(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {72, -162}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate_bridge(redeclare package Medium = Modelica.Media.Water.StandardWater, allowFlowReversal = true) annotation(
    Placement(visible = true, transformation(origin = {54, 124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete1(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-78, -124}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = pipe4_flow_bool)  annotation(
    Placement(visible = true, transformation(origin = {-82, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear8(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 1, m_flow_nominal = 0.05) annotation(
    Placement(visible = true, transformation(origin = {-154, -18}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Blocks.Sources.RealExpression realExpression8(y = tank2_leak_bool) annotation(
    Placement(visible = true, transformation(origin = {-184, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate5(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-184, -84}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Modelica.Media.Water.StandardWater, diameter = 0.5, height_ab = -1, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-180, -132}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(pipe.port_b, sink.ports[6]) annotation(
    Line(points = {{-180, -142}, {236, -142}, {236, -144}, {236, -144}}, color = {0, 127, 255}));
  connect(volumeFlowRate5.port_b, pipe.port_a) annotation(
    Line(points = {{-184, -94}, {-180, -94}, {-180, -122}, {-180, -122}}, color = {0, 127, 255}));
  connect(valveLinear8.port_b, volumeFlowRate5.port_a) annotation(
    Line(points = {{-164, -18}, {-186, -18}, {-186, -74}, {-184, -74}}, color = {0, 127, 255}));
  connect(valveLinear8.opening, realExpression8.y) annotation(
    Line(points = {{-154, -10}, {-174, -10}, {-174, 8}, {-172, 8}}, color = {0, 0, 127}));
  connect(valveLinear8.port_a, tank2.ports[4]) annotation(
    Line(points = {{-144, -18}, {-110, -18}, {-110, -28}, {-108, -28}}, color = {0, 127, 255}));
  connect(pipe2.port_b, tank2.ports[1]) annotation(
    Line(points = {{-110, 22}, {-110, 8}, {-108, 8}, {-108, -28}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_a, tank2.ports[3]) annotation(
    Line(points = {{-30, -28}, {-108, -28}}, color = {0, 127, 255}));
  connect(tank2.ports[2], valveLinear4.port_a) annotation(
    Line(points = {{-108, -28}, {-108, -58}}, color = {0, 127, 255}));
  connect(booleanExpression1.y, valveDiscrete1.open) annotation(
    Line(points = {{-70, -84}, {-78, -84}, {-78, -116}, {-78, -116}}, color = {255, 0, 255}));
  connect(valveDiscrete1.port_a, volumeFlowRate_tank2_tank4.port_b) annotation(
    Line(points = {{-88, -124}, {-108, -124}, {-108, -122}, {-108, -122}, {-108, -122}}, color = {0, 127, 255}));
  connect(pipe4.port_a, valveDiscrete1.port_b) annotation(
    Line(points = {{-60, -122}, {-68, -122}, {-68, -124}, {-68, -124}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank4.ports[1]) annotation(
    Line(points = {{-40, -122}, {-10, -122}}, color = {0, 127, 255}));
  connect(overflow2.port_b, sink.ports[4]) annotation(
    Line(points = {{160, -50}, {160, -92}, {236, -92}, {236, -144}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, overflow2.port_a) annotation(
    Line(points = {{-10, -28}, {69, -28}, {69, -50}, {140, -50}}, color = {0, 127, 255}));
  connect(pipe6.port_b, sink.ports[1]) annotation(
    Line(points = {{130, -162}, {140, -162}, {140, -144}, {236, -144}}, color = {0, 127, 255}));
  connect(overflow4.port_b, sink.ports[2]) annotation(
    Line(points = {{138, -112}, {187, -112}, {187, -144}, {236, -144}}, color = {0, 127, 255}));
  connect(overflow3.port_b, sink.ports[5]) annotation(
    Line(points = {{198, -10}, {198, -109}, {236, -109}, {236, -144}}, color = {0, 127, 255}));
  connect(overflow1.port_b, sink.ports[3]) annotation(
    Line(points = {{168, 144}, {168, -4}, {236, -4}, {236, -144}}, color = {0, 127, 255}));
  connect(volumeFlowRate3.port_b, overflow3.port_a) annotation(
    Line(points = {{132, -4}, {154, -4}, {154, -10}, {178, -10}}, color = {0, 127, 255}));
  connect(volumeFlowRate4.port_b, overflow4.port_a) annotation(
    Line(points = {{68, -110}, {93, -110}, {93, -112}, {118, -112}}, color = {0, 127, 255}));
  connect(source.ports[1], valveLinear1.port_a) annotation(
    Line(points = {{-122, 154}, {-116, 154}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, volumeFlowRate_source_tank1.port_a) annotation(
    Line(points = {{-96, 154}, {-82, 154}}, color = {0, 127, 255}));
  connect(realExpression1.y, valveLinear1.opening) annotation(
    Line(points = {{-79, 170}, {-90.5, 170}, {-90.5, 162}, {-106, 162}}, color = {0, 0, 127}));
  connect(volumeFlowRate_source_tank1.port_b, pipe1.port_a) annotation(
    Line(points = {{-62, 154}, {-54, 154}}, color = {0, 127, 255}));
  connect(pipe1.port_b, tank1.ports[1]) annotation(
    Line(points = {{-34, 154}, {-34, 119}, {-22, 119}, {-22, 74}}, color = {0, 127, 255}));
  connect(pipe7.port_b, tank4.ports[5]) annotation(
    Line(points = {{118, 118}, {128, 118}, {128, 42}, {110, 42}, {110, -146}, {-16, -146}, {-16, -122}, {-10, -122}}, color = {0, 127, 255}));
  connect(volumeFlowRate_bridge.port_b, pipe7.port_a) annotation(
    Line(points = {{64, 124}, {98, 124}, {98, 118}}, color = {0, 127, 255}));
  connect(valveLinear7.port_a, tank1.ports[4]) annotation(
    Line(points = {{-6, 126}, {-6, 74}, {-22, 74}}, color = {0, 127, 255}));
  connect(valveLinear7.opening, realExpression7.y) annotation(
    Line(points = {{4, 134}, {0.5, 134}, {0.5, 156}, {-1, 156}}, color = {0, 0, 127}));
  connect(valveLinear7.port_b, volumeFlowRate_bridge.port_a) annotation(
    Line(points = {{14, 126}, {14, 125}, {44, 125}, {44, 124}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.port_a, tank1.ports[5]) annotation(
    Line(points = {{10, 144}, {-14, 144}, {-14, 74}, {-22, 74}}, color = {0, 127, 255}));
  connect(tank1_overflow.u, volumeFlowRate1.V_flow) annotation(
    Line(points = {{34, 160}, {20, 160}, {20, 155}}, color = {0, 0, 127}));
  connect(volumeFlowRate1.port_b, overflow1.port_a) annotation(
    Line(points = {{30, 144}, {148, 144}}, color = {0, 127, 255}));
  connect(tank1.ports[2], valveLinear2.port_a) annotation(
    Line(points = {{-22, 74}, {-66, 74}}, color = {0, 127, 255}));
  connect(valveLinear2.opening, realExpression2.y) annotation(
    Line(points = {{-76, 66}, {-75, 66}, {-75, 46}}, color = {0, 0, 127}));
  connect(valveLinear2.port_b, volumeFlowRate_tank1_tank2.port_a) annotation(
    Line(points = {{-86, 74}, {-110, 74}}, color = {0, 127, 255}));
  connect(volumeFlowRate_tank1_tank2.port_b, pipe2.port_a) annotation(
    Line(points = {{-110, 54}, {-110, 42}}, color = {0, 127, 255}));
  connect(tank1.ports[3], valveLinear3.port_a) annotation(
    Line(points = {{-22, 74}, {28, 74}}, color = {0, 127, 255}));
  connect(realExpression3.y, valveLinear3.opening) annotation(
    Line(points = {{39, 98}, {38, 98}, {38, 82}}, color = {0, 0, 127}));
  connect(valveLinear3.port_b, volumeFlowRate_tank1_tank3.port_a) annotation(
    Line(points = {{48, 74}, {45, 74}, {45, 72}, {64, 72}}, color = {0, 127, 255}));
  connect(volumeFlowRate_tank1_tank3.port_b, pipe3.port_a) annotation(
    Line(points = {{84, 72}, {84, 48}}, color = {0, 127, 255}));
  connect(pipe3.port_b, tank3.ports[1]) annotation(
    Line(points = {{84, 28}, {84, 4}, {80, 4}, {80, -20}}, color = {0, 127, 255}));
  connect(tank2_overflow.u, volumeFlowRate2.V_flow) annotation(
    Line(points = {{-42, 2}, {-42, -13.5}, {-20, -13.5}, {-20, -17}}, color = {0, 0, 127}));
  connect(realExpression4.y, valveLinear4.opening) annotation(
    Line(points = {{-135, -68}, {-116, -68}}, color = {0, 0, 127}));
  connect(valveLinear4.port_b, volumeFlowRate_tank2_tank4.port_a) annotation(
    Line(points = {{-108, -78}, {-108, -102}}, color = {0, 127, 255}));
  connect(volumeFlowRate3.port_a, tank3.ports[3]) annotation(
    Line(points = {{112, -4}, {97, -4}, {97, -20}, {80, -20}}, color = {0, 127, 255}));
  connect(volumeFlowRate3.V_flow, tank3_overflow.u) annotation(
    Line(points = {{122, 7}, {122, 16.5}, {126, 16.5}, {126, 24}}, color = {0, 0, 127}));
  connect(tank3.ports[2], valveLinear5.port_a) annotation(
    Line(points = {{80, -20}, {38, -20}}, color = {0, 127, 255}));
  connect(valveLinear5.opening, realExpression5.y) annotation(
    Line(points = {{46, -30}, {49.5, -30}, {49.5, -40}, {59, -40}}, color = {0, 0, 127}));
  connect(valveLinear5.port_b, volumeFlowRate_tank3_tank4.port_a) annotation(
    Line(points = {{38, -40}, {38, -46}}, color = {0, 127, 255}));
  connect(volumeFlowRate_tank3_tank4.port_b, pipe5.port_a) annotation(
    Line(points = {{38, -66}, {6, -66}}, color = {0, 127, 255}));
  connect(pipe5.port_b, tank4.ports[2]) annotation(
    Line(points = {{-14, -66}, {-14, -96}, {-10, -96}, {-10, -122}}, color = {0, 127, 255}));
  connect(volumeFlowRate4.port_a, tank4.ports[4]) annotation(
    Line(points = {{48, -110}, {48, -141}, {-10, -141}, {-10, -122}}, color = {0, 127, 255}));
  connect(volumeFlowRate4.V_flow, tank4_overflow.u) annotation(
    Line(points = {{58, -99}, {58, -91.5}, {76, -91.5}, {76, -74}}, color = {0, 0, 127}));
  connect(tank4.ports[3], valveLinear6.port_a) annotation(
    Line(points = {{-10, -122}, {9, -122}, {9, -162}, {18, -162}}, color = {0, 127, 255}));
  connect(realExpression6.y, valveLinear6.opening) annotation(
    Line(points = {{15, -130}, {21.5, -130}, {21.5, -154}, {28, -154}}, color = {0, 0, 127}));
  connect(valveLinear6.port_b, volumeFlowRate_tank4_sink.port_a) annotation(
    Line(points = {{38, -162}, {62, -162}}, color = {0, 127, 255}));
  connect(volumeFlowRate_tank4_sink.port_b, pipe6.port_a) annotation(
    Line(points = {{82, -162}, {110, -162}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
end four_tanks_stable;
