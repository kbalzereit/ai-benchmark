model SuperModel_Heat 
  replaceable package Medium = Modelica.Media.Water.StandardWaterOnePhase constrainedby Modelica.Media.Interfaces.PartialMedium;
  
  Real pump_simulator_real(start = 1200);
  Real pump1_simulator_real(start = 1200);
  Real pump2_simulator_real(start = 1200);
  Real pump3_simulator_real(start = 1200);
  
  Real valve1_simulator_real(start = 1);
  Real valve2_simulator_real(start = 1);
  Real valve3_simulator_real(start = 1);
  Real valve4_simulator_real(start = 1);
  
  Real valve5_leak(start = 1);
  Real valve6_leak(start = 1);
  
  Real temp_tank(start = 15);
  Real temp_tank1(start = 70);
  
  Real new_temp_t1 = 70 - 70 * 0.1;
  Real new_temp_t = 15 - 15*0.2;
  
  Real perc_tank = 0.4;

equation
  // Fault models
  // Pumps
  pump_simulator_real = if time >= 150 then 1200 else 1200;
  pump1_simulator_real = if time >= 150 then 1200 else 1200;
  pump2_simulator_real = if time >= 150 then 900 else 1200;
  pump3_simulator_real = if time >= 150 then 1200 else 1200;
  
  // Valves
  valve1_simulator_real = if time >= 150 then 1 else 1;
  valve2_simulator_real = if time >= 150 then 1 else 1;
  valve3_simulator_real = if time >= 150 then 1 else 1;
  valve4_simulator_real = if time >= 150 then 1 else 1;

  valve5_leak = if time >= 150 then 0 else 0;
  valve6_leak = if time >= 150 then 0 else 0;
  
  // Change temperature
  temp_tank = if time >= 150  then new_temp_t else 15;
  temp_tank1 = if time >= 150 then new_temp_t1 else 70;
  
end SuperModel_Heat;
