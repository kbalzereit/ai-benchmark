model IntegratorWithReset
  extends Modelica.Blocks.Continuous.Integrator;
  Modelica.Blocks.Interfaces.BooleanInput reset annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=-360)));
  Modelica.Blocks.Interfaces.BooleanOutput local_reset annotation(HideResult=true);
equation 
  connect(reset, local_reset);
  when local_reset then
    reinit(y, y_start);
  end when;
end IntegratorWithReset;
