//SAGE(San Andreas Graphics Enhancement(Улучшение Графики San Andreas-а))
//Anti-Aliasing(well maybe later i add more)

//--------------------------------------------------------------------------------------
// Defines
//--------------------------------------------------------------------------------------

//#define AA_MODE_0
//#define AA_MODE_1
#define AA_MODE_2

//--------------------------------------------------------------------------------------
// Vectors, floats and etc.
//--------------------------------------------------------------------------------------

static const float ScreenScaleY;
static const float ScreenSize;

float _OffsetScale = 0.2;
float _BlurRadius = 18.0;

float2 texel = {0.0009765625,0.00130208333333333333333333333333};

//--------------------------------------------------------------------------------------
// Textures
//--------------------------------------------------------------------------------------

texture2D texColor;

//--------------------------------------------------------------------------------------
// Functions
//--------------------------------------------------------------------------------------

float Luminance( float3 c )
{
	return dot( c, float3(0.22, 0.707, 0.071) );
}

//--------------------------------------------------------------------------------------
// Sampler Inputs
//--------------------------------------------------------------------------------------

sampler2D InputSampler = sampler_state
{
    Texture = (texColor);
    MinFilter = Linear;
    MagFilter = Linear;
    MipFilter = Linear;
    AddressU   = Clamp;
	AddressV   = Clamp;
	SRGBTexture=FALSE;
	MaxMipLevel=0;
	MipMapLodBias=0;
};

struct VS_OUTPUT_POST
{
	float4 vpos  : POSITION;
	float2 txcoord : TEXCOORD0;
};

struct VS_INPUT_POST
{
	float3 pos  : POSITION;
	float2 txcoord : TEXCOORD0;
};

struct VS_OUTPUT_POST_SSAA
{
	float4 vpos : POSITION;
	float2 uv[5] : TEXCOORD0;
};

struct VS_OUTPUT_POST_NFAA
{
	float4 vpos : POSITION;
	float2 uv[8] : TEXCOORD0;
};

//--------------------------------------------------------------------------------------
// Functions
//--------------------------------------------------------------------------------------

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

VS_OUTPUT_POST_SSAA VS_PostProcessSSAA(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST_SSAA o;

	float4 pos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

	o.vpos=pos;
	
	float2 uv = IN.txcoord.xy;
	
	float w = 1.75;
			
	float2 up = float2(0.0, texel.y) * w;
	float2 right = float2(texel.x, 0.0) * w;	
	
	o.uv[0].xy = uv - up;
	o.uv[1].xy = uv - right;
	o.uv[2].xy = uv + right;
	o.uv[3].xy = uv + up;

	o.uv[4].xy = uv;
	
	return o;
}

VS_OUTPUT_POST_NFAA VS_PostProcessNFAA(VS_INPUT_POST IN)
{
	VS_OUTPUT_POST_NFAA o;
	float4 pos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);
	o.vpos=pos;
	
	float2 uv = IN.txcoord.xy;
			
	float2 up = float2(0.0, texel.y) * _OffsetScale;
	float2 right = float2(texel.x, 0.0) * _OffsetScale;	
		
	o.uv[0].xy = uv + up;
	o.uv[1].xy = uv - up;
	o.uv[2].xy = uv + right;
	o.uv[3].xy = uv - right;
	o.uv[4].xy = uv - right + up;
	o.uv[5].xy = uv - right -up;
	o.uv[6].xy = uv + right + up;
	o.uv[7].xy = uv + right -up;
	
	return o;
}

//--------------------------------------------------------------------------------------
// Pixel Shader Effects
//--------------------------------------------------------------------------------------

//--------------------------------------------------------------------------------------
//AntiAliasing
//--------------------------------------------------------------------------------------

float4 SSAA(VS_OUTPUT_POST_SSAA i, float2 vPos : VPOS) : COLOR 
{
		float4 outColor;
		
	    float t = Luminance( tex2D( InputSampler, i.uv[0] ).xyz );
		float l = Luminance( tex2D( InputSampler, i.uv[1] ).xyz);
		float r = Luminance( tex2D( InputSampler, i.uv[2] ).xyz);
		float b = Luminance( tex2D( InputSampler, i.uv[3] ).xyz);
	 
	    float2 n = float2( -( t - b ), r - l );
	    float nl = length( n );
	 
	    if ( nl < (1.0 / 16.0) )
			outColor = tex2D( InputSampler, i.uv[4] );
	    else {
			n *= texel.xy / nl;
	 
			float4 o = tex2D( InputSampler, i.uv[4]);
			float4 t0 = tex2D( InputSampler, i.uv[4] + n * 0.5) * 0.9;
			float4 t1 = tex2D( InputSampler, i.uv[4] - n * 0.5) * 0.9;
			float4 t2 = tex2D( InputSampler, i.uv[4] + n) * 0.75;
			float4 t3 = tex2D( InputSampler, i.uv[4] - n) * 0.75;
	 
			outColor = (o + t0 + t1 + t2 + t3) / 4.3;
	    }
	    
	    return outColor;
}

float4 NFAA (VS_OUTPUT_POST_NFAA i, float2 vPos : VPOS) : COLOR 
{	
	// get luminance values
	//  maybe: experiment with different luminance calculations
	float topL = Luminance( tex2D(InputSampler, i.uv[0]).rgb );
	float bottomL = Luminance( tex2D(InputSampler, i.uv[1]).rgb );
	float rightL = Luminance( tex2D(InputSampler, i.uv[2]).rgb );
	float leftL = Luminance( tex2D(InputSampler, i.uv[3]).rgb );
	float leftTopL = Luminance( tex2D(InputSampler, i.uv[4]).rgb );
	float leftBottomL = Luminance( tex2D(InputSampler, i.uv[5]).rgb );
	float rightBottomL = Luminance( tex2D(InputSampler, i.uv[6]).rgb );
	float rightTopL = Luminance( tex2D(InputSampler, i.uv[7]).rgb );
	
	// 2 triangle subtractions
	float sum0 = dot(float3(1,1,1), float3(rightTopL,bottomL,leftTopL));
	float sum1 = dot(float3(1,1,1), float3(leftBottomL,topL,rightBottomL));
	float sum2 = dot(float3(1,1,1), float3(leftTopL,rightL,leftBottomL));
	float sum3 = dot(float3(1,1,1), float3(rightBottomL,leftL,rightTopL));

	// figure out "normal"
	float2 blurDir = float2((sum0-sum1), (sum3-sum2));
	blurDir *= texel.xy * _BlurRadius;

	// reconstruct normal uv
	float2 uv_ = (i.uv[0] + i.uv[1]) * 0.5;
	 
	float4 returnColor = tex2D(InputSampler, uv_);
	returnColor += tex2D(InputSampler, uv_+ blurDir.xy);
	returnColor += tex2D(InputSampler, uv_ - blurDir.xy);
	returnColor += tex2D(InputSampler, uv_ + float2(blurDir.x, -blurDir.y));
	returnColor += tex2D(InputSampler, uv_ - float2(blurDir.x, -blurDir.y));

	return returnColor * 0.2;
}

float _EdgeThresholdMin = 0.125;
float _EdgeThreshold = 0.25;
float _EdgeSharpness = 4.0;

struct VS_OUTPUT_POST_FXAA {
	float4 vpos : SV_POSITION;
	float2 uv : TEXCOORD0;
	float4 interpolatorA : TEXCOORD1;
	float4 interpolatorB : TEXCOORD2;
	float4 interpolatorC : TEXCOORD3;
};

VS_OUTPUT_POST_FXAA VS_PostProcessFXAA (VS_INPUT_POST v)
{
	VS_OUTPUT_POST_FXAA o;
	float4 pos=float4(v.pos.x,v.pos.y,v.pos.z,1.0);
	o.vpos=pos;
	
	o.uv = v.txcoord.xy;
	
	float4 extents;
	float2 offset = ( texel.xy ) * 0.5f;
	extents.xy = v.txcoord.xy - offset;
	extents.zw = v.txcoord.xy + offset;

	float4 rcpSize;
	rcpSize.xy = -texel.xy * 0.5f;
	rcpSize.zw = texel.xy * 0.5f;			
	
	o.interpolatorA = extents;
	o.interpolatorB = rcpSize;
	o.interpolatorC = rcpSize;
	
	o.interpolatorC.xy *= 4.0;
	o.interpolatorC.zw *= 4.0;
	
	return o;
}

#define FxaaTexTop(t, p) tex2Dlod(t, float4(p, 0.0, 0.0))

inline float TexLuminance( float2 uv )
{
	return Luminance(FxaaTexTop(InputSampler, uv).rgb);
}

float3 FxaaPixelShader(float2 pos, float4 extents, float4 rcpSize, float4 rcpSize2)
{
	float lumaNw = TexLuminance(extents.xy);
	float lumaSw = TexLuminance(extents.xw);
	float lumaNe = TexLuminance(extents.zy);
	float lumaSe = TexLuminance(extents.zw);
	
	float3 centre = FxaaTexTop(InputSampler, pos).rgb;
	float lumaCentre = Luminance(centre);
	
	float lumaMaxNwSw = max( lumaNw , lumaSw );
	lumaNe += 1.0/384.0;
	float lumaMinNwSw = min( lumaNw , lumaSw );
	
	float lumaMaxNeSe = max( lumaNe , lumaSe );
	float lumaMinNeSe = min( lumaNe , lumaSe );
	
	float lumaMax = max( lumaMaxNeSe, lumaMaxNwSw );
	float lumaMin = min( lumaMinNeSe, lumaMinNwSw );
	
	float lumaMaxScaled = lumaMax * _EdgeThreshold;
	
	float lumaMinCentre = min( lumaMin , lumaCentre );
	float lumaMaxScaledClamped = max( _EdgeThresholdMin , lumaMaxScaled );
	float lumaMaxCentre = max( lumaMax , lumaCentre );
	float dirSWMinusNE = lumaSw - lumaNe;
	float lumaMaxCMinusMinC = lumaMaxCentre - lumaMinCentre;
	float dirSEMinusNW = lumaSe - lumaNw;
	
	if(lumaMaxCMinusMinC < lumaMaxScaledClamped)
		return centre;
	
	float2 dir;
	dir.x = dirSWMinusNE + dirSEMinusNW;
	dir.y = dirSWMinusNE - dirSEMinusNW;
	
	dir = normalize(dir);			
	float3 col1 = FxaaTexTop(InputSampler, pos.xy - dir * rcpSize.zw).rgb;
	float3 col2 = FxaaTexTop(InputSampler, pos.xy + dir * rcpSize.zw).rgb;
	
	float dirAbsMinTimesC = min( abs( dir.x ) , abs( dir.y ) ) * _EdgeSharpness;
	dir = clamp(dir.xy/dirAbsMinTimesC, -2.0, 2.0);
	
	float3 col3 = FxaaTexTop(InputSampler, pos.xy - dir * rcpSize2.zw).rgb;
	float3 col4 = FxaaTexTop(InputSampler, pos.xy + dir * rcpSize2.zw).rgb;
	
	float3 rgbyA = col1 + col2;
	float3 rgbyB = ((col3 + col4) * 0.25) + (rgbyA * 0.25);
	
	if((Luminance(rgbyA) < lumaMin) || (Luminance(rgbyB) > lumaMax))
		return rgbyA * 0.5;
	else
		return rgbyB;
}

float4 FXAA (VS_OUTPUT_POST_FXAA i, float2 vPos : VPOS) : COLOR
{
	float3 color = FxaaPixelShader(i.uv, i.interpolatorA, i.interpolatorB, i.interpolatorC);
	return float4(color, 1.0);
}

//--------------------------------------------------------------------------------------
// Compiler 1
//--------------------------------------------------------------------------------------


technique PostProcess
{	
	pass P0
	{
#ifdef AA_MODE_0
		VertexShader = compile vs_3_0 VS_PostProcessSSAA();
		PixelShader  = compile ps_3_0 SSAA();
#endif
#ifdef AA_MODE_1
		VertexShader = compile vs_3_0 VS_PostProcessNFAA();
		PixelShader  = compile ps_3_0 NFAA();
#endif
#ifdef AA_MODE_2
		VertexShader = compile vs_3_0 VS_PostProcessFXAA();
		PixelShader  = compile ps_3_0 FXAA();
#endif
	}
}
