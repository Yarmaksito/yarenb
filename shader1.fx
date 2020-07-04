// Tonemapping, Sharpen, and Desaturation effects for SA - DKT70 - Feb 2011.

// HDR Settings.
float Defog=0.4; // Strength of FogColor, higher = more.
float4 FogColor={0.2, 0.025, 0.025, 0.02}; // Lens-style color filters for Blue, Red, Yellow, White.
float Exposure=5.666; // Contrast settings, higher = brighter, but also more white.
float Gamma=1.0; // Gamma settings for darker or lighter shadows and dark areas, higher = darker.
float BlueShift=5.20; // Shifts entire color spectrum towards blue, good for images too yellow, but this is global.

// Saturation Levels.
float sat = 0.5; // Saturation levels, higher values = less saturation, 0 = off.

// Sharpen effect settings. For some good settings try using double your resolution in sxres and syres, and keep sharp strength double the offset. 
float sharps = 0.10; // Sharpen Strength.
float offsetv = 0.60; // Offset value, higher = more offset from center.
float sxres = 2880; // Horizontal Resolution setting.
float syres = 1800; // Vertical Resolution setting.
float aspect = 1.6; // Aspect Ratio.

//Filmiccurve by icelaglace ported to SA by Marty McFly
float   A = 0.15; // Shoulder Strength 
float   B = 0.35; // Linear Strength
float   C = 0.15; // Linear Angle
float   D = 0.20; // Toe Strength
float   E = 0.02; // Toe Numerator
float   F = 2.20; // Toe Denominator
float   W = 30.0; // White Scale

//Vignette

float2 VignetteCenter = (0.500,0.500); 
float VignetteRadius = 0.65;
float VignetteAmount = -0.9; 

//--------------------------------------------------------------------------------------
// Textures
//--------------------------------------------------------------------------------------
texture2D texColor;

//--------------------------------------------------------------------------------------
// Sampler Inputs
//--------------------------------------------------------------------------------------


sampler2D InputSampler = sampler_state
{
     Texture = (texColor);
     MinFilter = Point;
     MagFilter = Anisotropic;
     MipFilter = Point;
     AddressU  = Clamp;
     AddressV  = Clamp;
     SRGBTexture=FALSE;
     MaxMipLevel=0;
     MipMapLodBias=0;
};


struct VS_OUTPUT_POST {
 float4 vpos  : POSITION;
 float2 txcoord : TEXCOORD0;
};

struct VS_INPUT_POST {
 float3 pos  : POSITION;
 float2 txcoord : TEXCOORD0;
};

float pixelWidth;
float pixelHeight;


//--------------------------------------------------------------------------------------
// Vertex Shader Input
//--------------------------------------------------------------------------------------

VS_OUTPUT_POST VS_PostProcess(VS_INPUT_POST IN)
{
 VS_OUTPUT_POST OUT;

 float4 pos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

 OUT.vpos=pos;
 OUT.txcoord.xy=IN.txcoord.xy;

 return OUT;
}

//--------------------------------------------------------------------------------------
// Pixel Shader
//--------------------------------------------------------------------------------------

float4 main(float2 uv : TEXCOORD) : COLOR
{
    float4 c = tex2D(InputSampler, uv);
	 
    c.rgb = max(0, c.rgb - Defog * FogColor.rgb);
    c.rgb *= pow(2.0f, Exposure);
    c.rgb = pow(c.rgb, Gamma);
	
    float2 tc = uv - VignetteCenter;
    float v = length(tc) / VignetteRadius;
    c.rgb += pow(v, 4) * VignetteAmount;

    float3 d = c.rgb * float3(1.05f, 0.97f, 1.27f);
    c.rgb = lerp(c.rgb, d, BlueShift);
 
    float4 curr = ((c*(A*c+C*B)+D*E)/(c*(A*c+B)+D*F))-E/F;
    float4 whiteScale = ((W*(A*W+C*B)+D*E)/(W*(A*W+B)+D*F))-E/F;
    c = curr*whiteScale;

    float2 InputSize = float2(sxres, syres/aspect);
    float Amount = sharps;
    float2 offset = offsetv / InputSize;
    float4 color;
    color = tex2D(InputSampler, uv);
    color += tex2D(InputSampler, uv - offset) * Amount;
    color -= tex2D(InputSampler, uv + offset) * Amount;
	
	float middlegray=(c.r+c.g+c.b)*0.333;
	float3 diffcolor=c.rgb-middlegray;
	c.rgb+=diffcolor*-sat;

    return c * color; 
}




//--------------------------------------------------------------------------------------
// Compiler
//--------------------------------------------------------------------------------------
technique PostProcess
{
    pass P0
    {
#ifdef E_SHADER_3_0
 VertexShader = compile vs_3_0 VS_PostProcess();
 PixelShader  = compile ps_3_0 main();
#else
 VertexShader = compile vs_2_0 VS_PostProcess();
 PixelShader  = compile ps_2_0 main();
#endif

 ZEnable=FALSE;
 CullMode=NONE;
 ALPHATESTENABLE=FALSE;
 SEPARATEALPHABLENDENABLE=FALSE;
 AlphaBlendEnable=FALSE;
 FogEnable=FALSE;
 SRGBWRITEENABLE=FALSE;
 }
}
