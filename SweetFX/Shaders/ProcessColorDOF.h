   /*-----------------------------------------------------------.   
  /                  Chromatic DOF Calculation                  /
  '-----------------------------------------------------------*/



float4 colorDof(float2 coords,float blur) //processing the sample
{
	float4 colDF = float4(0,0,0,1);
	
	colDF.x = tex2D(InputSampler,coords + float2(0.0,1.0)*texel*fringe*blur).x;
	colDF.y = tex2D(InputSampler,coords + float2(-0.866,-0.5)*texel*fringe*blur).y;
	colDF.z = tex2D(InputSampler,coords + float2(0.866,-0.5)*texel*fringe*blur).z; //by Marty McFly
	
	float3 lumcoeff = float3(0.299,0.587,0.114);
	float lum = dot(colDF.xyz,lumcoeff);
	float thresh = max((lum-threshold)*gain, 0.0);
	float3 nullcol = float3(0,0,0);
	colDF.xyz +=lerp(nullcol,colDF.xyz,thresh*blur);
	return colDF;
}