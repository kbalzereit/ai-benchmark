model Versuchsaufbau
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium annotation(
     choicesAllMatching = true);
  
  Modelica.Fluid.Vessels.OpenTank tank1(replaceable package Medium = Medium, crossArea = 0.05, height = 1, level(fixed = false), level_start = 0.001, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.015), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.02)}, use_portsData = true) annotation(
    Placement(visible = true, transformation(origin = {-60, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank2(replaceable package Medium = Medium, crossArea = 0.05, height = 1, level_start = 0.001, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 2, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.01), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.02)}) annotation(
    Placement(visible = true, transformation(origin = {60, 100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear1(replaceable package Medium = Medium, dp_nominal = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-90, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear2(replaceable package Medium = Medium, dp_nominal = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {190, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear3(replaceable package Medium = Medium, dp_nominal = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {-88, -82}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear valveLinear4(replaceable package Medium = Medium, dp_nominal = 100, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -152}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe5(replaceable package Medium = Medium, diameter = 0.03, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {126, -152}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source1(replaceable package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-204, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary source2(replaceable package Medium = Medium, T = Modelica.SIunits.Conversions.from_degC(20), nPorts = 1, p = system.p_ambient, use_T = true) annotation(
    Placement(visible = true, transformation(origin = {-202, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe1(replaceable package Medium = Medium, allowFlowReversal = true, diameter = 0.015, height_ab = 3, length = 5, m_flow_start = 0.01) annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe2(replaceable package Medium = Medium, allowFlowReversal = true, diameter = 0.01, height_ab = 3, length = 5, m_flow_start = 0.01, p_b_start = system.p_start) annotation(
    Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

model Control
  parameter Real water_volume_target = 0.2*0.05;
  parameter Real ethanol_volume_target = 0.2*0.05;
  parameter Real tank_level_eps = 0.001;
  parameter Real idle_time = 5.0;
  parameter Real mix_time = 8.0;
  parameter Real hot_time = 10.0;
  parameter Real T_hot_target = 40;
  parameter Real T_cool_target = 25;
  Boolean V1;
  Boolean V2;
  Boolean V3;
  Boolean V4;
  Real Q4;
  Boolean reset;
  Real tank1_level;
  Real tank2_level;
  Real tank3_level;
  Real tank4_level;
  Real volumeIntegrator1;
  Real volumeIntegrator2;
  Real T4;
  inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(
      Placement(visible = true, transformation(origin = {-140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Alternative alternative2(nBranches = 3)  annotation(
      Placement(visible = true, transformation(origin = {10, 60}, extent = {{-64, -30}, {64, 30}}, rotation = 0)));
  Modelica.StateGraph.Step step3 annotation(
      Placement(visible = true, transformation(origin = {10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step4 annotation(
      Placement(visible = true, transformation(origin = {10, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition2_3(condition = volumeIntegrator1 < water_volume_target and volumeIntegrator2 >= ethanol_volume_target) annotation(
      Placement(visible = true, transformation(origin = {-20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition2_4(condition = volumeIntegrator1 >= water_volume_target and volumeIntegrator2 < ethanol_volume_target) annotation(
      Placement(visible = true, transformation(origin = {-20, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition3_5(condition = volumeIntegrator1 >= water_volume_target and volumeIntegrator2 >= ethanol_volume_target) annotation(
      Placement(visible = true, transformation(origin = {40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition4_5(condition = volumeIntegrator1 >= water_volume_target and volumeIntegrator2 >= ethanol_volume_target) annotation(
      Placement(visible = true, transformation(origin = {40, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition2_5(condition = volumeIntegrator1 >= water_volume_target and volumeIntegrator2 >= ethanol_volume_target) annotation(
      Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step2 annotation(
      Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition1_2(enableTimer = true, waitTime = idle_time)  annotation(
      Placement(visible = true, transformation(origin = {-100, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step5 annotation(
      Placement(visible = true, transformation(origin = {90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step6 annotation(
      Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step7 annotation(
      Placement(visible = true, transformation(origin = {-30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step8 annotation(
      Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step9 annotation(
      Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition5_6(enableTimer = true, waitTime = mix_time) annotation(
      Placement(visible = true, transformation(origin = {120, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition6_7(condition = tank3_level < tank_level_eps) annotation(
      Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition7_8(condition = T4 > T_hot_target) annotation(
      Placement(visible = true, transformation(origin = {0, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition8_9(enableTimer = true, waitTime = hot_time)  annotation(
      Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition10_11(condition = tank4_level < tank_level_eps) annotation(
      Placement(visible = true, transformation(origin = {180, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.InitialStep step1 annotation(
      Placement(visible = true, transformation(origin = {-130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Transition transition9_10(condition = T4 < T_cool_target)  annotation(
      Placement(visible = true, transformation(origin = {120, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.StateGraph.Step step10 annotation(
      Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(step10.outPort[1], transition10_11.inPort) annotation(
      Line(points = {{160, -20}, {176, -20}, {176, -20}, {176, -20}}));
    connect(transition9_10.outPort, step10.inPort[1]) annotation(
      Line(points = {{122, -20}, {138, -20}, {138, -20}, {138, -20}}));
    connect(step9.outPort[1], transition9_10.inPort) annotation(
      Line(points = {{100, -20}, {114, -20}, {114, -20}, {116, -20}}));
  connect(transition10_11.outPort, step1.inPort[1]) annotation(
      Line(points = {{181.5, -20}, {202, -20}, {202, -48}, {-160, -48}, {-160, 60}, {-142, 60}}));
    connect(step1.outPort[1], transition1_2.inPort) annotation(
      Line(points = {{-120, 60}, {-104, 60}, {-104, 60}, {-104, 60}}));
    connect(transition8_9.outPort, step9.inPort[1]) annotation(
      Line(points = {{62, -20}, {78, -20}, {78, -20}, {78, -20}}));
    connect(step8.outPort[1], transition8_9.inPort) annotation(
      Line(points = {{40, -20}, {56, -20}, {56, -20}, {56, -20}}));
    connect(transition7_8.outPort, step8.inPort[1]) annotation(
      Line(points = {{2, -20}, {18, -20}, {18, -20}, {18, -20}}));
    connect(step7.outPort[1], transition7_8.inPort) annotation(
      Line(points = {{-20, -20}, {-6, -20}, {-6, -20}, {-4, -20}, {-4, -20}}));
    connect(transition6_7.outPort, step7.inPort[1]) annotation(
      Line(points = {{-58, -20}, {-42, -20}, {-42, -20}, {-42, -20}, {-42, -20}, {-42, -20}}));
    connect(transition5_6.outPort, step6.inPort[1]) annotation(
      Line(points = {{122, 60}, {140, 60}, {140, 10}, {-120, 10}, {-120, -20}, {-102, -20}, {-102, -20}}));
    connect(step6.outPort[1], transition6_7.inPort) annotation(
      Line(points = {{-79.5, -20}, {-63.5, -20}, {-63.5, -20}, {-63.5, -20}}));
    connect(alternative2.split[3], transition2_5.inPort) annotation(
      Line(points = {{-41, 60}, {-41, 30}, {-24, 30}}));
    connect(transition2_5.outPort, alternative2.join[3]) annotation(
      Line(points = {{-18.5, 30}, {61, 30}, {61, 60}}));
    connect(step5.outPort[1], transition5_6.inPort) annotation(
      Line(points = {{100, 60}, {116, 60}, {116, 60}, {116, 60}}));
    connect(alternative2.outPort, step5.inPort[1]) annotation(
      Line(points = {{75, 60}, {79, 60}}));
    connect(step2.outPort[1], alternative2.inPort) annotation(
      Line(points = {{-60, 60}, {-56, 60}}));
    connect(alternative2.split[1], transition2_3.inPort) annotation(
      Line(points = {{-41, 60}, {-41, 90}, {-24, 90}}));
    connect(alternative2.split[2], transition2_4.inPort) annotation(
      Line(points = {{-41, 60}, {-24, 60}}));
    connect(transition3_5.outPort, alternative2.join[1]) annotation(
      Line(points = {{41.5, 90}, {61, 90}, {61, 60}}));
    connect(transition4_5.outPort, alternative2.join[2]) annotation(
      Line(points = {{41.5, 60}, {61, 60}}));
    connect(step4.outPort[1], transition4_5.inPort) annotation(
      Line(points = {{20.5, 60}, {36, 60}}));
    connect(step3.outPort[1], transition3_5.inPort) annotation(
      Line(points = {{20.5, 90}, {36, 90}}));
    connect(transition2_3.outPort, step3.inPort[1]) annotation(
      Line(points = {{-18.5, 90}, {-1, 90}}));
    connect(transition2_4.outPort, step4.inPort[1]) annotation(
      Line(points = {{-18.5, 60}, {-1, 60}}));
    connect(transition1_2.outPort, step2.inPort[1]) annotation(
      Line(points = {{-98, 60}, {-82, 60}, {-82, 60}, {-82, 60}}));
    V1 = step2.active or step3.active;
    V2 = step2.active or step4.active;
    V3 = step6.active;
    V4 = step10.active;
    Q4 = if step7.active then 30000 else if step9.active then -10000 else 0;
    reset = step1.active;
  end Control;

  inner Modelica.Fluid.System system(T_ambient = 293.15)  annotation(
    Placement(visible = true, transformation(origin = {-250, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.FixedBoundary sink(replaceable package Medium = Medium, T = system.T_ambient, nPorts = 1, p = system.p_ambient) annotation(
    Placement(visible = true, transformation(origin = {162, -152}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump2( redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal={0,0.25,0.5}, head_nominal={100,60,0}), redeclare package Medium = Medium, N_nominal= 200, T_start=system.T_start, V(displayUnit="l") = 0.01, allowFlowReversal = false, checkValve = true, energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.01, massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel=1, p_a_start = system.p_start, p_b_start = system.p_start, use_N_in=true) annotation(
    Placement(visible = true, transformation(origin = {0, 140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Machines.PrescribedPump pump1( redeclare function flowCharacteristic = Modelica.Fluid.Machines.BaseClasses.PumpCharacteristics.quadraticFlow(V_flow_nominal={0,0.25,0.5}, head_nominal={100,60,0}), redeclare package Medium = Medium, N_nominal= 200, T_start=system.T_start, V(displayUnit="l") = 0.01, allowFlowReversal = false, checkValve = true, energyDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial, m_flow_start = 0.1, massDynamics=Modelica.Fluid.Types.Dynamics.FixedInitial, nParallel=1, p_a_start = system.p_start, p_b_start= system.p_start, use_N_in=true) annotation(
    Placement(visible = true, transformation(origin = {-160, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3_1(replaceable package Medium = Medium, diameter = 0.02, height_ab = -0.4, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-56, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe3_2(replaceable package Medium = Medium, diameter = 0.02, height_ab = -0.4, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {84, 14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe4(replaceable package Medium = Medium, diameter = 0.02, height_ab = -0.5, length = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-50, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid2(amplitude = 200, rising = 0)  annotation(
    Placement(visible = true, transformation(origin = {-70, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.OpenTank tank3(replaceable package Medium = Medium, crossArea = 0.1, height = 1, level_start = 0.001, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, nPorts = 3, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.02), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.02), Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.02)})  annotation(
    Placement(visible = true, transformation(origin = {18, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Versuchsaufbau.Control control annotation(
    Placement(visible = true, transformation(origin = {-250, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  connector Port_Actuators
    output Boolean V1;
    output Boolean V2;
    output Boolean V3;
    output Boolean V4;
    output Real Q4;
    output Boolean reset;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Polygon(
            points={{-100,100},{100,0},{-100,-100},{-100,100}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}),
                                           Diagram(coordinateSystem(
            preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
          graphics={Polygon(
            points={{0,50},{100,0},{0,-50},{0,50}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid)}));
  end Port_Actuators;

  connector Port_Sensors
    input Real tank1_level;
    input Real tank2_level;
    input Real tank3_level;
    input Real tank4_level;
    input Real volumeIntegrator1;
    input Real volumeIntegrator2;
    input Real T4;
    annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
              -100},{100,100}}), graphics={Polygon(
            points={{-100,100},{-100,-100},{100,0},{-100,100}},
            lineColor={0,0,0},
            lineThickness=0.5,
            fillColor={215,215,215},
            fillPattern=FillPattern.Solid)}),
                                           Diagram(coordinateSystem(
            preserveAspectRatio=false, initialScale = 0.1),
          graphics={Polygon( fillColor = {215, 215, 215}, fillPattern = FillPattern.Solid, lineThickness = 0.5, points = {{0, 50}, {0, -50}, {100, 0}, {0, 50}})}));
  end Port_Sensors;
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoid1(amplitude = 200)  annotation(
    Placement(visible = true, transformation(origin = {-230, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoidV1 annotation(
    Placement(visible = true, transformation(origin = {-130, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoidV2 annotation(
    Placement(visible = true, transformation(origin = {160, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoidV3 annotation(
    Placement(visible = true, transformation(origin = {-126, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.TriggeredTrapezoid triggeredTrapezoidV4 annotation(
    Placement(visible = true, transformation(origin = {-30, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionV3(y = control.V3)  annotation(
    Placement(visible = true, transformation(origin = {-170, -66}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionV4(y = control.V4)  annotation(
    Placement(visible = true, transformation(origin = {-72, -170}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionV2(y = control.V2)  annotation(
    Placement(visible = true, transformation(origin = {110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression booleanExpressionV1(y = control.V1)  annotation(
    Placement(visible = true, transformation(origin = {-170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis hysteresis2(pre_y_start = false, uHigh = 0.8, uLow = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-108, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression2(y = 1 - tank2.level)  annotation(
    Placement(visible = true, transformation(origin = {-150, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder2(T = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-30, 160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.FirstOrder firstOrder1(T = 0.5)  annotation(
    Placement(visible = true, transformation(origin = {-190, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Logical.Hysteresis hysteresis1(uHigh = 0.8, uLow = 0.2)  annotation(
    Placement(visible = true, transformation(origin = {-270, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression1(y = 1 - tank1.level)  annotation(
    Placement(visible = true, transformation(origin = {-312, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate2(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {164, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  IntegratorWithReset volumeIntegratorWithReset2(y(fixed = true), y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {190, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.VolumeFlowRate volumeFlowRate1(replaceable package Medium = Medium) annotation(
    Placement(visible = true, transformation(origin = {-24, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  IntegratorWithReset volumeIntegratorWithReset1(y(fixed = true), y_start = 0)  annotation(
    Placement(visible = true, transformation(origin = {-48, -2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Examples.AST_BatchPlant.BaseClasses.TankWithTopPorts tank4(replaceable package Medium = Medium, V0 = 0.0001, crossArea = 0.1, height = 1, level_start = 0.001, nPorts = 1, nTopPorts = 1, portsData = {Modelica.Fluid.Vessels.BaseClasses.VesselPortsData(diameter = 0.03, height = 0)}, use_HeatTransfer = true)  annotation(
    Placement(visible = true, transformation(origin = {20, -100}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow4(T_ref = 343.15, alpha = -0.05)  annotation(
    Placement(visible = true, transformation(origin = {-90, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Celsius.TemperatureSensor temperatureSensor4 annotation(
    Placement(visible = true, transformation(origin = {-50, -138}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.RealExpression realExpression4(y = control.Q4)  annotation(
    Placement(visible = true, transformation(origin = {-128, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression volumeIntegrator1_reset(y = control.reset)  annotation(
    Placement(visible = true, transformation(origin = {-170, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.BooleanExpression volumeIntegrator2_reset(y = control.reset)  annotation(
    Placement(visible = true, transformation(origin = {130, 12}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(volumeFlowRate1.port_b, tank3.ports[1]) annotation(
    Line(points = {{-14, -32}, {12, -32}, {12, -20}, {18, -20}}, color = {0, 127, 255}));
  connect(tank3.ports[3], valveLinear3.port_a) annotation(
    Line(points = {{18, -20}, {16, -20}, {16, -50}, {-108, -50}, {-108, -82}, {-98, -82}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.port_b, tank3.ports[2]) annotation(
    Line(points = {{174, -14}, {174, -15}, {220, -15}, {220, -32}, {18, -32}, {18, -20}}, color = {0, 127, 255}));
  connect(realExpression4.y, prescribedHeatFlow4.Q_flow) annotation(
    Line(points = {{-116, -120}, {-100, -120}, {-100, -120}, {-100, -120}}, color = {0, 0, 127}));
  connect(volumeIntegrator1_reset.y, volumeIntegratorWithReset1.reset) annotation(
    Line(points = {{-158, -10}, {-60, -10}, {-60, -10}, {-60, -10}}, color = {255, 0, 255}));
  connect(booleanExpressionV1.y, triggeredTrapezoidV1.u) annotation(
    Line(points = {{-159, 10}, {-142, 10}}, color = {255, 0, 255}));
  connect(pipe3_2.port_b, volumeFlowRate2.port_a) annotation(
    Line(points = {{94, 14}, {110, 14}, {110, -14}, {154, -14}}, color = {0, 127, 255}));
  connect(volumeFlowRate2.V_flow, volumeIntegratorWithReset2.u) annotation(
    Line(points = {{164, -3}, {164, 20}, {178, 20}}, color = {0, 0, 127}));
  connect(volumeIntegrator2_reset.y, volumeIntegratorWithReset2.reset) annotation(
    Line(points = {{142, 12}, {176, 12}, {176, 12}, {178, 12}}, color = {255, 0, 255}));
  connect(valveLinear2.port_b, pipe3_2.port_a) annotation(
    Line(points = {{200, 60}, {220, 60}, {220, 40}, {60, 40}, {60, 14}, {74, 14}}, color = {0, 127, 255}));
  connect(temperatureSensor4.port, prescribedHeatFlow4.port) annotation(
    Line(points = {{-60, -138}, {-60, -120}, {-80, -120}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow4.port, tank4.heatPort) annotation(
    Line(points = {{-80, -120}, {-41, -120}, {-41, -100}, {0, -100}}, color = {191, 0, 0}));
  connect(tank4.ports[1], valveLinear4.port_a) annotation(
    Line(points = {{20, -120}, {20, -120}, {20, -152}, {54, -152}, {54, -152}, {80, -152}, {80, -152}}, color = {0, 127, 255}));
  connect(booleanExpressionV3.y, triggeredTrapezoidV3.u) annotation(
    Line(points = {{-159, -66}, {-138, -66}}, color = {255, 0, 255}));
  connect(triggeredTrapezoidV3.y, valveLinear3.opening) annotation(
    Line(points = {{-115, -66}, {-88, -66}, {-88, -74}}, color = {0, 0, 127}));
  connect(valveLinear3.port_b, pipe4.port_a) annotation(
    Line(points = {{-78, -82}, {-68, -82}, {-68, -64}, {-60, -64}}, color = {0, 127, 255}));
  connect(pipe4.port_b, tank4.topPorts[1]) annotation(
    Line(points = {{-40, -64}, {20, -64}, {20, -78}}, color = {0, 127, 255}));
  connect(valveLinear4.port_b, pipe5.port_a) annotation(
    Line(points = {{100, -152}, {116, -152}}, color = {0, 127, 255}));
  connect(triggeredTrapezoidV4.y, valveLinear4.opening) annotation(
    Line(points = {{-18, -170}, {0, -170}, {0, -136}, {90, -136}, {90, -144}}, color = {0, 0, 127}));
  connect(pipe5.port_b, sink.ports[1]) annotation(
    Line(points = {{136, -152}, {172, -152}}, color = {0, 127, 255}));
  connect(realExpression2.y, hysteresis2.u) annotation(
    Line(points = {{-139, 160}, {-120, 160}}, color = {0, 0, 127}));
  connect(hysteresis2.y, triggeredTrapezoid2.u) annotation(
    Line(points = {{-97, 160}, {-82, 160}}, color = {255, 0, 255}));
  connect(triggeredTrapezoid2.y, firstOrder2.u) annotation(
    Line(points = {{-59, 160}, {-42, 160}}, color = {0, 0, 127}));
  connect(firstOrder2.y, pump2.N_in) annotation(
    Line(points = {{-19, 160}, {0, 160}, {0, 150}}, color = {0, 0, 127}));
  connect(source2.ports[1], pump2.port_a) annotation(
    Line(points = {{-192, 140}, {-10, 140}}, color = {0, 127, 255}));
  connect(pump2.port_b, pipe2.port_a) annotation(
    Line(points = {{10, 140}, {19, 140}, {19, 60}, {30, 60}}, color = {0, 127, 255}));
  connect(realExpression1.y, hysteresis1.u) annotation(
    Line(points = {{-301, 100}, {-282, 100}}, color = {0, 0, 127}));
  connect(hysteresis1.y, triggeredTrapezoid1.u) annotation(
    Line(points = {{-259, 100}, {-242, 100}}, color = {255, 0, 255}));
  connect(triggeredTrapezoid1.y, firstOrder1.u) annotation(
    Line(points = {{-219, 100}, {-202, 100}}, color = {0, 0, 127}));
  connect(firstOrder1.y, pump1.N_in) annotation(
    Line(points = {{-179, 100}, {-160, 100}, {-160, 70}}, color = {0, 0, 127}));
  connect(source1.ports[1], pump1.port_a) annotation(
    Line(points = {{-194, 60}, {-170, 60}}, color = {0, 127, 255}));
  connect(pump1.port_b, pipe1.port_a) annotation(
    Line(points = {{-150, 60}, {-130, 60}}, color = {0, 127, 255}));
  connect(tank1.ports[2], valveLinear1.port_a) annotation(
    Line(points = {{-60, 80}, {-59, 80}, {-59, 40}, {-108, 40}, {-108, -32.375}, {-100, -32.375}, {-100, -32}}, color = {0, 127, 255}));
  connect(pipe1.port_b, tank1.ports[1]) annotation(
    Line(points = {{-110, 60}, {-66, 60}, {-66, 80}, {-60, 80}}, color = {0, 127, 255}));
  connect(tank2.ports[2], valveLinear2.port_a) annotation(
    Line(points = {{60, 80}, {61, 80}, {61, 104}, {60, 104}, {60, 60}, {180, 60}}, color = {0, 127, 255}));
  connect(pipe2.port_b, tank2.ports[1]) annotation(
    Line(points = {{50, 60}, {54, 60}, {54, 80}, {60, 80}}, color = {0, 127, 255}));
  connect(volumeFlowRate1.V_flow, volumeIntegratorWithReset1.u) annotation(
    Line(points = {{-24, -20}, {-24, 20}, {-70, 20}, {-70, -2}, {-60, -2}}, color = {0, 0, 127}));
  connect(triggeredTrapezoidV1.y, valveLinear1.opening) annotation(
    Line(points = {{-119, 10}, {-90, 10}, {-90, -24}}, color = {0, 0, 127}));
  connect(valveLinear1.port_b, pipe3_1.port_a) annotation(
    Line(points = {{-80, -32}, {-66, -32}}, color = {0, 127, 255}));
  connect(pipe3_1.port_b, volumeFlowRate1.port_a) annotation(
    Line(points = {{-46, -32}, {-34, -32}}, color = {0, 127, 255}));
  connect(triggeredTrapezoidV2.y, valveLinear2.opening) annotation(
    Line(points = {{172, 80}, {190, 80}, {190, 68}}, color = {0, 0, 127}));
  connect(booleanExpressionV2.y, triggeredTrapezoidV2.u) annotation(
    Line(points = {{122, 80}, {146, 80}, {146, 80}, {148, 80}}, color = {255, 0, 255}));
  connect(booleanExpressionV4.y, triggeredTrapezoidV4.u) annotation(
    Line(points = {{-60, -170}, {-44, -170}, {-44, -170}, {-42, -170}}, color = {255, 0, 255}));
  control.tank1_level = tank1.level;
  control.tank2_level = tank2.level;
  control.tank3_level = tank3.level;
  control.tank4_level = tank4.level;
  control.volumeIntegrator1 = volumeIntegratorWithReset1.y;
  control.volumeIntegrator2 = volumeIntegratorWithReset2.y;
  control.T4 = temperatureSensor4.T;
protected
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(graphics = {Line(origin = {-226, 101}, points = {{52, 19}})}, coordinateSystem(initialScale = 0.1)));
end Versuchsaufbau;
