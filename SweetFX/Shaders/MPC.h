
   /*-----------------------------------------------------------.   
  /       Defining constants for MPC and Shaderanalyzer         /
  '-----------------------------------------------------------*/
#ifndef s0
  sampler s0 : register(s0);
  #define s1 s0
//sampler s1 : register(s1);

//float4 p0 : register(c0);  //width, height, counter and clock
  float4 p1 : register(c1); //pixelsize

//  #define width (p0[0])
//  #define height (p0[1])
//  #define counter (p0[2])
//  #define clock (p0[3])
//  #define px (p1[0]) //one_over_width 
//  #define py (p1[1]) //one_over_height

  #define px (p1.x) //one_over_width - pixelsize.x
  #define py (p1.y) //one_over_height - pixelsize.x

  //#define pxy float2(p1.xy)

  //#define PI acos(-1)
  #define MPC
#endif

