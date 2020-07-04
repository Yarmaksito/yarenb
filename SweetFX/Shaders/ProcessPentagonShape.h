   /*-----------------------------------------------------------.   
  /                Optional Pentagonal Bokeh Shape              /
  '-----------------------------------------------------------*/


float penta(float2 coords) //pentagonal shape
{
	float scale = float(rings) - 1.3;
	float4  HS0 = float4( 1.0,         0.0,         0.0,  1.0);
	float4  HS1 = float4( 0.309016994, 0.951056516, 0.0,  1.0);
	float4  HS2 = float4(-0.809016994, 0.587785252, 0.0,  1.0);
	float4  HS3 = float4(-0.809016994,-0.587785252, 0.0,  1.0);
	float4  HS4 = float4( 0.309016994,-0.951056516, 0.0,  1.0);
	float4  HS5 = float4( 0.0        ,0.0         , 1.0,  1.0);
	
	float4  one = float4( 1,1,1,1 );
	
	float4 P = float4(coords,float2(scale, scale)); 
	
	float4 dist = float4(0,0,0,0);
	float inorout = -4.0;
	
	dist.x = dot( P, HS0 ); //by Marty McFly
	dist.y = dot( P, HS1 );
	dist.z = dot( P, HS2 );
	dist.w = dot( P, HS3 );
	
	dist = smoothstep( -feather, feather, dist );
	
	inorout += dot( dist, one );
	
	dist.x = dot( P, HS4 );
	dist.y = HS5.w - abs( P.z );
	
	dist = smoothstep( -feather, feather, dist );
	inorout += dist.x;
	
	return saturate( inorout );
}