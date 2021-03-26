model SuperModel_four_tanks
    Boolean pipe4_flow_bool(start = false);
    Real valve3(start = 1);
    Real valve6_jammed(start=1.0);
    Real tank2_leak_bool(start = 0);


equation
  // pipe4 jammed at 30 seconds
  pipe4_flow_bool = if time >= 150 then true else true;
  // valve3 jammed at 30s
  valve3 = if time >= 150 then 1 else 1;
  valve6_jammed = if time >= 150 then 0 else 1;
  // valve3 jammed at 30s
  tank2_leak_bool = if time >= 150 then 0 else 0;



end SuperModel_four_tanks;
