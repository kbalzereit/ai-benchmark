model FillingSystem

  extends SuperModel_M2;

replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase             constrainedby Modelica.Media.Interfaces.PartialMedium 
  annotation(
     choicesAllMatching = true
     );

  Modelica.Fluid.Sources.MassFlowSource_T source1(
    replaceable package Medium=Medium,
    use_m_flow_in=true,
    nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 270))); 
  Modelica.Blocks.Sources.Constant control1(k = 300)  annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Sources.MassFlowSource_T source2(
    redeclare package Medium=Medium,
    use_m_flow_in=true, 
    nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.Constant control2(k = 150)  annotation(
    Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  Modelica.Fluid.Vessels.OpenTank tank_mixing(
    replaceable package Medium=Medium,
    crossArea = 5, 
    height = 10, level_start = 1, 
    nPorts = 4,
    portsData={
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1, height=7),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1, height=7),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.3, height=0.5),
    Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter=0.1, height=0.05)})  annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  
  Modelica.Fluid.Pipes.StaticPipe pipe1(
    replaceable package Medium=Medium,
    length=1,
    height_ab=-1,
    diameter=0.1,
    allowFlowReversal = false ) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Pipes.StaticPipe pipe2( 
    replaceable package Medium=Medium,
    length=1,
    height_ab=-1,
    diameter=0.1,
    allowFlowReversal = false ) annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Pipes.StaticPipe pipe3(
    replaceable package Medium=Medium,
    length=1,
    height_ab=-1,
    diameter=0.3,
    allowFlowReversal = false ) annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(
    replaceable package Medium=Medium,
    m_flow_nominal=1,
    dp_nominal=1,
    m_flow_start=1,
    allowFlowReversal = false ) annotation(
    Placement(visible = true, transformation(origin = {0, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Fluid.Sources.Boundary_pT sink(
    replaceable package Medium=Medium,
    nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Pulse filling(
    amplitude = 1, 
    offset = 0, 
    period = 10, 
    startTime = 0, 
    width = 90) annotation(
    Placement(visible = true, transformation(origin = {50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

Real density_tank, Vol1(start=0.1), Vol2(start=0.1);
parameter Real d1=997, d2=1260;
  
  Modelica.Fluid.Pipes.StaticPipe leak(
    replaceable package Medium=Medium,
    length=1,
    height_ab=-1,
    diameter=0.05,
    allowFlowReversal=false) annotation(
    Placement(visible = true, transformation(origin = {-60, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  
  Modelica.Fluid.Valves.ValveLinear valveLinear2(
    replaceable package Medium=Medium,
    m_flow_nominal=1,
    dp_nominal=1,
    allowFlowReversal = false  ) annotation(
    Placement(visible = true, transformation(origin = {-60, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = open_valve_leak)  annotation(
    Placement(visible = true, transformation(origin = {-124, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = valve_jammed_left)  annotation(
    Placement(visible = true, transformation(origin = {-160, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear3(redeclare package Medium = Medium, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-102, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Valves.ValveLinear valveLinear4(redeclare package Medium = Medium, dp_nominal = 1, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 48}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.RealExpression realExpression3(y = valve_right) annotation(
    Placement(visible = true, transformation(origin = {132, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(valveLinear4.opening, realExpression3.y) annotation(
    Line(points = {{98, 48}, {121, 48}}, color = {0, 0, 127}));
  connect(valveLinear4.port_b, pipe2.port_a) annotation(
    Line(points = {{90, 38}, {48, 38}, {48, 40}, {50, 40}}, color = {0, 127, 255}));
  connect(source2.ports[1], valveLinear4.port_a) annotation(
    Line(points = {{50, 60}, {90, 60}, {90, 58}, {90, 58}}, color = {0, 127, 255}));
  connect(filling.y, valveLinear1.opening) annotation(
    Line(points = {{62, -10}, {80, -10}, {80, -40}, {8, -40}, {8, -40}}, color = {0, 0, 127}));
  connect(realExpression2.y, valveLinear3.opening) annotation(
    Line(points = {{-148, 44}, {-94, 44}, {-94, 50}, {-94, 50}}, color = {0, 0, 127}));
  connect(valveLinear3.port_b, pipe1.port_a) annotation(
    Line(points = {{-102, 40}, {-50, 40}, {-50, 40}, {-50, 40}}, color = {0, 127, 255}));
  connect(valveLinear3.port_a, source1.ports[1]) annotation(
    Line(points = {{-102, 60}, {-50, 60}, {-50, 60}, {-50, 60}}, color = {0, 127, 255}));
  connect(realExpression1.y, valveLinear2.opening) annotation(
    Line(points = {{-112, -28}, {-52, -28}, {-52, -40}, {-52, -40}}, color = {0, 0, 127}));
  connect(leak.port_b, sink.ports[2]) annotation(
    Line(points = {{-60, -90}, {-60, -90}, {-60, -92}, {60, -92}, {60, -90}}, color = {0, 127, 255}));
  connect(valveLinear2.port_b, leak.port_a) annotation(
    Line(points = {{-60, -50}, {-60, -50}, {-60, -70}, {-60, -70}}, color = {0, 127, 255}));
  connect(tank_mixing.ports[4], valveLinear2.port_a) annotation(
    Line(points = {{0, -20}, {-6, -20}, {-6, -26}, {-60, -26}, {-60, -30}, {-60, -30}}, color = {0, 127, 255}));
  der(Vol1) = tank_mixing.ports[1].m_flow;
  der(Vol2) = tank_mixing.ports[2].m_flow;
  density_tank = Vol1 / (Vol1 + Vol2) * d1 + Vol2 / (Vol1 + Vol2) * d2;
  connect(control2.y, source2.m_flow_in) annotation(
    Line(points = {{22, 90}, {58, 90}, {58, 80}, {58, 80}}, color = {0, 0, 127}));
  connect(control1.y, source1.m_flow_in) annotation(
    Line(points = {{-78, 90}, {-42, 90}, {-42, 80}, {-42, 80}}, color = {0, 0, 127}));
  connect(pipe3.port_b, sink.ports[1]) annotation(
    Line(points = {{0, -80}, {0, -80}, {0, -90}, {60, -90}, {60, -90}}, color = {0, 127, 255}));
  connect(valveLinear1.port_b, pipe3.port_a) annotation(
    Line(points = {{0, -50}, {0, -50}, {0, -60}, {0, -60}}, color = {0, 127, 255}));
  connect(tank_mixing.ports[3], valveLinear1.port_a) annotation(
    Line(points = {{0, -20}, {0, -20}, {0, -30}, {0, -30}}, color = {0, 127, 255}));
  connect(pipe2.port_b, tank_mixing.ports[2]) annotation(
    Line(points = {{50, 20}, {50, 20}, {50, 14}, {6, 14}, {6, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(pipe1.port_b, tank_mixing.ports[1]) annotation(
    Line(points = {{-50, 20}, {-50, 20}, {-50, 14}, {-6, 14}, {-6, -20}, {0, -20}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")));
    
end FillingSystem;
