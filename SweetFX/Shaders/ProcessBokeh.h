   /*-----------------------------------------------------------.   
  /                  Main Bokeh Processing                      /
  '-----------------------------------------------------------*/


float4 PS_ProcessDoFBokeh(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR 
{
	float depth = linearize(tex2D(SamplerDepth,IN.txcoord.xy).x);
	
	float fDepth = focalDepth;
	
	if (autofocus)
	{
		fDepth = linearize(tex2D(SamplerDepth,focus).x);
	}
	
	float blur = 0.0;
	if (manualdof)
	{    
		float a = depth-fDepth; //focal plane
		float b = (a-fdofstart)/fdofdist; //far DoF
		float c = (-a-ndofstart)/ndofdist; //near Dof
		blur = (a>0.0)?b:c;
	}
	else
	{
		float f = focalLength; //focal length in mm
		float d = fDepth*1000.0; //focal plane in mm
		float o = depth*1000.0; //depth in mm
		
		float a = (o*f)/(o-f); 
		float b = (d*f)/(d-f); 
		float c = (d-f)/(d*fstop*CoC); 
		
		blur = abs(a-b)*c;
	}
	blur = saturate(blur);
	float2 noise = rand(IN.txcoord.xy)*namount*blur;
	
	float w = (1.0/screenRes.x)*blur*maxblur+noise.x;
	float h = (1.0/screenRes.y)*blur*maxblur+noise.y;
	
	float4 col = float4(0,0,0,1);
	
	if(blur < 0.05) //some optimization thingy
	{
		col = tex2D(InputSampler, IN.txcoord.xy);
	}
	else
	{
	col = tex2D(InputSampler, IN.txcoord.xy);
	float s = 1.0;
	int ringsamples;
	for (int i = 1; i <= rings; i += 1)
	{
		ringsamples = i * samples;
		for (int j = 0 ; j < ringsamples ; j += 1)
		{
			float step = PI*2.0 / ringsamples;
			float pw = cos(j*step)*i;
			float ph = sin(j*step)*i;
			float p = 1.0;
			if (pentagon)
			{ 
				p = penta(float2(pw,ph));
			}
			col.xyz += colorDof(IN.txcoord.xy + float2(pw*w,ph*h),blur).xyz;  
			s += 1.0*lerp(1.0,i/rings,bias)*p;
		}
	}
	col = col/s; //divide by sample count
	}
	
	if (vignetting)
	{
		col *= vignette(IN.txcoord.xy);
	}
	
	return col;
}