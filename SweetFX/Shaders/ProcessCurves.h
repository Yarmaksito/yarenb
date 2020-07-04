   /*-----------------------------------------------------------.   
  /                          Filmiccurve                        /
  '-----------------------------------------------------------*/



float4 curr = ((c*(A*c+C*B)+D*E)/(c*(A*c+B)+D*F))-E/F;
float4 whiteScale = ((W*(A*W+C*B)+D*E)/(W*(A*W+B)+D*F))-E/F;
c = curr*whiteScale;