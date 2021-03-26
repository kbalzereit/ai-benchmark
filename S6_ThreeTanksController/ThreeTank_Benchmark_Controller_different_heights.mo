model ThreeTank_Benchmark_Controller
  extends SuperModel;
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium;
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial) annotation(
    Placement(visible = true, transformation(origin = {-162, -164}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  parameter Real upper_limit = 450;
  parameter Real lower_limit = 380;
  Modelica.Fluid.Sources.FixedBoundary source_left(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), p = system.p_ambient, use_T = false, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-314, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source_right(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), p = system.p_ambient, use_T = false, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {252, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-284, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-230, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {224, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {170, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Machines.PrescribedPump pump(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {-260, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump1(redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.linearFlow(V_flow_nominal = {0.9, 1}, head_nominal = {1, 0.9}), redeclare package Medium = Medium, N_nominal = 1200, T_start = system.T_start, V(displayUnit = "l") = 0.001, allowFlowReversal = true, checkValve = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel = 1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in = true) annotation(
    Placement(visible = true, transformation(origin = {196, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete1(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-200, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete2(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-270, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete3(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {142, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression1(y = enable_leak)  annotation(
    Placement(visible = true, transformation(origin = {-286, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression2(y = true) annotation(
    Placement(visible = true, transformation(origin = {-200, 100}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression3(y = true) annotation(
    Placement(visible = true, transformation(origin = {142, 62}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression4(y = valve5_open) annotation(
    Placement(visible = true, transformation(origin = {60, 8}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Vessels.OpenTank tank1(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 0.4), level_start = 0.4, nPorts = 4, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 2), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0.3), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.75, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-158, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank2(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 0.2), level_start = 0.2, nPorts = 6, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0.5), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.75, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.75, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0)}) annotation(
    Placement(visible = true, transformation(origin = {-4, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank3(redeclare package Medium = Medium, crossArea = 1, height = 2, level(fixed = true, start = 0.1), level_start = 0.1, nPorts = 4, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 2), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.5, height = 0), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.75, height = 0.5)}) annotation(
    Placement(visible = true, transformation(origin = {106, 14}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-128, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-44, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe6(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-110, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe7(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-34, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe8(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-4, -52}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.FixedBoundary consumer(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {-4, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete6(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-68, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete5(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {60, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete8(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {48, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression5(y = valve4_open) annotation(
    Placement(visible = true, transformation(origin = {-90, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression6(y = valve8_open) annotation(
    Placement(visible = true, transformation(origin = {48, 82}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = pump_simulator_real)  annotation(
    Placement(visible = true, transformation(origin = {-286, 88}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = pump1_simulator_real) annotation(
    Placement(visible = true, transformation(origin = {196, 52}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Pipes.StaticPipe pipe9(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {-220, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete4(redeclare package Medium = Medium, allowFlowReversal = true, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {-90, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink_right(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {220, -74}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Pipes.StaticPipe pipe10(redeclare package Medium = Medium, diameter = 0.45, length = 1) annotation(
    Placement(visible = true, transformation(origin = {126, -42}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveDiscrete valveDiscrete7(redeclare package Medium = Medium, dp_nominal = 10000, m_flow_nominal = 400) annotation(
    Placement(visible = true, transformation(origin = {130, -80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression8(y = true) annotation(
    Placement(visible = true, transformation(origin = {160, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sources.FixedBoundary sink_left(redeclare package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = false) annotation(
    Placement(visible = true, transformation(origin = {-300, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PID PID(Td = 0, Ti = 10, k = 1200)  annotation(
    Placement(visible = true, transformation(origin = {-270, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-298, 122}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression5(y = 1.2) annotation(
    Placement(visible = true, transformation(origin = {-324, 120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression6(y = tank1.level) annotation(
    Placement(visible = true, transformation(origin = {-324, 106}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.LogicalSwitch logicalSwitch2 annotation(
    Placement(visible = true, transformation(origin = {-26, 126}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression10(y = blocked_valve) annotation(
    Placement(visible = true, transformation(origin = {-120, 156}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression11(y = open_valve_controller) annotation(
    Placement(visible = true, transformation(origin = {-70, 152}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpression7(y = tank2.level < 0.3 or tank2.level < 0.4 and der(tank2.level) > 0)  annotation(
    Placement(visible = true, transformation(origin = {-104, 114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  when enable_drop_t1 == true then
    reinit(tank1.level, drop_value_t1*pre(tank1.level));
  end when;
  
  when enable_drop_t2 == true then
    reinit(tank2.level, drop_value_t2*pre(tank2.level));
  end when;
  
  when enable_drop_t3 == true then
    reinit(tank3.level, drop_value_t3*pre(tank3.level));
  end when;
  
  when enable_rise_t1 == true then
    reinit(tank1.level, rise_value_t1*pre(tank1.level));
  end when;
  
  when enable_rise_t2 == true then
    reinit(tank2.level, rise_value_t2*pre(tank2.level));
  end when;
  
  when enable_rise_t3 == true then
    reinit(tank3.level, rise_value_t3*pre(tank3.level));
  end when;

  connect(valveDiscrete5.port_a, tank3.ports[1]) annotation(
    Line(points = {{70, -34}, {100, -34}, {100, -6}, {106, -6}, {106, -6}}, color = {0, 127, 255}));
  connect(tank2.ports[5], valveDiscrete5.port_b) annotation(
    Line(points = {{-4, 0}, {6, 0}, {6, -34}, {50, -34}, {50, -34}}, color = {0, 127, 255}));
  connect(valveDiscrete5.open, booleanExpression4.y) annotation(
    Line(points = {{60, -42}, {60, -3}}, color = {255, 0, 255}));
  connect(booleanExpression7.y, logicalSwitch2.u3) annotation(
    Line(points = {{-92, 114}, {-56, 114}, {-56, 118}, {-38, 118}, {-38, 118}}, color = {255, 0, 255}));
  connect(logicalSwitch2.y, valveDiscrete6.open) annotation(
    Line(points = {{-14, 126}, {2, 126}, {2, 92}, {-68, 92}, {-68, 76}, {-68, 76}}, color = {255, 0, 255}));
  connect(PID.y, pump.N_in) annotation(
    Line(points = {{-258, 130}, {-260, 130}, {-260, 78}, {-260, 78}}, color = {0, 0, 127}));
  connect(booleanExpression11.y, logicalSwitch2.u1) annotation(
    Line(points = {{-58, 152}, {-50, 152}, {-50, 134}, {-38, 134}, {-38, 134}}, color = {255, 0, 255}));
  connect(booleanExpression10.y, logicalSwitch2.u2) annotation(
    Line(points = {{-108, 156}, {-82, 156}, {-82, 136}, {-66, 136}, {-66, 126}, {-38, 126}, {-38, 126}}, color = {255, 0, 255}));
  connect(feedback1.u1, realExpression5.y) annotation(
    Line(points = {{-306, 122}, {-314, 122}, {-314, 120}, {-312, 120}}, color = {0, 0, 127}));
  connect(feedback1.y, PID.u) annotation(
    Line(points = {{-288, 122}, {-282, 122}, {-282, 130}, {-282, 130}}, color = {0, 0, 127}));
  connect(feedback1.u2, realExpression6.y) annotation(
    Line(points = {{-298, 114}, {-298.5, 114}, {-298.5, 112}, {-299, 112}, {-299, 116}, {-300, 116}, {-300, 103}, {-313, 103}, {-313, 106}}, color = {0, 0, 127}));
  connect(pipe5.port_a, valveDiscrete4.port_b) annotation(
    Line(points = {{-54, -76}, {-80, -76}, {-80, -76}, {-80, -76}}, color = {0, 127, 255}));
  connect(sink_left.ports[1], valveDiscrete2.port_b) annotation(
    Line(points = {{-290, -50}, {-280, -50}}, color = {0, 127, 255}));
  connect(valveDiscrete7.open, booleanExpression8.y) annotation(
    Line(points = {{138, -80}, {150, -80}, {150, -76}, {150, -76}}, color = {255, 0, 255}));
  connect(valveDiscrete7.port_b, sink_right.ports[1]) annotation(
    Line(points = {{130, -90}, {210, -90}, {210, -74}, {210, -74}}, color = {0, 127, 255}));
  connect(pipe10.port_b, valveDiscrete7.port_a) annotation(
    Line(points = {{126, -52}, {130, -52}, {130, -70}, {130, -70}}, color = {0, 127, 255}));
  connect(tank3.ports[3], pipe10.port_a) annotation(
    Line(points = {{106, -6}, {126, -6}, {126, -32}, {126, -32}}, color = {0, 127, 255}));
  connect(booleanExpression5.y, valveDiscrete4.open) annotation(
    Line(points = {{-90, -53}, {-90, -68}}, color = {255, 0, 255}));
  connect(pipe5.port_b, tank2.ports[1]) annotation(
    Line(points = {{-34, -76}, {-21, -76}, {-21, 0}, {-4, 0}}, color = {0, 127, 255}));
  connect(pipe4.port_b, valveDiscrete4.port_a) annotation(
    Line(points = {{-118, -76}, {-100, -76}}, color = {0, 127, 255}));
  connect(tank1.ports[4], pipe4.port_a) annotation(
    Line(points = {{-158, 0}, {-146, 0}, {-146, -76}, {-138, -76}}, color = {0, 127, 255}));
  connect(consumer.ports[1], pipe8.port_b) annotation(
    Line(points = {{-4, -80}, {-4, -62}}, color = {0, 127, 255}));
  connect(pipe8.port_a, tank2.ports[3]) annotation(
    Line(points = {{-4, -42}, {-4, 0}}, color = {0, 127, 255}));
  connect(pipe6.port_b, valveDiscrete6.port_a) annotation(
    Line(points = {{-100, 68}, {-78, 68}}, color = {0, 127, 255}));
  connect(pipe6.port_a, tank1.ports[3]) annotation(
    Line(points = {{-120, 68}, {-158, 68}, {-158, 0}}, color = {0, 127, 255}));
  connect(pipe7.port_b, tank2.ports[2]) annotation(
    Line(points = {{-24, 68}, {-4, 68}, {-4, 0}}, color = {0, 127, 255}));
  connect(tank2.ports[4], valveDiscrete8.port_a) annotation(
    Line(points = {{-4, 0}, {-4, 46}, {38, 46}}, color = {0, 127, 255}));
  connect(valveDiscrete1.port_b, tank1.ports[1]) annotation(
    Line(points = {{-190, 68}, {-158, 68}, {-158, 0}}, color = {0, 127, 255}));
  connect(pipe9.port_a, tank1.ports[2]) annotation(
    Line(points = {{-210, -50}, {-158, -50}, {-158, 0}}, color = {0, 127, 255}));
  connect(valveDiscrete2.port_a, pipe9.port_b) annotation(
    Line(points = {{-260, -50}, {-230, -50}, {-230, -50}, {-230, -50}}, color = {0, 127, 255}));
  connect(pump1.N_in, realExpression4.y) annotation(
    Line(points = {{196, 80}, {196, 63}}, color = {0, 0, 127}));
  connect(valveDiscrete2.open, booleanExpression1.y) annotation(
    Line(points = {{-270, -58}, {-270, -63}, {-286, -63}, {-286, -68}}, color = {255, 0, 255}));
  connect(valveDiscrete3.port_b, tank3.ports[2]) annotation(
    Line(points = {{132, 90}, {106, 90}, {106, -6}}, color = {0, 127, 255}));
  connect(valveDiscrete8.port_b, tank3.ports[4]) annotation(
    Line(points = {{58, 46}, {106, 46}, {106, -6}}, color = {0, 127, 255}));
  connect(booleanExpression2.y, valveDiscrete1.open) annotation(
    Line(points = {{-200, 89}, {-200, 76}}, color = {255, 0, 255}));
  connect(pipe1.port_b, valveDiscrete1.port_a) annotation(
    Line(points = {{-220, 68}, {-210, 68}}, color = {0, 127, 255}));
  connect(valveDiscrete6.port_b, pipe7.port_a) annotation(
    Line(points = {{-58, 68}, {-44, 68}}, color = {0, 127, 255}));
  connect(source_left.ports[1], pipe.port_a) annotation(
    Line(points = {{-304, 68}, {-294, 68}}, color = {0, 127, 255}));
  connect(pipe.port_b, pump.port_a) annotation(
    Line(points = {{-274, 68}, {-270, 68}}, color = {0, 127, 255}));
  connect(pump.port_b, pipe1.port_a) annotation(
    Line(points = {{-250, 68}, {-240, 68}}, color = {0, 127, 255}));
  connect(valveDiscrete8.open, booleanExpression6.y) annotation(
    Line(points = {{48, 54}, {48, 54}, {48, 72}, {48, 72}}, color = {255, 0, 255}));
  connect(valveDiscrete3.open, booleanExpression3.y) annotation(
    Line(points = {{142, 82}, {142, 82}, {142, 74}, {142, 74}}, color = {255, 0, 255}));
  connect(pipe3.port_b, valveDiscrete3.port_a) annotation(
    Line(points = {{160, 90}, {152, 90}, {152, 90}, {152, 90}}, color = {0, 127, 255}));
  connect(pump1.port_b, pipe3.port_a) annotation(
    Line(points = {{186, 90}, {180, 90}}, color = {0, 127, 255}));
  connect(pipe2.port_b, pump1.port_a) annotation(
    Line(points = {{214, 90}, {206, 90}}, color = {0, 127, 255}));
  connect(source_right.ports[1], pipe2.port_a) annotation(
    Line(points = {{242, 90}, {234, 90}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));end ThreeTank_Benchmark_Controller;
