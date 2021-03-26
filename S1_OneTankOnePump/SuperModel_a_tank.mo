model SuperModel
   Real valve0_simulator_real(start = 1);
   Real valve1_simulator_real(start = 1);
   Real pump0_simulator_real(start = 1200);
   Real valve_fault_tank1_real(start = 1);
equation
  //FAULT MODELS
  
  // valve1Blocked, stable, pumpSlow, valve1Stuck, tank_tank1_leak- then 1 else 1;
  // valve0Blocked - then 0 else 1;
  valve0_simulator_real = if time >= 150 then 0 else 1;
  // stable, valve0Blocked, pumpSlow, tank_tank1_leak - then 1 else 1;
  // valve1Stuck - then 0.5 else 1;y
  // valve1Blocked - then 0 else 1;
  valve1_simulator_real = if time >= 150 then 1 else 1;
  // stable, valve1Stuck, valve0Blocked, valve1Blocked, tank_tank1_leak - then 1200 else 1200;
  // pumpSlow - then 900 else 1200;
  pump0_simulator_real = if time >= 150 then 1200 else 1200;
  // stable, valve1Stuck, valve0Blocked, valve1Blocked, pumpSlow - then 0 else 0;
  // tank_tank1_leak - then 1 else 0;
  valve_fault_tank1_real = if time >= 150 then 0 else 0;

end SuperModel;
