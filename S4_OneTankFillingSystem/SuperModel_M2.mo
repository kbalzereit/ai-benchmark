model SuperModel_M2

  Real open_valve_leak(start = 1);
  // Don't change this value!
  Real valve_right(start = 1);
  // If you want to use the jammed system
  Boolean jammed_system = true;

  Real valve_jammed_left(start = 1);


equation
  // Fault Models
  // If 1 => Leak
  open_valve_leak = if time >= 100 then 0 else 0;
  
  // Simulate jam in valves
  valve_jammed_left = if time >= 150 then 1 else 1;
  
  valve_right = if time >= 150 then 1 else 1;

end SuperModel_M2;
