model SuperModel_three_tanks
  Real valve1_simulator_real(start = 1);
  Real valve2_simulator_real(start = 1);
  Real valve3_simulator_real(start = 1);
  Real pump0_simulator_real(start = 10);
  Real valve_fault_tank1_real(start = 0);
  Real valve_fault_tank2_real(start = 0);
equation
  //FAULT MODELS
  valve1_simulator_real = if time >= 150 then 1 else 1;
  valve2_simulator_real = if time >= 150 then 1 else 1;
  valve3_simulator_real = if time >= 150 then 0 else 1;
  pump0_simulator_real = if time >= 150 then 100 else 100;
  valve_fault_tank1_real = if time >= 150 then 0 else 0;
  valve_fault_tank2_real = if time >= 150 then 0 else 0;


end SuperModel_three_tanks;
