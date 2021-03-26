model SuperModel

  Boolean enable_leak(start = false);
  Boolean valve4_open(start = true);
  Boolean valve5_open(start = false);
  Boolean valve8_open(start = false);
  Boolean blocked_valve(start = false);
  Boolean open_valve_controller(start = false);
  
  Real pump_simulator_real(start = 1200);
  Real pump1_simulator_real(start = 1200);
  
  Boolean enable_drop_t1(start = false);
  Boolean enable_drop_t2(start = false);
  Boolean enable_drop_t3(start = false);
  
  Boolean enable_rise_t1(start = false);
  Boolean enable_rise_t2(start = false);
  Boolean enable_rise_t3(start = false);
  
  // Min Value: T1 = 0.45, T2 = 0.05; T3 = 0.05
  Real drop_value_t1 = 0.7;
  Real drop_value_t2 = 0.05;
  Real drop_value_t3 = 0.05;
  
  // Max value: T1 = 1.9, T2 = 4.55 ; T3 = 
  Real rise_value_t1 = 1.9;
  Real rise_value_t2 = 4.55;
  Real rise_value_t3 = 2;

equation
// Fault Models
// Pumps
  pump_simulator_real = if time >= 150 then 1200 else 1200;
  pump1_simulator_real = if time >= 150 then 1200 else 1200;
  
// Enable the leak
  enable_leak = if time >= 150 then false else false;
  
// Block Valves
  valve4_open = if time >= 150 then true else true;
  valve5_open = if time >= 150 then true else true;
  valve8_open = if time >= 150 then true else true;
  // Blocking the valve with the on-off-controller
  blocked_valve = if time >= 150 then false else false;
  // open or close the valve (only used when blocked_valve = true)
  open_valve_controller = if time >= 150 then false else false;
  
  // Enable drop or rise in the tanks
  enable_drop_t1 = if time > 20 then false else false;
  enable_drop_t2 = if time > 20 then false else false;
  enable_drop_t3 = if time > 20 then false else false;
  
  enable_rise_t1 = if time > 20 then false else false;
  enable_rise_t2 = if time > 20 then false else false;
  enable_rise_t3 = if time > 20 then false else false;

end SuperModel;
