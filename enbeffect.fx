//++++++++++++++++++++++++++++++++++++++++++++
// ENBSeries effect file
// visit http://enbdev.com for updates
// Copyright (c) 2007-2013 Boris Vorontsov
// MasterEffect 2 enbeffect.fx file
// Copyright by MartyMcFly
// IF YOU UPLOAD YOUR ENB SOMEWHERE. DO NOT REMOVE 
// THIS COPYRIGHT OR YOUR ENB WILL BE REPORTED
//++++++++++++++++++++++++++++++++++++++++++++


// For ENB version 0.139 and up have "FLIP_NITE_DAY_FACTOR" enabled and "FLIP_INT_EXT_FACTOR" disabled.
// For ENB version 0.119 and up have "FLIP_NITE_DAY_FACTOR" enabled and "FLIP_INT_EXT_FACTOR" enabled.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#define FLIP_INT_EXT_FACTOR			0	// Flips the interior and exterior factor, so that interior settings affect exteriors and vice versa.
//INTERIOR, EXTERIOR SEPARATION IS NOT USED BY 0.238 FOR NOW!!!

#define FLIP_NITE_DAY_FACTOR			1	// Flips the day and night factor, so that day settings affect nights and vice versa.
		
// Post bloom results in a higher dynamic range, pre bloom blends in with the scene better.
// Choose one, two will break the file.
#define PRE_BLOOM				1	// Bloom happens before my post processing code	
#define POST_BLOOM				0	// Bloom happens after my post processing code
		
// Bloom type (choose one)
#define CURVE_BLOOM 				0	// Precise bloom type that avoids affecting dark areas.
#define CRISP_BLOOM		 	 	0	// Crisp bloom that avoids blurring colors around too much.
#define DIFFUSE_BLOOM				0	// More controlled and accurate bloom than default.
#define ENB_BLOOM		 		1 	// Default ENB bloom with HSV color controls.

// Bloom mixing type (multiple selections possible)
#define BLOOM_COLORIZATION	 		0	// Adjusts intensity of bloom RGB and CMY color channels.
#define BLOOM_DEFUZZ		 		0	// Attempts to remove some haziness from bloom.
#define BLOOM_ADD			 	0	// Uses addition for bloom, adding it to the original image. Most reliable option.
#define BLOOM_LERP			 	1	// Uses interpolation to blend the bloom colors with the orginal image. Results in a hazy effect.

// Various color controls
#define HSV_CONTROLS				0	// Modifies colors using Hue/Saturation/Value controls.
#define HSV_EQUALIZER		 		0	// Adjusts saturation of various colors individually.
#define COLOR_FILTER		 		0	// Adjusts intensity of RGB and CMY color channels.
#define COLORSAT_DAYNIGHT			0	// Adjusts saturation (not the same as intensity) of RGB and CMY color channels.
#define COLOR_TWEAKS		 		0	// Provides control over brightness, contrast and saturation with in-game adjustment.
#define FINAL_ADJUSTMENTS			0	// Highest quality brightness, saturation and contrast controls in the file. Happens after all other effects.
#define COLOR_POLARIZATION			0	// Polarizes original colors along the color wheel based on a specified color, original colors close to the specified color will be shifted towards it and opposite colors will be accentuated.
#define COLOR_GRADING				0	// Original RGB color channels are shifted towards a specified color, then remixed.
#define BLEACH_BYPASS				0	// Effect used in cinema that desaturates the image and increases contrast.
#define SEPIATONE	    			0   	// Effect used in cinema that desaturates and tints the image.
#define ENB_PALETTE				1	// Enables ENB palette texture mixing. Enable UsePaletteTexture in enbseries.ini. Warning: Limits dynamic range!
#define ENB_PALETTE_LENSDIRT			0	// Adds a BF3-Style Lens Dirt to the screen, enblensdirt.bmp must be in GTA root folder
#define POSTPROCESS				1	// Choose which post-processing effect to use, options range from 0 through 8.
#define TVLEVELS   				1	// Sets a new black and white point. This increases contrast but causes clipping. 
#define VIBRANCE 				1	// Intelligently (de)saturates the pixels depending on their original saturation.
#define MASTEREFFECT_TONEMAP 			0	// Basic tonemap with filmiccurve and addcontrast function. Useful for beginners!
#define CROSSPROCESS 				0	// Imitates wrong chemistry of image processing, similiar to GTA V death/menu tint or old movie colorcorrection.
#define SPHERICAL				1	// Tonemapper from Sonic Ether's Unbelieveable Shaders
#define CINEONDPX           			0	// Should make the image look like it's been converted to DPX Cineon
#define SINCITY					0	// Effect from the movie "Sin City" - everything else than red is grey.
#define COLORMOD				0	// Contrast, Saturation and Brightness ported from colormod.asi

// Overlay effects
#define MT_VIGNETTE 	    			0   	// Darkens edges of the screen slightly to increase focus on the center.
#define HD6_VIGNETTE				1	// A slightly different take on vignette.
#define GRAIN					0	// Enables animated film grain.
#define SHARPEN 				1	// Sharps the image
#define LETTERBOX_BARS 				1	// Simulates a higher aspect ratio display for a more cinematic effect.
#define BORDER					0	// 1 pixel broad border around screen to eliminate white outlining by excessive sharpening

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

					//////////////////////
					///FINAL ADJUSTMENTS//
					//////////////////////

//Final color adjustments. I highly reccommend you use this effect instead of other saturation/contrast/brightness adjustments
//when possible as it uses the most advanced formula out of any of them and produces the most mathematically and visually accurate results.

float3 SaturationDay 			= 	float3(1.0, 1.0, 1.0);		//Adjusts saturation, higher is more saturated
float BrightnessDay 			= 	0.50;				//Adjusts brightness, higher is brighter
float ContrastDay 			= 	0.0;				//Adjusts contrast, higher is more defined, values range from -1.0 to 1.0

float SaturationNight 			= 	float3(0.6, 0.6, 0.6);
float BrightnessNight 			= 	0.50;
float ContrastNight 			= 	0.0;

float SaturationInt 			= 	float3(1.0, 1.0, 1.0);
float BrightnessInt 			= 	0.50;
float ContrastInt 			= 	0.0;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


					//////////////////////
					//////TV LEVELS///////
					//////////////////////

float DARK_LEVEL_DAY  			=	12.95;	// Brightness percent value - anything below this is completely black
float DARK_LEVEL_NIGHT  		=	12.95;		
float DARK_LEVEL_INT 			=	12.95;	
		
float BRIGHT_LEVEL_DAY			=	 0.0;   // Brightness percent value - anything above this is completely white
float BRIGHT_LEVEL_NIGHT		=	 0.0;
float BRIGHT_LEVEL_INT			=	 0.0;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


					//////////////////////
					//////VIBRANCE////////
					//////////////////////

float VibranceDay			=	0.88;	// Amount of intelligent saturation applied
float VibranceNight			=	0.88;
float VibranceInterior			=	0.88;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


				  //////////////////////////////////
				  //////MASTEREFFECT_TONEMAP////////
				  //////////////////////////////////

float MGammaDay				=	0.75;	// Gamma curve
float MGammaNight				=	0.75;
float MGammaInterior			=	0.75;

float MExposureDay				=	0.05;   // Brightness, higher means brighter but also more white
float MExposureNight			=	0.05;
float MExposureInterior			=	0.05;

float MSaturationDay			=	0.0;   // Color saturation
float MSaturationNight			=	0.0;
float MSaturationInterior			=	0.0;

float MBleachDay				=	0.0;  // desaturates and increases contrast to simulate bleached out image
float MBleachNight				=	0.0;
float MBleachInterior				=	0.0;

float MDefogDay				=	0.0;   // amount of color removal
float MDefogNight				=	0.0;
float MDefogInterior				=	0.0;

float MFogColorDay				=	float3(0.0, 0.0, 0.0);  // which color to remove, default blue is removed by -0.30
float MFogColorNight			=	float3(0.0, 0.0, 0.0);  // negative value means that blue isn't removed but added :P
float MFogColorInterior			=	float3(0.0, 0.0, 0.0);

float MADay 				=	0.15;  
float MANight  				=	0.15; 
float MAInterior  				=	0.15; 

float MBDay  				=	0.35;
float MBNight  				=	0.35;
float MBInterior  				=	0.35;

float MCDay  				=	0.15; 
float MCNight  				=	0.15; 
float MCInterior	  			=	0.15; 

float MDDay  				=	0.20;
float MDNight  				=	0.20;
float MDInterior 	 			=	0.20;

float MEDay  				=	0.02; 
float MENight  				=	0.02; 
float MEInterior  				=	0.02; 

float MFDay  				=	2.20; 
float MFNight  				=	2.20; 
float MFInterior 	 			=	2.20; 

float MWDay  				=	30.0; 
float MWNight  				=	30.0; 
float MWInterior  				=	30.0; 

float MExpAdjustDay 			=	4.5;
float MExpAdjustNight 			=	4.5;
float MExpAdjustInterior	 		=	4.5;

float MAddContrastDay			=	0.0;
float MAddContrastNight			=	0.0;
float MAddContrastInterior			=	0.0;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

				  
				     /////////////////////////////
				     //////CROSSPROCESSING////////
				     /////////////////////////////

float CrossContrastDay			= 	1.1;	// Contrast
float CrossContrastNight		= 	1.1;
float CrossContrastInterior		= 	1.1;

float CrossSaturationDay		= 	0.85;	// Saturation
float CrossSaturationNight		= 	0.85;
float CrossSaturationInterior		= 	0.85;

float CrossBrightnessDay		= 	-0.145; // Brightness...
float CrossBrightnessNight		= 	-0.145;
float CrossBrightnessInterior		=	-0.145;

float CrossAmountDay			= 	0.8;	// Amount of Cross Processing applied, the higher, the more the color gets cross processed
float CrossAmountNight			= 	0.8;
float CrossAmountInterior		= 	0.8;

// DO NOT CHANGE THIS!!!!
float2 CrossMatrix [3] = {
						float2 (1.03, 0.04),
						float2 (1.09, 0.01),
						float2 (0.78, 0.13),
 			 };				
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


				   /////////////////////////////////
				   //////SPHERICAL TONEMAPPING//////
				   /////////////////////////////////



float sphericalAmountDay 		= 0.1;					// Increases the amount of tonemapping applied
float sphericalAmountNight 		= 0.1;
float sphericalAmountInterior 		= 0.1;

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


					//////////////////////
					//////CINEON DPX//////
					//////////////////////

float DPXRedDay 			= 	5.0;				// Increases power of the specific color
float DPXGreenDay 			=	5.0;
float DPXBlueDay 			= 	5.0;

float DPXRedNight 			= 	5.0;
float DPXGreenNight 			= 	5.0;
float DPXBlueNight 			= 	5.0;

float DPXRedInterior 			= 	5.0;
float DPXGreenInterior 			= 	5.0;
float DPXBlueInterior 			= 	5.0;

float DPXColorGammaDay 			= 	1.0;				// Increases polor curve
float DPXColorGammaNight		= 	1.0;
float DPXColorGammaInterior 		= 	1.0;

float DPXDPXSaturationDay 		= 	1.0;				// Increases color saturation
float DPXDPXSaturationNight 		= 	1.0;
float DPXDPXSaturationInterior 		= 	1.0;

float DPXRedCDay 			= 	0.35;				// Increases curve of the specific color
float DPXGreenCDay 			= 	0.35;
float DPXBlueCDay 			= 	0.34;
	
float DPXRedCNight 			= 	0.35;
float DPXGreenCNight 			= 	0.35;
float DPXBlueCNight 			= 	0.34;

float DPXRedCInterior 			= 	0.35;
float DPXGreenCInterior 		= 	0.35;
float DPXBlueCInterior 			= 	0.34;

float DPXBlendDay 			= 	1.0;				// Increases DPX Intensity
float DPXBlendNight 			= 	1.0;
float DPXBlendInterior			= 	1.0;				// But will it blend? :O

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

					//////////////////////
					///////COLORMOD///////
					//////////////////////

float ColormodChroma 			= 	1.00;				// Saturation

float ColormodGammaR 			= 	0.60;				// Gamma for Red color channel
float ColormodGammaG 			= 	0.60;				// Gamma for Green color channel
float ColormodGammaB 			= 	0.60;				// Gamma for Blue color channel

float ColormodContrastR	 		= 	0.50;				// Contrast for Red color channel
float ColormodContrastG 			= 	0.50;				// ...
float ColormodContrastB 			= 	0.50;				// ...
			
float ColormodBrightnessR 			= 	-0.14;				// Brightness for Red color channel
float ColormodBrightnessG 			= 	-0.14;				// ...
float ColormodBrightnessB 			= 	-0.14;				// ...

//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

					//////////////////////
					/////CURVE BLOOM//////
					//////////////////////
#if(CURVE_BLOOM == 1)


#define SHARP_MODE				1				// Enables a sharper version of Curve Bloom.

//Curve Bloom Day settings.////////////////////////////////////
float3 	curvebloommultDay 		= 	float3( 1.0, 1.0, 1.0 ); 	// Adjusts intensity of RGB color channels
float3 	curvebloomsubDay  		= 	float3( 0.0, 0.0, 0.0 ); 	// Intensity adjustment using subtraction
float 	curveMAGENTAbloomDay 		= 	1.0;				// Increases the amount of magenta color there is in bloom
float 	curveCYANbloomDay	  	= 	1.0;				// Increases the amount of cyan color there is in bloom
float 	curveYELLOWbloomDay  		= 	1.0;				// Increases the amount of yellow color there is in bloom
	
float   BloomThresholdDay 		= 	1.4;				//Adjusts curve bloom brightness threshold, higher is less sensitive to brightness
float   BloomCurveDay 			= 	1.0;				//Adjusts curve bloom brightness before contrast adjustment, higher is darker
float   BloomBrightnessDay 		= 	1.0;				//Adjusts brightness of curve bloom after contrast adjustment, higher is brighter
float 	BloomContrastDay 		= 	1.5;				//Adjusts contrast of curve bloom, higher is more defined
float3  BloomSaturationDay 		= 	float3(1.2, 0.85, 0.97);	//Adjusts saturation of curve bloom, higher is more colorful

//Curve Bloom Night settings./////////////////////////////////
float3 	curvebloommultNight 		= 	float3( 1.0, 1.0, 1.0 );
float3 	curvebloomsubNight  		= 	float3( 0.0, 0.0, 0.0 );
float 	curveMAGENTAbloomNight 		= 	1.0;
float 	curveCYANbloomNight		= 	1.0;
float 	curveYELLOWbloomNight  		= 	1.0;

float   BloomThresholdNight 		= 	1.4;
float   BloomCurveNight 		=	1.0;
float   BloomBrightnessNight 		= 	1.0;
float 	BloomContrastNight 		= 	1.5;
float3  BloomSaturationNight 		= 	float3(1.2, 0.85, 0.97);					
		
//Curve Bloom Interior settings.//////////////////////////////
float3 	curvebloommultInterior 		= 	float3( 1.0, 1.0, 1.0 );
float3 	curvebloomsubInterior  		= 	float3( 0.0, 0.0, 0.0 );
float 	curveMAGENTAbloomInterior 	= 	1.0;
float 	curveCYANbloomInterior		= 	1.0;
float 	curveYELLOWbloomInterior 	= 	1.0;

float   BloomThresholdInt 		= 	1.4;
float   BloomCurveInt 			= 	1.0;
float   BloomBrightnessInt 		= 	1.0;
float 	BloomContrastInt		= 	1.5;
float3  BloomSaturationInt 		= 	float3(1.0, 1.0, 1.0);					
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif


					//////////////////////
					/////CRISP BLOOM//////
					//////////////////////
#if(CRISP_BLOOM == 1)
// HD6 BLOOM CRISP - Alternate crisp bloom, no hazey mud.

//DAY

float3 crispbloommultDay 		= 	float3( 1.0, 1.0, 1.0 ); 				// Increase Red, Green and Blue bloom colors seperately
float3 crispbloomsubDay  		= 	float3( 0.0, 0.0, 0.0 ); 				// Alters appearance of the Red, Green and Blue bloom colors
float crispMAGENTAbloomDay 		= 	1.0;				   			// Increases the amount of magenta color there is in bloom
float crispCYANbloomDay	  		= 	1.0;				   			// Increases the amount of cyan color there is in bloom
float crispYELLOWbloomDay  		= 	1.0;				   			// Increases the amount of yellow color there is in bloom

float3 LumCoeffDay 			= 	( 0.2125, 0.7154, 0.0721 );				// Increases brightness around "bloomy" spots
float3 AvgLuminDay 			= 	( 0.5, 0.5, 0.5 );					// Increases contrast around "bloomy" spots
	
float TrigDay 				= 	0.18;							// Limits what triggers a bloom
float SBrightDay 			= 	0.7;							// Limits bloom to superbright spots only

float CBrightnessDay 			=	1.0;							// Adjust the bloom brightness
float CContrastDay 			= 	1.1;							// Adjust the bloom contrast
float CSaturationDay 			= 	1.0;							// Adjust the bloom saturation

float BrightnessModDay 			= 	0.0;							// Compensate the brightness when no bloom is used
float BrightnessMultDay 		= 	1.0;							// Compensate the brightness when no bloom is used

float CompSBDay 			= 	1.0;							// Limits where the bloom will "bloom"
float BloomStrDay 			= 	1.0;							// How strong the bloom will be

float BloomBlendDay 			= 	0.5;							// How much blend there will be between ENB and Vanilla bloom
float BlendCompDay 			= 	1.0;							// Compensate for brightening caused by above bloom blend
		
//NIGHT

float3 crispbloommultNight 		= 	float3( 1.0, 1.0, 1.0 );
float3 crispbloomsubNight  		= 	float3( 0.0, 0.0, 0.0 );
float crispMAGENTAbloomNight 		= 	1.0;
float crispCYANbloomNight		=	1.0;
float crispYELLOWbloomNight  		= 	1.0;

float3 LumCoeffNight 			= 	( 0.2125, 0.7154, 0.0721 );	// Increases brightness around "bloomy" spots
float3 AvgLuminNight 			= 	( 0.5, 0.5, 0.5 );			// Increases contrast around "bloomy" spots
	
float TrigNight 			= 	0.18;		 					// Limits what triggers a bloom
float SBrightNight 			= 	0.7;							// Limits bloom to superbright spots only

float CBrightnessNight 			= 	1.0;							// Adjust the bloom brightness
float CContrastNight 			= 	1.1;							// Adjust the bloom contrast
float CSaturationNight 			= 	1.0;							// Adjust the bloom saturation

float BrightnessModNight 		=	0.0;							// Compensate the brightness when no bloom is used
float BrightnessMultNight 		= 	1.0;							// Compensate the brightness when no bloom is used

float CompSBNight 			= 	1.0;							// Limits where the bloom will "bloom"
float BloomStrNight 			= 	1.0;							// How strong the bloom will be

float BloomBlendNight 			= 	0.5;							// How much blend there will be between ENB and Vanilla bloom
float BlendCompNight 			=	1.0;							// Compensate for brightening caused by above bloom blend
		
//Interior

float3 crispbloommultInterior 		= 	float3( 1.0, 1.0, 1.0 );
float3 crispbloomsubInterior  		= 	float3( 0.0, 0.0, 0.0 );
float crispMAGENTAbloomInterior 	= 	1.0;
float crispCYANbloomInterior		= 	1.0;
float crispYELLOWbloomInterior 		= 	1.0;

float3 LumCoeffInterior 		= 	( 0.2125, 0.7154, 0.0721 );	// Increases brightness around "bloomy" spots
float3 AvgLuminInterior 		= 	( 0.5, 0.5, 0.5 );			// Increases contrast around "bloomy" spots
	
float TrigInterior 			= 	0.18;							// Limits what triggers a bloom
float SBrightInterior 			= 	0.7;							// Limits bloom to superbright spots only

float CBrightnessInterior 		= 	1.0;							// Adjust the bloom brightness
float CContrastInterior 		= 	1.1;							// Adjust the bloom contrast
float CSaturationInterior 		= 	0.8;							// Adjust the bloom saturation

float BrightnessModInterior 		= 	0.0;							// Compensate the brightness when no bloom is used
float BrightnessMultInterior 		= 	1.0;							// Compensate the brightness when no bloom is used

float CompSBInterior 			= 	1.0;							// Limits where the bloom will "bloom"
float BloomStrInterior 			= 	1.0;							// How strong the bloom will be

float BloomBlendInterior 		= 	0.5;							// How much blend there will be between ENB and Vanilla bloom
float BlendCompInterior 		= 	1.0;							// Compensate for brightening caused by above bloom blend
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif
/////////////////////
///DIFFUSE BLOOM/////
/////////////////////
#if(DIFFUSE_BLOOM == 1)
//-----------------------------------------------------------------------------------------------------------
// Diffuse Bloom Day.		  Red, Green, Blue
float3 diffbloommultDay = float3( 1.0, 1.0, 1.0 ); // Increase Red, Green and Blue bloom colors seperately
float3 diffbloomsubDay  = float3( 0.0, 0.0, 0.0 ); // Alters appearance of the Red, Green and Blue bloom colors
float diffMAGENTAbloomDay = 1.0;				   // Increases the amount of magenta color there is in bloom
float diffCYANbloomDay	  = 1.0;				   // Increases the amount of cyan color there is in bloom
float diffYELLOWbloomDay  = 1.0;				   // Increases the amount of yellow color there is in bloom
float SatDay 	= 1.0;						   // Controls the saturation of the diffuse bloom
float LumaDay 	= 1.0;						   // Controls the Luminosity/brightness of the diffuse bloom
float PowDay 	= 2.0;						   // Dampens the bloom, making it less visible
float Pow2Day 	= 0.0001;					   // Dampens the bloom, making it less visible
		
// Diffuse Bloom Night.		   Red, Green, Blue
float3 diffbloommultNight = float3( 1.0, 1.0, 1.0 );
float3 diffbloomsubNight  = float3( 0.0, 0.0, 0.0 );
float diffMAGENTAbloomNight = 1.0;
float diffCYANbloomNight	= 1.0;
float diffYELLOWbloomNight  = 1.0;
float SatNight 	 = 1.0;
float LumaNight  = 1.0;
float PowNight 	 = 2.0;
float Pow2Night  = 0.0001;
		
// Diffuse Bloom Interior.		  Red, Green, Blue
float3 diffbloommultInterior = float3( 1.0, 1.0, 1.0 );
float3 diffbloomsubInterior  = float3( 0.0, 0.0, 0.0 );
float diffMAGENTAbloomInterior = 1.0;
float diffCYANbloomInterior	   = 1.0;
float diffYELLOWbloomInterior  = 1.0;
float SatInterior 	= 1.0;
float LumaInterior 	= 1.0;
float PowInterior 	= 2.0;
float Pow2Interior 	= 0.0001;
//-----------------------------------------------------------------------------------------------------------
#endif
/////////////////////
///ENB BLOOM/////////
/////////////////////
#if(ENB_BLOOM == 1)
//-----------------------------------------------------------------------------------------------------------
// ENB Bloom settings.

// DAY							 		Red, Green, Blue
float3 ENBbloommultDay 			= float3( 1.0, 1.0, 1.0 ); // Increase Red, Green and Blue bloom colors seperately
float3 ENBbloomsubDay  			= float3( 0.0, 0.0, 0.0 ); // Alters appearance of the Red, Green and Blue bloom colors
float ENBMAGENTAbloomDay 		= 1.0;					  // Increases the amount of magenta color there is in bloom
float ENBCYANbloomDay	 		= 1.0;					  // Increases the amount of cyan color there is in bloom
float ENBYELLOWbloomDay	 		= 1.0;					  // Increases the amount of yellow color there is in bloom

float fBloomIntensityMultDay 	= 1.0;	// Controls brightness of bloom. Higher values are brighter.
float fBloomIntensityModDay 	= 0.0;	// Controls brightness of bloom. Higher values are brighter.
float fBloomIntensityCurveDay 	= 1.0;	// Controls brightness curve of bloom. Higher values make midranges darker.
float fBloomIntensitySmoothDay 	= 0.0;	// Controls brightness contrast of bloom. Makes darks darker and brights brighter.
float fBloomIntensityMaxDay 	= 1.0;	// Controls brightness maximum of bloom.
float fBloomSaturationMultDay 	= 1.0;	// Controls the saturation of bloom. Higher values are more colorful.
float fBloomSaturationCurveDay 	= 1.0;	// Controls the saturation curve of bloom. Higher values reduce midrange colors.
float fBloomSaturationSmoothDay = 0.0;	// Controls the saturation contrast of bloom. Reduces subtle coloring.

// NIGHT						  			Red, Green, Blue
float3 ENBbloommultNight 			= float3( 1.0, 1.0, 1.0 );
float3 ENBbloomsubNight  			= float3( 0.0, 0.0, 0.0 );
float ENBMAGENTAbloomNight 			= 1.0;
float ENBCYANbloomNight	   			= 1.0;
float ENBYELLOWbloomNight  			= 1.0;

float fBloomIntensityMultNight    	= 1.0;
float fBloomIntensityModNight 	  	= 0.0;
float fBloomIntensityCurveNight   	= 1.0;
float fBloomIntensitySmoothNight  	= 0.0;
float fBloomIntensityMaxNight 	  	= 1.0;
float fBloomSaturationMultNight   	= 1.0;
float fBloomSaturationCurveNight  	= 1.0;
float fBloomSaturationSmoothNight 	= 0.0;

// INTERIOR							  		Red, Green, Blue
float3 ENBbloommultInterior 		= float3( 1.0, 1.0, 1.0 );
float3 ENBbloomsubInterior  		= float3( 0.0, 0.0, 0.0 );
float ENBMAGENTAbloomInterior 		= 1.0;
float ENBCYANbloomInterior	  		= 1.0;
float ENBYELLOWbloomInterior  		= 1.0;

float fBloomIntensityMultInterior 	= 1.0;
float fBloomIntensityModInterior  	= 0.0;
float fBloomIntensityCurveInterior 	= 1.0;
float fBloomIntensitySmoothInterior = 0.0;
float fBloomIntensityMaxInterior 	= 10.0;
float fBloomSaturationMultInterior 	= 1.0;
float fBloomSaturationCurveInterior = 1.0;
float fBloomSaturationSmoothInterior= 0.0;
//-----------------------------------------------------------------------------------------------------------
#endif

/////////////////////
///COLOR FILTER//////
/////////////////////
#if(COLOR_FILTER == 1)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// COLOR SETTINGS
//NOTE; IF YOU SET BOTH RED, GREEN AND BLUE AT THE SAME VALUE IT WILL ACT AS AN BRIGHTNESS COMMAND. SAME GOES FOR MAGENTA, CYAN AND YELLOW.
//									   Red, Green, Blue
float3	EColorFilterDay 	 = float3 ( 1.0, 1.0, 1.0 );// Adjusts the RGB values seperately, Red, Green and Blue.
float3	EColorFilterNight 	 = float3 ( 1.0, 1.0, 1.0 );	// Adjusts the RGB values seperately, Red, Green and Blue.
float3	EColorFilterInterior = float3 ( 1.0, 1.0, 1.0 );	// Adjusts the RGB values seperately, Red, Green and Blue.

float3	EColorFilterSubDay 		= float3 ( 0.0, 0.0, 0.0 );	// Subtract the RGB values seperately, Red, Green and Blue.
float3	EColorFilterSubNight 	= float3 ( 0.0, 0.0, 0.0 );	// Subtract the RGB values seperately, Red, Green and Blue.
float3	EColorFilterSubInterior = float3 ( 0.0, 0.0, 0.0 );	// Subtract the RGB values seperately, Red, Green and Blue

// DAY
	float	MAGENTADay			= 1.0;		// Adds specified amount of magenta color
	float	MAGENTAsubDay		= 0.0;		// Subtracts specified amount of magenta color
	float	CYANDay				= 1.0;		// Adds specified amount of cyan color
	float	CYANsubDay			= 0.0;		// Subtracts specified amount of cyan color
	float	YELLOWDay			= 1.0;		// Adds specified amount of yellow color
	float	YELLOWsubDay		= 0.0;		// Subtracts specified amount of yellow color
// NIGHT
	float	MAGENTANight		= 1.0;		// Adds specified amount of magenta color
	float	MAGENTAsubNight		= 0.0;		// Subtracts specified amount of magenta color
	float	CYANNight			= 1.0;		// Adds specified amount of cyan color
	float	CYANsubNight		= 0.0;		// Subtracts specified amount of cyan color
	float	YELLOWNight			= 1.0;		// Adds specified amount of yellow color
	float	YELLOWsubNight		= 0.0;		// Subtracts specified amount of yellow color
// INTERIOR
	float	MAGENTAInterior		= 1.0;		// Adds specified amount of magenta color
	float	MAGENTAsubInterior	= 0.0;		// Subtracts specified amount of magenta color
	float	CYANInterior		= 1.0;		// Adds specified amount of cyan color
	float	CYANsubInterior		= 0.0;		// Subtracts specified amount of cyan color
	float	YELLOWInterior		= 1.0;		// Adds specified amount of yellow color
	float	YELLOWsubInterior	= 0.0;		// Subtracts specified amount of yellow color
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif
/////////////////////
///HSV CONTROLS//////
/////////////////////
#if(HSV_CONTROLS == 1)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HSV Color Correction settings.

// HSV Daytime Settings
float fColorSaturationMultDay 		= 1.0;			// Controls the color saturation multiplier. Range: 0.0 (greyscale) to 2.0 (hypercolor).
float fColorSaturationModDay 		= 0.0;			// Controls the color saturation. Range: -1 to 1. Default: 0.0
float fColorSaturationCurveDay 		= 0.0;			// Controls the color saturation curve. Default: 1.0. 
float fColorSaturationSmoothDay 	= 0.0;			// Controls the color saturation contrast. Default: 0.0.

float fColorIntensityMultDay 		= 1.0;			// Controls the color intensity multiplier. Default: 1.0
float fColorIntensityModDay		 	= 0.0;			// Controls the color brightness. Range: -1 to 1. Default: 0.0
float fColorIntensityCurveDay 		= 1.0;			// Controls the color intensity curve. Default: 1.0 
float fColorIntensitySmoothDay 		= 0.0;			// Controls the color intensity contrast. Default: 0.0.

float fColorHueMultDay 				= 1.0;			// Controls the color hue multiplier. Default: 1.0
float fColorHueModDay 				= 0.0;			// Controls the color hue. Range: -1 to 1. Default: 0.0
float fColorHueCurveDay 			= 1.0;			// Controls the color hue curve. Default: 1.0. 
float fColorHueSmoothDay 			= 0.0;			// Controls the color hue contrast. Default: 0.0.

// HSV Nighttime Settings
float fColorSaturationMultNight 	= 1.0;			// Controls the color saturation multiplier. Range: 0.0 (greyscale) to 2.0 (hypercolor).
float fColorSaturationModNight 		= 0.0;			// Controls the color saturation. Range: -1 to 1. Default: 0.0
float fColorSaturationCurveNight 	= 1.0;			// Controls the color saturation curve. Default: 1.0. 
float fColorSaturationSmoothNight 	= 0.0;			// Controls the color saturation contrast. Default: 0.0.

float fColorIntensityMultNight 		= 1.0;			// Controls the color intensity multiplier. Default: 1.0
float fColorIntensityModNight 		= 0.0;			// Controls the color brightness. Range: -1 to 1. Default: 0.0
float fColorIntensityCurveNight 	= 1.0;			// Controls the color intensity curve. Default: 1.0 
float fColorIntensitySmoothNight 	= 0.0;			// Controls the color intensity contrast. Default: 0.0.

float fColorHueMultNight 			= 1.0;			// Controls the color hue multiplier. Default: 1.0
float fColorHueModNight 			= 0.0;			// Controls the color hue. Range: -1 to 1. Default: 0.0
float fColorHueCurveNight 			= 1.0;			// Controls the color hue curve. Default: 1.0. 
float fColorHueSmoothNight 			= 0.0;			// Controls the color hue contrast. Default: 0.0.

// HSV Interior Settings
float fColorSaturationMultInterior 	= 1.0;			// Controls the color saturation multiplier. Range: 0.0 (greyscale) to 2.0 (hypercolor).
float fColorSaturationModInterior 	= 0.0;			// Controls the color saturation. Range: -1 to 1. Default: 0.0
float fColorSaturationCurveInterior = 1.0;			// Controls the color saturation curve. Default: 1.0. 
float fColorSaturationSmoothInterior= 0.0;			// Controls the color saturation contrast. Default: 0.0.

float fColorIntensityMultInterior 	= 1.0;			// Controls the color intensity multiplier. Default: 1.0
float fColorIntensityModInterior 	= 0.0;			// Controls the color brightness. Range: -1 to 1. Default: 0.0
float fColorIntensityCurveInterior 	= 1.0;			// Controls the color intensity curve. Default: 1.0 
float fColorIntensitySmoothInterior = 0.0;			// Controls the color intensity contrast. Default: 0.0.

float fColorHueMultInterior 		= 1.0;			// Controls the color hue multiplier. Default: 1.0
float fColorHueModInterior 			= 0.0;			// Controls the color hue. Range: -1 to 1. Default: 0.0
float fColorHueCurveInterior 		= 1.0;			// Controls the color hue curve. Default: 1.0. 
float fColorHueSmoothInterior 		= 0.0;			// Controls the color hue contrast. Default: 0.0.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif
/////////////////////
///HSV EQUALIZER/////
/////////////////////
#if(HSV_EQUALIZER == 1)
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// HSV Equalizer settings. Must have #define HSV_CONTROLS enabled.
// Adjust multiplier and modifier of specific color saturations. Default: 0.0

//Multipliers////////////////////////////////////////////////
float fColorSaturationMultRedDay 		= 0.0;
float fColorSaturationMultRedNight 		= 0.0;
float fColorSaturationMultRedInt 		= 0.0;

float fColorSaturationMultOrangeDay 	= 0.0;
float fColorSaturationMultOrangeNight 	= 0.0;
float fColorSaturationMultOrangeInt 	= 0.0;

float fColorSaturationMultYellowDay 	= 0.0;
float fColorSaturationMultYellowNight 	= 0.0;
float fColorSaturationMultYellowInt 	= 0.0;

float fColorSaturationMultGreenDay 		= 0.0;
float fColorSaturationMultGreenNight 	= 0.0;
float fColorSaturationMultGreenInt 		= 0.0;

float fColorSaturationMultCyanDay 		= 0.0;
float fColorSaturationMultCyanNight 	= 0.0;
float fColorSaturationMultCyanInt 		= 0.0;

float fColorSaturationMultBlueDay 		= 0.0;
float fColorSaturationMultBlueNight 	= 0.0;
float fColorSaturationMultBlueInt 		= 0.0;

float fColorSaturationMultMagentaDay 	= 0.0;
float fColorSaturationMultMagentaNight 	= 0.0;
float fColorSaturationMultMagentaInt 	= 0.0;

//Modifiers//////////////////////////////////////////////////
float fColorSaturationModRedDay 		= 0.0;
float fColorSaturationModRedNight 		= 0.0;
float fColorSaturationModRedInt 		= 0.0;

float fColorSaturationModOrangeDay 		= 0.0;
float fColorSaturationModOrangeNight 	= 0.0;
float fColorSaturationModOrangeInt 		= 0.0;

float fColorSaturationModYellowDay 		= 0.0;
float fColorSaturationModYellowNight 	= 0.0;
float fColorSaturationModYellowInt 		= 0.0;

float fColorSaturationModGreenDay 		= 0.0;
float fColorSaturationModGreenNight 	= 0.0;
float fColorSaturationModGreenInt 		= 0.0;

float fColorSaturationModCyanDay 		= 0.0;
float fColorSaturationModCyanNight 		= 0.0;
float fColorSaturationModCyanInt 		= 0.0;

float fColorSaturationModBlueDay 		= 0.0;
float fColorSaturationModBlueNight 		= 0.0;
float fColorSaturationModBlueInt 		= 0.0;

float fColorSaturationModMagentaDay 	= 0.0;
float fColorSaturationModMagentaNight 	= 0.0;
float fColorSaturationModMagentaInt 	= 0.0;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif
/////////////////////
///COLOR TWEAKS//////
/////////////////////
//--------------------------------------------------------------------------------------------------------------------------
	//					 Red, Green, Blue
	float3 rgbd = float3( 1.0, 1.0, 1.0 ); 	// RGB balance Day
	float3 rgbn = float3( 1.0, 1.0, 1.0 ); 	// RGB balance Night
	float3 rgbi = float3( 1.0, 1.0, 1.0 ); 	// RGB balance Interior

	// Change size of keypress dot here, can be 0 to hide it
	float dotsize = 0.01;

	//Use the temporary variables 1-3 in the ENB tweaking overlay to control these settings in game
	//					     	   Day, Night, Int
	float3 uctbrt1[2] 	= { float3( 1.0, 1.0, 1.0 ),	// Brightness maximum range
							float3( -1.0, -1.0, -1.0 ) };//Brightness minimum range
							
	float3 uctbrt2[2]	= { float3( 1.0, 1.0, 1.0 ),	// Brightness maximum range (Alters after contrast adjustment)
							float3( -1.0, -1.0, -1.0 ) };//Brightness minimum range (Alters after contrast adjustment)
							
	float3 uctcon[2]	= { float3( 1.0, 1.0, 1.0 ), 	// Contrast maximum range
							float3( -1.0, -1.0, -1.0 ) };//Contrast minimum range

	float3 uctsat[2]	= { float3( 1.0, 1.0, 1.0 ), 	// Saturation maximum range
							float3( -1.0, -1.0, -1.0 ) };//Saturation minimum range
	
	// Third set of brightness controls used for darkening nights.
	//								Day Night Int					  
	float3 darkenby1[2] = { float3( 0.0, 0.0, 0.0 ), 	//Brightness maximum range
							float3( 0.0, 0.0, 0.0 ) };	//Brightness minimum range

//--------------------------------------------------------------------------------------------------------------------------
/////////////////////
///COLORSAT DAYNIGHT/
/////////////////////
#if(COLORSAT_DAYNIGHT == 1)
//--------------------------------------------------------------------------------------------------------------------------
// HD6_COLORSAT_DAYNIGHT - Alter saturation seperately from Day, Night and Interior
//NOTE; IF YOU SET BOTH RED, GREEN AND BLUE AT THE SAME VALUE IT WILL ACT AS AN BRIGHTNESS COMMAND. SAME GOES FOR MAGENTA, CYAN AND YELLOW.

//						   Red, Green, Blue
	float3 ansatd = float3( 1.0, 1.0, 1.0 );	// Increase Red, Green and Blue colors seperately during Days
	float3 ansatn = float3( 1.0, 1.0, 1.0 );	// Increase Red, Green and Blue colors seperately during Nights
	float3 ansati = float3( 1.0, 1.0, 1.0 );	// Increase Red, Green and Blue colors seperately in Interiors
	float3 snsatd = float3( 0.0, 0.0, 0.0 );	// Subtracts Red, Green and Blue colors seperately during Days
	float3 snsatn = float3( 0.0, 0.0, 0.0 );	// Subtracts Red, Green and Blue colors seperately during Nights
	float3 snsati = float3( 0.0, 0.0, 0.0 );	// Subtracts Red, Green and Blue colors seperately in Interiors

// DAY
	float	hd6MAGENTADay			= 1.0;		// Adds specified amount of magenta color
	float	hd6MAGENTAsubDay		= 0.0;		// Subtracts specified amount of magenta color
	float	hd6CYANDay				= 1.0;		// Adds specified amount of cyan color
	float	hd6CYANsubDay			= 0.0;		// Subtracts specified amount of cyan color
	float	hd6YELLOWDay			= 1.0;		// Adds specified amount of yellow color
	float	hd6YELLOWsubDay			= 0.0;		// Subtracts specified amount of yellow color
// NIGHT
	float	hd6MAGENTANight			= 1.0;		// Adds specified amount of magenta color
	float	hd6MAGENTAsubNight		= 0.0;		// Subtracts specified amount of magenta color
	float	hd6CYANNight			= 1.0;		// Adds specified amount of cyan color
	float	hd6CYANsubNight			= 0.0;		// Subtracts specified amount of cyan color
	float	hd6YELLOWNight			= 1.0;		// Adds specified amount of yellow color
	float	hd6YELLOWsubNight		= 0.0;		// Subtracts specified amount of yellow color
// INTERIOR
	float	hd6MAGENTAInterior		= 1.0;		// Adds specified amount of magenta color
	float	hd6MAGENTAsubInterior	= 0.0;		// Subtracts specified amount of magenta color
	float	hd6CYANInterior			= 1.0;		// Adds specified amount of cyan color
	float	hd6CYANsubInterior		= 0.0;		// Subtracts specified amount of cyan color
	float	hd6YELLOWInterior		= 1.0;		// Adds specified amount of yellow color
	float	hd6YELLOWsubInterior	= 0.0;		// Subtracts specified amount of yellow color
//--------------------------------------------------------------------------------------------------------------------------
#endif
///////////////////////
///COLOR POLARIZATION//
///////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Color Polarization Settings.
/////////////////////////////////Red Green Blue
float3 	GuideHueDay		= float3(1.0, 0.2, 0.0);	//Colors close this this color will be shifted towards it, colors opposite will be saturated
float 	AmountDay		= 1.0;						//Controls strength of the effect, higher is stronger
float 	ConcentrateDay	= 4.0;						//Controls how much colors will "bunch up" towards the guide color, higher is stronger
float 	DesatCorrDay	= 0.2;						//Controls how much it will affect dull colors, higher will affect them less
/////////////////////////////////Red Green Blue
float3 	GuideHueNight	= float3(1.0, 0.2, 0.0);
float 	AmountNight		= 1.0;
float 	ConcentrateNight= 4.0;
float 	DesatCorrNight	= 0.2;
/////////////////////////////////Red Green Blue
float3 	GuideHueInt		= float3(1.0, 0.2, 0.0);
float 	AmountInt		= 1.0;
float 	ConcentrateInt	= 4.0;
float 	DesatCorrInt	= 0.2;
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////////////////////
///COLOR GRADING/////
/////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Color Grading settings.
float3 RedVectorDay		= float3(1.0, 0.2, 0.0);	//Red colors will be shifted towards this color instead
float3 GreenVectorDay	= float3(0.2, 1.0, 0.0);	//Blue colors will be shifted towards this color instead
float3 BlueVectorDay	= float3(0.0, 0.2, 1.0);	//Green colors will be shifted towards this color instead

float3 RedVectorNight	= float3(1.0, 0.2, 0.0);
float3 GreenVectorNight	= float3(0.2, 1.0, 0.0);
float3 BlueVectorNight	= float3(0.0, 0.2, 1.0);

float3 RedVectorInt		= float3(1.0, 0.2, 0.0);
float3 GreenVectorInt	= float3(0.0, 1.0, 0.2);
float3 BlueVectorInt	= float3(0.0, 0.2, 1.0);
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////////////////////
///BLEACH BYPASS/////
/////////////////////
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//Bleach Bypass Day Settings/////////////////Red Green Blue
float3 BleachBypassAmountRGBDay 	= float3(0.4, 0.4, 0.4);	//Controls strength of the effect separately for RGB, higher is stronger
//Bleach Bypass Night Settings///////////////Red Green Blue
float3 BleachBypassAmountRGBNight 	= float3(0.4, 0.4, 0.4);
//Bleach Bypass Interior Settings////////////Red Green Blue
float3 BleachBypassAmountRGBInt 	= float3(0.4, 0.4, 0.4);
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////////////////////
///SEPIA TONE////////
/////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Sepia Tone settings Day.
float3 fSepiaColorDay 			= float3( 1.0, 0.85 , 0.7 );// Controls color of sepia tone.
float fSepiaDesaturationDay 	= 0.5;						// Controls amount of sepia color applied to image.
float fSepiaExposureDay 		= 1.2;						// Controls exposure of sepia tone.

// Sepia Tone settings Night.
float3 fSepiaColorNight 		= float3( 1.0, 0.85 , 0.7 );// Controls color of sepia tone.
float fSepiaDesaturationNight 	= 0.5;						// Controls amount of sepia color applied to image.
float fSepiaExposureNight 		= 1.2;						// Controls exposure of sepia tone.

// Sepia Tone settings Interior.
float3 fSepiaColorInterior 		= float3( 1.0, 0.85 , 0.7 );// Controls color of sepia tone.
float fSepiaDesaturationInterior= 0.5;						// Controls amount of sepia color applied to image.
float fSepiaExposureInterior 	= 1.2;						// Controls exposure of sepia tone.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
//////////////////////
///ADAPTATION/////////
//////////////////////
//-----------------------------------------------------------------------------------------------------------
// Vanilla Adaptation Day settings.

float fVanillaAdaptationAmbientDay 		= 1.0; // Controls how much ambient luminosity there is from vanilla adaptation code.
float fVanillaAdaptationChangeDay 		= 0.5; // Controls how much the brightness changes when looking up and down. Affects ambient too.

// Vanilla Adaptation Night settings.
float fVanillaAdaptationAmbientNight 	= 1.0;
float fVanillaAdaptationChangeNight		= 0.5;

// Vanilla Adaptation Interior settings.
float fVanillaAdaptationAmbientInterior = 1.0;
float fVanillaAdaptationChangeInterior 	= 0.5;
//-----------------------------------------------------------------------------------------------------------
/////////////////////
///PALETTE MIXER/////
/////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Palette mixer settings - Must have "UsePaletteTexture" enabled in the enbseries.ini file for these settings have an effect.
float	palmixDay		=0.60;		// Controls the intensity of the enbpalette.bmp
float	palmixNight		=0.60;		// Controls the intensity of the enbpalette.bmp
float	palmixInterior		=1.1;		// Controls the intensity of the enbpalette.bmp
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////////////////////////
////LENSDIRT PALETTE/////
/////////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Lensdirt settings - Must have "UsePaletteTexture" enabled in the enbseries.ini file for these settings have an effect.
// Never use colorcorrection enbpalette and lens enbpalette at the same time!!
float 	LensDirtThreshold 		= 0.8;
float 	LensDirtPower 		= 5.0;
/////////////////////
///HD6 VIGNETTE//////
/////////////////////
//--------------------------------------------------------------------------------------------------------------------------	
// HD6_VIGNETTE - Darkens and blurs edges of the screen which increases focus on center
	float rovigpwr = 0.4;					// For Round vignette
	float2 sqvigpwr = float2( 0.0, 0.1 );	// For square vignette: (top, bottom)
	float vsatstrength = 0.85;				// How saturated vignette is
	float vignettepow = 1.5;				// For Round vignette, higher pushes it to the corners and increases contrast/sharpness			
	float vstrengthatnight = 0.2;			// How strong vignette is at night
	float vstrengthinterior= 0.4;
//--------------------------------------------------------------------------------------------------------------------------
/////////////////////
///MT_VIGNETTE///////
/////////////////////
#if(MT_VIGNETTE == 1)
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Vignette settings Day.
float fVignetteRadiusDay 		= 0.65;					// Controls how large the radius of the vignette is. Larger numbers make the ring larger.
float fVignetteSharpnessDay 	= 0.025;				// Controls how sharp the edge of the vignette is. Larger numbers make edge of the ring sharper.
float fVignetteCurveDay 		= 2.0;					// Controls the blending of the vignette. 
float2 fVignetteCenterDay 		= float2( 0.5, 0.5 );	// Controls the position of the vignette center on the screen.
float2 fVignetteScaleDay 		= float2( 1.0, 1.0 );	// Controls the horizontal and vertical scaling of vignette.

// Vignette settings Night.
float fVignetteRadiusNight 		= 0.65;					// Controls how large the radius of the vignette is. Larger numbers make the ring larger.
float fVignetteSharpnessNight 	= 0.025;				// Controls how sharp the edge of the vignette is. Larger numbers make edge of the ring sharper.
float fVignetteCurveNight 		= 2.0;					// Controls the blending of the vignette. 
float2 fVignetteCenterNight 	= float2( 0.5, 0.5 );	// Controls the position of the vignette center on the screen.
float2 fVignetteScaleNight 		= float2( 1.0, 1.0 );	// Controls the horizontal and vertical scaling of vignette.

// Vignette settings Interior.
float fVignetteRadiusInterior 	= 0.65;					// Controls how large the radius of the vignette is. Larger numbers make the ring larger.
float fVignetteSharpnessInterior= 0.025;				// Controls how sharp the edge of the vignette is. Larger numbers make edge of the ring sharper.
float fVignetteCurveInterior 	= 2.0;					// Controls the blending of the vignette. 
float2 fVignetteCenterInterior 	= float2( 0.5, 0.5 );	// Controls the position of the vignette center on the screen.
float2 fVignetteScaleInterior 	= float2( 1.0, 1.0 );	// Controls the horizontal and vertical scaling of vignette.
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#endif
/////////////////////
///FILM GRAIN////////
/////////////////////
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Grain settings Day.
float fGrainIntensityDay 		= 0.10;		// Controls the intensity of the grain effect.
float fGrainSaturationDay 		= 0.25;		// Controls the color saturation of the grain effect.
float fGrainMotionDay 			= 0.10;		// Controls how rapidly the grain effect changes over time.

// Grain settings Night.
float fGrainIntensityNight 		= 0.1;		// Controls the intensity of the grain effect.
float fGrainSaturationNight 		= 0.25;		// Controls the color saturation of the grain effect.
float fGrainMotionNight 		= 0.05;		// Controls how rapidly the grain effect changes over time.

// Grain settings Interior.
float fGrainIntensityInterior 		= 0.1;		// Controls the intensity of the grain effect.
float fGrainSaturationInterior 		= 0.25;		// Controls the color saturation of the grain effect.
float fGrainMotionInterior 		= 0.05;		// Controls how rapidly the grain effect changes over time.

////////////////////////
///IMAGE SHARPEN////////
////////////////////////
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
float fSharpScaleDay 			= 0.1100;
float fSharpScaleNight 			= 0.1200;
float fSharpScaleInterior		= 0.1100;
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/////////////////////
///LETTERBOX/////////
/////////////////////
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
// Letterbox settings.
float fLetterboxBarHeightDay 		= 0.04;		// Controls the height of cinematic bars. 
float fLetterboxBarHeightNight 		= 0.04;		// Controls the height of cinematic bars. 
float fLetterboxBarHeightInterior 	= 0.04;		// Controls the height of cinematic bars. 
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

/////////////////////////////////////////////////////////////////////////////////////////////////
///POSTPROCESSING METHODS////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////
///POSTPROCESSING 0//
/////////////////////
#if POSTPROCESS == 0
//POSTPROCESS v0 by JawZ The vanilla Post-Process method - The perfect method for ENB Beginners.

// JZ - This enables the EToneMappingCurveV0 setting to be usable. Enable it by changing the 0 to a 1.
#define ENABLE_TONEMAPPING 1

//DAY
	float	EBrightnessV0Day = 1.0;			// JZ - Use this to alter the general brightness of the whole screen.
	float	EContrastV0Day = 1.0;			// JZ - Higher amounts make the dark areas darker while making the bright spot brighter.
	float	EColorSaturationV0Day = 1.2;	// JZ - Adds more color to the screen.
	float	EToneMappingCurveV0Day = 1.0;	// JZ - Increasing this darkens the image, Explanation of Tonemapping - http://en.wikipedia.org/wiki/Tone_mapping

//NIGHT
	float	EBrightnessV0Night = 1.0;
	float	EContrastV0Night = 1.0;
	float	EColorSaturationV0Night = 1.2;
	float	EToneMappingCurveV0Night = 1.0;

//Interior
	float	EBrightnessV0Interior = 1.0;
	float	EContrastV0Interior = 1.0;
	float	EColorSaturationV0Interior = 1.0;
	float	EToneMappingCurveV0Interior = 1.0;
#endif
/////////////////////
///POSTPROCESSING 1//
/////////////////////
//POSTPROCESS v1 by ENB
#if POSTPROCESS == 1
//DAY
	float	EAdaptationMinV1Day = 0.01;
	float	EAdaptationMaxV1Day = 0.07;

	float	EContrastV1Day = 0.95;
	float	EColorSaturationV1Day = 1.2;
	float	EToneMappingCurveV1Day = 6.0;

//NIGHT
	float	EAdaptationMinV1Night = 0.01;
	float	EAdaptationMaxV1Night = 0.15;

	float	EContrastV1Night = 0.95;
	float	EColorSaturationV1Night = 1.0;
	float	EToneMappingCurveV1Night = 6.0;

//Interior
	float	EAdaptationMinV1Interior = 0.01;
	float	EAdaptationMaxV1Interior = 0.15;

	float	EContrastV1Interior = 0.95;
	float	EColorSaturationV1Interior = 1.0;
	float	EToneMappingCurveV1Interior = 6.0;
#endif
/////////////////////
///POSTPROCESSING 2//
/////////////////////
#if POSTPROCESS == 2
//POSTPROCESS v2 by ENB, modified by JawZ
//DAY
	float	EAdaptationMinV2Day = 1.0;		 		// JZ - Determines the lowest amount the Adaptation will adjust the brightness.
	float	EAdaptationMaxV2Day = 1.0;				// JZ - Determines the highest amount the Adaptation will adjust the brightness.

	float	EBrightnessV2Day = 1.0;			 		// JZ - Use this to alter the general brightness of the whole screen.
	float	EBrightnessCurveV2Day = 1.0;	 		// JZ - A sort of contrast that only darkens the image and increases the saturation.
	float	EBrightnessPostCurveV2Day = 1.0; 		// JZ - Brightness addition applied after the EBrightnessCurve setting. If EBrightnessCurve is set to 1.0 it will act the same as EBrightness.

	float	EIntensityContrastV2Day = 1.0;	 		// JZ - Higher amounts make the dark areas darker while making the bright spot brighter.
	float	EColorSaturationV2Day = 1.0;	 		// JZ - Adds more color to the screen.
	float	EToneMappingCurveV2Day = 1.0;	 		// JZ - Increasing this darkens the image, Explanation of Tonemapping - http://en.wikipedia.org/wiki/Tone_mapping
	float	EToneMappingOversaturationV2Day = 1.0;	// JZ - Same thing as EToneMappingCurve but more subtle and desaturates the screen.
//NIGHT
	float	EAdaptationMinV2Night = 1.0;
	float	EAdaptationMaxV2Night = 1.0;

	float	EBrightnessV2Night = 1.0;
	float	EBrightnessCurveV2Night = 1.0;
	float	EBrightnessPostCurveV2Night = 1.0;

	float	EIntensityContrastV2Night = 1.0;
	float	EColorSaturationV2Night = 1.0;
	float	EToneMappingCurveV2Night = 1.0;
	float	EToneMappingOversaturationV2Night = 1.0;
//Interior
	float	EAdaptationMinV2Interior = 1.0;
	float	EAdaptationMaxV2Interior = 1.0;

	float	EBrightnessV2Interior = 1.0;
	float	EBrightnessCurveV2Interior = 1.0;
	float	EBrightnessPostCurveV2Interior = 1.0;

	float	EIntensityContrastV2Interior = 1.0;
	float	EColorSaturationV2Interior = 1.0;
	float	EToneMappingCurveV2Interior = 1.0;
	float	EToneMappingOversaturationV2Interior = 1.0;
#endif
/////////////////////
///POSTPROCESSING 3//
/////////////////////
//POSTPROCESS v3 by ENB
#if POSTPROCESS == 3
//DAY
	float	EAdaptationMinV3Day = 0.05;
	float	EAdaptationMaxV3Day = 0.125;

	float	EToneMappingCurveV3Day = 8.0;
	float	EToneMappingOversaturationV3Day = 60.0;

//NIGHT
	float	EAdaptationMinV3Night = 0.05;
	float	EAdaptationMaxV3Night = 0.125;

	float	EToneMappingCurveV3Night = 4.0;
	float	EToneMappingOversaturationV3Night = 60.0;

//Interior
	float	EAdaptationMinV3Interior = 0.05;
	float	EAdaptationMaxV3Interior = 0.125;

	float	EToneMappingCurveV3Interior = 4.0;
	float	EToneMappingOversaturationV3Interior = 60.0;
#endif
/////////////////////
///POSTPROCESSING 4//
/////////////////////
//POSTPROCESS v4 by ENB
#if POSTPROCESS == 4
//DAY
	float	EAdaptationMinV4Day = 0.2;
	float	EAdaptationMaxV4Day = 0.125;

	float	EBrightnessCurveV4Day = 0.7;
	float	EBrightnessMultiplierV4Day = 0.45;
	float	EBrightnessToneMappingCurveV4Day = 0.5;

//NIGHT
	float	EAdaptationMinV4Night = 0.2;
	float	EAdaptationMaxV4Night = 0.125;

	float	EBrightnessCurveV4Night = 0.7;
	float	EBrightnessMultiplierV4Night = 0.45;
	float	EBrightnessToneMappingCurveV4Night = 0.5;

//Interior
	float	EAdaptationMinV4Interior = 0.2;
	float	EAdaptationMaxV4Interior = 0.125;

	float	EBrightnessCurveV4Interior = 0.7;
	float	EBrightnessMultiplierV4Interior = 0.45;
	float	EBrightnessToneMappingCurveV4Interior = 0.5;
#endif
/////////////////////
///POSTPROCESSING 5//
/////////////////////
//POSTPROCESS v5 by HD6 based on Post-process v2
#if POSTPROCESS == 5

// HD6 static adaptation,	Day, Night, Interior
   float3 JKNightDayFactortweak = float3( 3.1 , 1.5, 3.1 );
   
//DAY
	float	EAdaptationMinV5Day = 0.12;
	float	EAdaptationMaxV5Day = 0.29;
	
	float	EToneMappingCurveV5Day = 1.0;
	float	EIntensityContrastV5Day = 1.0;
	float	EColorSaturationV5Day = 1.0;
	float	HCompensateSatV5Day = 1.0;

//NIGHT
	float	EAdaptationMinV5Night = 0.12;
	float	EAdaptationMaxV5Night = 0.29;
	
	float	EToneMappingCurveV5Night = 1.0;
	float	EIntensityContrastV5Night = 1.0;
	float	EColorSaturationV5Night = 1.0;
	float	HCompensateSatV5Night = 1.0;

//Interior
	float	EAdaptationMinV5Interior = 0.12;
	float	EAdaptationMaxV5Interior = 0.29;

	float	EToneMappingCurveV5Interior = 1.0;
	float	EIntensityContrastV5Interior = 1.0;
	float	EColorSaturationV5Interior = 1.0;
	float	HCompensateSatV5Interior = 1.0;
#endif
/////////////////////
///POSTPROCESSING 6//
/////////////////////
//Postprocessing V6 by Kermles
#if POSTPROCESS == 6
#define PRE_COLORATION				0	//Color controls happen before adaptation
#define POST_COLORATION				0	//Color controls happen after adaptation
#define SHADOW_USE_ADDITION			0	//May cause slight brightening of image, but also retains more detail in shadows
#define BRIGHTSPOT_IGNORE_WHITES	0	//Brightspot controls won't affect pure white areas.
//DAY	
	float	EBrightnessV6Day 					= 1.0;						//Higher values brighten the image.
	float 	EIntensityContrastV6Day 			= 1.0;						//Higher values accentuate differences between light and dark areas.
	float	EColorSaturationV6Day 				= 1.0; 						//Higher values make the image more colorful.
	
	float	EToneMappingOversaturationV6Day 	= 1.0;						//Lower values brighten the image and help increase dynamic range.
	float	EToneMappingCurveV6Day 				= 1.0;						//JZ - Increasing this darkens the image, Explanation of Tonemapping - http://en.wikipedia.org/wiki/Tone_mapping
	
	float	EAdaptationMinV6Day 				= 0.64;						//Higher values increase the minimum darkening from adaptation.
	float	EAdaptationMaxV6Day 				= 0.32;						//Higher values increase the strength of adaptation darkening.
	
	float	EFinalContrastV6Day 				= 0.0;						//Higher values accentuate differences between light and dark areas.
	float	EFinalExposureV6Day 				= 0.0;						//Higher values brighten the image.
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorDay 						= float3( 0.0, 0.125, 1.0 );//Determines the general coloration of the scene.
	float   EMoodAmountDay 						= 0.0;						//Higher values increase effect strength.
	float   EMoodThresholdDay 					= 1.0;						//Lower values increase the spread of the effect.
	float   EMoodCurveDay 						= 3.0;						//Lower values increase the spread of the effect.
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorDay 					= float3( 0.0, 0.125, 1.0 );//Determines the color of shadows.
	float   EShadowAmountDay 					= 1.0;						//Higher values increase effect strength. Max 2.55
	float   EShadowThresholdDay 				= 0.5;						//Lower values increase the spread of the effect.
	float   EShadowCurveDay 					= 16.0;						//Lower values increase the spread of the effect.
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorDay 				= float3( 1.0, 0.125, 0.0 );//Determines the color of bright areas. 
	float   EBrightSpotAmountDay 				= 0.0;						//Higher values increase effect strength.
	float   EBrightSpotThresholdDay 			= 0.5;						//Lower values increase the spread of the effect.
	float   EBrightSpotCurveDay 				= 16.0;						//Lower values increase the spread of the effect.
////////////////////////////////////////////////////////////////////////
//NIGHT	
	float	EBrightnessV6Night					= 1.0;
	float 	EIntensityContrastV6Night			= 1.0;
	float	EColorSaturationV6Night 			= 1.0;  
	
	float	EToneMappingOversaturationV6Night 	= 1.0;
	float	EToneMappingCurveV6Night 			= 1.0;
	
	float	EAdaptationMinV6Night 				= 0.64;
	float	EAdaptationMaxV6Night 				= 0.32;
	
	float	EFinalContrastV6Night 				= 0.0;
	float	EFinalExposureV6Night 				= 0.0;	
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorNight 					= float3( 0.0, 0.125, 1.0 );
	float   EMoodAmountNight 					= 0.0;
	float   EMoodThresholdNight 				= 1.0;						
	float   EMoodCurveNight 					= 3.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorNight 					= float3( 0.0, 0.125, 1.0 );
	float   EShadowAmountNight 					= 1.0;
	float   EShadowThresholdNight 				= 0.5;
	float   EShadowCurveNight 					= 16.0;
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorNight 				= float3( 1.0, 0.125, 0.0 );
	float   EBrightSpotAmountNight 				= 0.0;
	float   EBrightSpotThresholdNight 			= 0.5;
	float   EBrightSpotCurveNight 				= 16.0;;
///////////////////////////////////////////////////////////////////////////
//Interior	
	float	EBrightnessV6Interior				= 1.0;
	float 	EIntensityContrastV6Interior		= 1.0;
	float	EColorSaturationV6Interior		 	= 1.0;

	float	EToneMappingOversaturationV6Interior= 1.0;
	float	EToneMappingCurveV6Interior 		= 1.0;
	
	float	EAdaptationMinV6Interior 			= 0.64;
	float	EAdaptationMaxV6Interior 			= 0.32;
	
	float	EFinalContrastV6Interior 			= 0.0;
	float	EFinalExposureV6Interior 			= 0.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorInt 						= float3( 0.0, 0.125, 1.0 );
	float   EMoodAmountInt 						= 0.0;
	float   EMoodThresholdInt 					= 1.0;						
	float   EMoodCurveInt 						= 3.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorInt 					= float3( 0.0, 0.125, 1.0 );
	float   EShadowAmountInt 					= 0.0;
	float   EShadowThresholdInt 				= 0.5;
	float   EShadowCurveInt 					= 16.0;
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorInt 				= float3( 1.0, 0.125, 0.0 );
	float   EBrightSpotAmountInt 				= 0.0;
	float   EBrightSpotThresholdInt 			= 0.5;
	float   EBrightSpotCurveInt 				= 16.0;
///////////////////////////////////////////////////////////////////////////
#endif	
/////////////////////
///POSTPROCESSING 7//
/////////////////////
//Postprocessing V7 by Kermles
#if POSTPROCESS == 7
#define PRE_COLORATION				 0	//Color controls happen before adaptation
#define POST_COLORATION			 	 0	//Color controls happen after adaptation
#define SHADOW_USE_ADDITION		 	 0	//May cause slight brightening of image, but also retains more detail in shadows
#define BRIGHTSPOT_IGNORE_WHITES	 0	//Brightspot controls won't affect pure white areas.
#define COLOR_ADAPTATION			 1	//Desaturates image based on adaptation strength
//DAY
//Color
	float   EHSVDesatCurveDay 					= 1.0;						//Higher values desaturate the image according to original saturation.			
	float	EBrightnessV7Day 					= 1.0;						//Higher values brighten the image.
	float 	EIntensityContrastV7Day 			= 1.0;						//Higher values accentuate differences between light and dark areas.
	float	EColorSaturationV7Day 				= 1.0; 						//Higher values make the image more colorful.
//Tonemapping	
	float	EToneMappingOversaturationV7Day 	= 1.0;						//Lower values brighten the image and help increase dynamic range.
	float	EToneMappingCurveV7Day 				= 1.0;						//JZ - Increasing this darkens the image, Explanation of Tonemapping - http://en.wikipedia.org/wiki/Tone_mapping
//Adaptation
	float	EAdaptationMinV7Day 				= 0.64;						//Higher values increase the minimum darkening from adaptation.
	float	EAdaptationMaxV7Day 				= 0.32;						//Higher values increase the strength of adaptation darkening.
	float	EColorAdaptationStrengthV7Day  		= 1.0;						//Higher values increase the image desaturation based on adaptation.
//Final adjustments.
	float	EFinalContrastV7Day 				= 0.0;						//Higher values accentuate differences between light and dark areas.
	float	EFinalExposureV7Day 				= 0.0;						//Higher values brighten the image.					
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorDay 						= float3( 0.0, 0.125, 1.0 );//Determines the general coloration of the scene.
	float   EMoodAmountDay 						= 0.5;						//Higher values increase effect strength.
	float   EMoodThresholdDay 					= 1.0;						//Lower values increase the spread of the effect.
	float   EMoodCurveDay 						= 3.0;						//Lower values increase the spread of the effect.
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorDay 					= float3( 0.0, 0.125, 1.0 );//Determines the color of shadows. Max 2.55
	float   EShadowAmountDay 					= 0.0;						//Higher values increase effect strength.
	float   EShadowThresholdDay 				= 1.0;						//Lower values increase the spread of the effect.
	float   EShadowCurveDay 					= 16.0;						//Lower values increase the spread of the effect.
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorDay 				= float3( 1.0, 0.125, 0.0 );//Determines the color of bright areas. 
	float   EBrightSpotAmountDay 				= 0.0;						//Higher values increase effect strength.
	float   EBrightSpotThresholdDay 			= 0.5;						//Lower values increase the spread of the effect.
	float   EBrightSpotCurveDay 				= 16.0;						//Lower values increase the spread of the effect.
////////////////////////////////////////////////////////////////////////
//NIGHT
	float   EHSVDesatCurveNight 				= 1.0;
	
	float	EBrightnessV7Night					= 1.0;
	float 	EIntensityContrastV7Night			= 1.0;
	float	EColorSaturationV7Night 			= 1.0; 
	
	float	EToneMappingOversaturationV7Night 	= 1.0;
	float	EToneMappingCurveV7Night 			= 1.0;
	
	float	EAdaptationMinV7Night 				= 0.64;
	float	EAdaptationMaxV7Night 				= 0.32;
	float	EColorAdaptationStrengthV7Night  	= 1.0;
	
	float	EFinalContrastV7Night 				= 0.0;
	float	EFinalExposureV7Night 				= 0.0;	
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorNight 					= float3( 0.0, 0.125, 1.0 );
	float   EMoodAmountNight 					= 0.0;
	float   EMoodThresholdNight 				= 1.0;						
	float   EMoodCurveNight 					= 4.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorNight 					= float3( 0.0, 0.125, 1.0 );
	float   EShadowAmountNight 					= 0.0;
	float   EShadowThresholdNight 				= 0.5;
	float   EShadowCurveNight 					= 12.0;
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorNight 				= float3( 1.0, 0.125, 0.0 );
	float   EBrightSpotAmountNight 				= 0.5;
	float   EBrightSpotThresholdNight 			= 0.5;
	float   EBrightSpotCurveNight 				= 12.0;
///////////////////////////////////////////////////////////////////////////
//Interior
	float   EHSVDesatCurveInt 					= 1.0;
	
	float	EBrightnessV7Interior				= 1.0;
	float 	EIntensityContrastV7Interior		= 1.0;
	float	EColorSaturationV7Interior		 	= 1.0; 
	
	float	EToneMappingOversaturationV7Interior= 1.0;
	float	EToneMappingCurveV7Interior 		= 1.0;
	
	float	EAdaptationMinV7Interior 			= 0.64;
	float	EAdaptationMaxV7Interior 			= 0.32;
	float	EColorAdaptationStrengthV7Interior  = 1.0;	
	
	float	EFinalContrastV7Interior 			= 0.0;
	float	EFinalExposureV7Interior 			= 0.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EMoodColorInt 						= float3( 0.0, 0.125, 1.0 );
	float   EMoodAmountInt 						= 0.0;
	float   EMoodThresholdInt 					= 1.0;						
	float   EMoodCurveInt 						= 3.0;
/////////////////////////////////////////////////////////Red Green Blue
	float3 	EShadowColorInt 					= float3( 0.0, 0.125, 1.0 );
	float   EShadowAmountInt 					= 0.0;
	float   EShadowThresholdInt 				= 0.5;
	float   EShadowCurveInt 					= 16.0;
//////////////////////////////////////////////////////////Red Green Blue
	float3 	EBrightSpotColorInt 				= float3( 1.0, 0.125, 0.0 );
	float   EBrightSpotAmountInt 				= 0.0;
	float   EBrightSpotThresholdInt 			= 0.5;
	float   EBrightSpotCurveInt 				= 16.0;
///////////////////////////////////////////////////////////////////////////
#endif
/////////////////////
///POSTPROCESSING 8//
/////////////////////
#if POSTPROCESS == 8	//Improved Tonemapping by Brodiggan Gale modified by Kermles

#define PRE_COLORATION				0	//Color controls happen before adaptation
#define POST_COLORATION			 	0	//Color controls happen after adaptation
#define SHADOW_USE_ADDITION			0	//May cause slight brightening of image, but also retains more detail in shadows
#define BRIGHTSPOT_IGNORE_WHITES	0	//Brightspot controls won't affect pure white areas.
//Day
float  	EMinSaturationPowerDay 				= 0.7;						//Higher values raise the minimum color strength of the scene.
float  	EMaxSaturationPowerDay 				= 1.4;						//Higher values raise the maximum color strength of the scene.
float 	EBrightCurveDay 					= 1.0;						//Higher values brighten the image.
float 	EContrastCurveDay 					= 1.0; 						//Higher values accentuate differences between light and dark areas.
float  	EContrastThresholdDay 				= 0.9;						//Determines the brightness threshold used for contrast adjustments. Max 1.0

float	EToneMappingOversaturationV8Day 	= 1.0;						//Lower values brighten the image and help increase dynamic range.
float	EToneMappingCurveV8Day 				= 1.0;						//JZ - Increasing this darkens the image, Explanation of Tonemapping - http://en.wikipedia.org/wiki/Tone_mapping

float	EAdaptationMinV8Day 				= 0.64;						//Higher values increase the minimum darkening from adaptation.
float	EAdaptationMaxV8Day 				= 0.32;						//Higher values increase the strength of adaptation darkening.

float	EFinalContrastV8Day 				= 0.0;						//Higher values accentuate differences between light and dark areas.
float	EFinalExposureV8Day 				= 0.0;						//Higher values brighten the image.
/////////////////////////////////////////////////////////Red Green Blue
float3 	EMoodColorDay 						= float3( 1.0, 0.125, 0.0 );//Determines the general coloration of the scene.
float   EMoodAmountDay 						= 0.0;						//Higher values increase effect strength.
float   EMoodThresholdDay 					= 1.0;						//Lower values increase the spread of the effect.
float   EMoodCurveDay 						= 3.0;						//Lower values increase the spread of the effect.
//////////////////////////////////////////////////////////Red Green Blue
float3 	EShadowColorDay 					= float3( 0.0, 0.125, 1.0 );//Determines the color of shadows.
float   EShadowAmountDay 					= 0.0;						//Higher values increase effect strength.
float   EShadowThresholdDay 				= 0.5;						//Lower values increase the spread of the effect.
float   EShadowCurveDay 					= 16.0;						//Lower values increase the spread of the effect.
/////////////////////////////////////////////////////////Red Green Blue
float3 	EBrightSpotColorDay 				= float3( 1.0, 0.125, 0.0 );//Determines the color of bright areas. 
float   EBrightSpotAmountDay 				= 0.0;						//Higher values increase effect strength.
float   EBrightSpotThresholdDay 			= 0.5;						//Lower values increase the spread of the effect.
float   EBrightSpotCurveDay 				= 16.0;						//Lower values increase the spread of the effect.
////////////////////////////////////////////////////////////////////////
//Night
float  	EMinSaturationPowerNight	 		= 0.7;
float  	EMaxSaturationPowerNight 			= 1.0;
float 	EBrightCurveNight 					= 0.9;
float 	EContrastCurveNight 				= 1.1;
float  	EContrastThresholdNight 			= 0.1;

float	EToneMappingOversaturationV8Night 	= 1.0;
float	EToneMappingCurveV8Night 			= 1.0;

float	EAdaptationMinV8Night 				= 0.64;
float	EAdaptationMaxV8Night 				= 0.32;

float	EFinalContrastV8Night 				= 0.0;
float	EFinalExposureV8Night 				= 0.0;	
/////////////////////////////////////////////////////////Red Green Blue
float3 	EMoodColorNight 					= float3( 0.0, 0.125, 1.0 );
float   EMoodAmountNight 					= 0.0;
float   EMoodThresholdNight 				= 1.0;								
float   EMoodCurveNight 					= 3.0;
/////////////////////////////////////////////////////////Red Green Blue
float3 	EShadowColorNight 					= float3( 0.0, 0.125, 1.0 );
float   EShadowAmountNight 					= 0.0;
float   EShadowThresholdNight 				= 0.5;
float   EShadowCurveNight 					= 16.0;
//////////////////////////////////////////////////////////Red Green Blue
float3 	EBrightSpotColorNight 				= float3( 1.0, 0.125, 0.0 );
float   EBrightSpotAmountNight 				= 0.0;
float   EBrightSpotThresholdNight 			= 0.5;
float   EBrightSpotCurveNight 				= 16.0;
///////////////////////////////////////////////////////////////////////////
//Interior
float  	EMinSaturationPowerInt 				= 0.7;
float  	EMaxSaturationPowerInt 				= 1.4;
float 	EBrightCurveInt 					= 0.95;
float 	EContrastCurveInt 					= 1.1;
float 	EContrastThresholdInt 				= 0.9;

float	EToneMappingOversaturationV8Interior= 1.0;
float	EToneMappingCurveV8Interior 		= 1.0;

float	EAdaptationMinV8Interior 			= 0.64;
float	EAdaptationMaxV8Interior 			= 0.32;

float	EFinalContrastV8Interior 			= 0.0;
float	EFinalExposureV8Interior 			= 0.0;
/////////////////////////////////////////////////////////Red Green Blue
float3 	EMoodColorInt 						= float3(0.0, 0.125, 1.0);
float   EMoodAmountInt 						= 0.0;
float   EMoodThresholdInt 					= 1.0;						
float   EMoodCurveInt 						= 3.0;
/////////////////////////////////////////////////////////Red Green Blue
float3 	EShadowColorInt 					= float3(0.0, 0.125, 1.0);
float   EShadowAmountInt 					= 0.0;
float   EShadowThresholdInt 				= 0.5;
float   EShadowCurveInt 					= 16.0;
//////////////////////////////////////////////////////////Red Green Blue
float3 	EBrightSpotColorInt 				= float3(1.0, 0.125, 0.0);
float   EBrightSpotAmountInt 				= 0.0;
float   EBrightSpotThresholdInt 			= 0.5;
float   EBrightSpotCurveInt 				= 16.0;
///////////////////////////////////////////////////////////////////////////
#endif

//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
/////////////////////////////////////////////////////////////////////////////////////////////////
///END OF USER CONTROLS, PROCEED AT YOUR OWN RISK////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
//+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++





/// Thanks to Kermles for this huge enbeffect which is the base for this ME 2 enbeffect :)
/// Actually, 70-80% of the work is by Kermles here.



/////////////////////////////////////////////////////////////////////////////////////////////////
///FUNCTIONS/CONSTANTS///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////



float3 RGBtoXYZ(in float3 rgb)
{
	float3 rXYZV = float3(0.49, 0.31, 0.2);
	float3 gXYZV = float3(0.17697, 0.8124, 0.01063);
	float3 bXYZV = float3(0.0, 0.01, 0.99);
	float3 XYZ = 0.17697 * (float3(dot(rgb, rXYZV), dot(rgb, gXYZV), dot(rgb, bXYZV)));
	return XYZ;
}

float3 RGBtoLMSR(in float3 rgb)
{
	float L = dot(rgb, float3(0.096869562190332, 0.318940374720484, -0.188428411786113));
	float M = dot(rgb, float3(0.020208210904239, 0.291385283197581, -0.090918262127325));
	float S = dot(rgb, float3(0.002760510899553, -0.008341563564118, 0.067213551661950));
	float R = dot(rgb, float3(-0.007607045462440, 0.122492925567539, 0.022445835141881));
	return float4(L,M,S,R);
}

float3 XYZtoLMS(in float3 xyz)
{
	float3 xLMSV = float3(0.8951, 0.2664, -0.1614);
	float3 yLMSV = float3(-0.7502, 1.7135, 0.0367);
	float3 zLMSV = float3(0.0389, -0.0685, 1.0296);
	float3 LMS = float3(dot(xyz, xLMSV), dot(xyz, yLMSV), dot(xyz, zLMSV));
	return LMS;
}

float3 LMStoRGBYL(in float3 lms)
{
	float RG = lms.y-lms.x;
	float BY = lms.z-(lms.x+lms.y);
	float L = lms.x+lms.y;
	return float3(RG,BY,L);
}

#if(HSV_EQUALIZER == 1)
float   fHueRed = 0.0;
float   fHueOrange = 0.08333333;
float   fHueYellow = 0.16666667;
float   fHueGreen = 0.33333333;
float   fHueCyan = 0.5;
float   fHueBlue = 0.66666667;
float   fHueMagenta = 0.83333333;
float   fHueRed2 = 1.0;

float ColorEqualizerMult(in float H, in float JKNDF, in float JKIF)
{
	float SMult = 1.0;
	SMult += lerp(lerp(fColorSaturationMultRedDay * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), fColorSaturationMultRedNight * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), JKNDF),fColorSaturationMultRedInt * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultOrangeDay * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), fColorSaturationMultOrangeNight * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), JKNDF), fColorSaturationMultOrangeInt * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultYellowDay * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), fColorSaturationMultYellowNight * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), JKNDF), fColorSaturationMultYellowInt * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultGreenDay * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), fColorSaturationMultGreenNight * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), JKNDF), fColorSaturationMultGreenInt * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultCyanDay * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), fColorSaturationMultCyanNight * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), JKNDF), fColorSaturationMultCyanInt * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultBlueDay * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), fColorSaturationMultBlueNight * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), JKNDF), fColorSaturationMultBlueInt * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultMagentaDay * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), fColorSaturationMultMagentaNight * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), JKNDF), fColorSaturationMultMagentaInt * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), JKIF);
	SMult += lerp(lerp(fColorSaturationMultRedDay * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), fColorSaturationMultRedNight * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), JKNDF), fColorSaturationMultRedInt * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), JKIF);
	return SMult;
}

float ColorEqualizerMod(in float H, in float JKNDF, in float JKIF)	
{
	float SMod = 0.0;
	SMod += lerp(lerp(fColorSaturationModRedDay * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), fColorSaturationModRedNight * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), JKNDF),fColorSaturationModRedInt * ( 1.0 - min( 1.0, abs( ( fHueRed - H ) / ( fHueRed - fHueOrange ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModOrangeDay * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), fColorSaturationModOrangeNight * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), JKNDF), fColorSaturationModOrangeInt * ( 1.0 - min( 1.0, abs( ( fHueOrange - H ) / ( fHueOrange - fHueYellow ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModYellowDay * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), fColorSaturationModYellowNight * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), JKNDF), fColorSaturationModYellowInt * ( 1.0 - min( 1.0, abs( ( fHueYellow - H ) / ( fHueYellow - fHueGreen ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModGreenDay * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), fColorSaturationModGreenNight * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), JKNDF), fColorSaturationModGreenInt * ( 1.0 - min( 1.0, abs( ( fHueGreen - H ) / ( fHueGreen - fHueYellow ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModCyanDay * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), fColorSaturationModCyanNight * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), JKNDF), fColorSaturationModCyanInt * ( 1.0 - min( 1.0, abs( ( fHueCyan - H ) / ( fHueCyan - fHueGreen ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModBlueDay * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), fColorSaturationModBlueNight * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), JKNDF), fColorSaturationModBlueInt * ( 1.0 - min( 1.0, abs( ( fHueBlue - H ) / ( fHueBlue - fHueCyan ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModMagentaDay * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), fColorSaturationModMagentaNight * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), JKNDF), fColorSaturationModMagentaInt * ( 1.0 - min( 1.0, abs( ( fHueMagenta - H ) / ( fHueMagenta - fHueBlue ) ) ) ), JKIF);
	SMod += lerp(lerp(fColorSaturationModRedDay * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), fColorSaturationModRedNight * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), JKNDF), fColorSaturationModRedInt * ( 1.0 - min( 1.0, abs( ( fHueRed2 - H ) / ( fHueRed2 - fHueMagenta ) ) ) ), JKIF);
	return SMod;
}
#endif

float3 HUEtoRGB(in float H)
{
    float R = abs(H * 6.0 - 3.0) - 1.0;
    float G = 2.0 - abs(H * 6.0 - 2.0);
    float B = 2.0 - abs(H * 6.0 - 4.0);
    return saturate(float3(R,G,B));
}

float RGBCVtoHUE(in float3 RGB, in float C, in float V)
{
      float3 Delta = (V - RGB) / C;
      Delta.rgb -= Delta.brg;
      Delta.rgb += float3(2.0,4.0,6.0);
      Delta.brg = step(V, RGB) * Delta.brg;
      float H;
      H = max(Delta.r, max(Delta.g, Delta.b));
      return frac(H / 6.0);
}

float3 HSVtoRGB(in float3 HSV)
{
    float3 RGB = HUEtoRGB(HSV.x);
    return ((RGB - 1) * HSV.y + 1) * HSV.z;
}
  
float3 RGBtoHSV(in float3 RGB)
{
    float3 HSV = 0.0;
    HSV.z = max(RGB.r, max(RGB.g, RGB.b));
    float M = min(RGB.r, min(RGB.g, RGB.b));
    float C = HSV.z - M;
    if (C != 0.0)
    {
      HSV.x = RGBCVtoHUE(RGB, C, HSV.z);
      HSV.y = C / HSV.z;
    }
    return HSV;
}

float __min_channel(float3 v)
{
    float t = (v.x<v.y) ? v.x : v.y;
    t = (t<v.z) ? t : v.z;
    return t;
}

float __max_channel(float3 v)
{
    float t = (v.x>v.y) ? v.x : v.y;
    t = (t>v.z) ? t : v.z;
    return t;
}

float3 RGBtoHSV7(float3 RGB)
{
	RGB.x = 1/(1+RGB.x);
	RGB.y = 1/(1+RGB.y);
	RGB.z = 1/(1+RGB.z);
    float3 HSV = (0.0).xxx;
    float minVal = __min_channel(RGB);
    float maxVal = __max_channel(RGB);
    float delta = maxVal - minVal;             //Delta RGB value 
    HSV.z = maxVal;
    if (delta != 0) {                    // If gray, leave H & S at zero
       HSV.y = delta / maxVal;
       float3 delRGB;
       delRGB = ( ( ( maxVal.xxx - RGB ) / 6.0 ) + ( delta / 2.0 ) ) / delta;
       if      ( RGB.x == maxVal ) HSV.x = delRGB.z - delRGB.y;
       else if ( RGB.y == maxVal ) HSV.x = ( 1.0/3.0) + delRGB.x - delRGB.z;
       else if ( RGB.z == maxVal ) HSV.x = ( 2.0/3.0) + delRGB.y - delRGB.x;
       if ( HSV.x < 0.0 ) { HSV.x += 1.0; }
       if ( HSV.x > 1.0 ) { HSV.x -= 1.0; }
    }
    return (HSV);
}

float3 HSVtoRGB7(float3 HSV)
{
    float3 RGB = HSV.z;
    if ( HSV.y != 0 ) {
       float var_h = HSV.x * 6;
       float var_i = floor(var_h);   // Or ... var_i = floor( var_h )
       float var_1 = HSV.z * (1.0 - HSV.y);
       float var_2 = HSV.z * (1.0 - HSV.y * (var_h-var_i));
       float var_3 = HSV.z * (1.0 - HSV.y * (1-(var_h-var_i)));
       if      (var_i == 0) { RGB = float3(HSV.z, var_3, var_1); }
       else if (var_i == 1) { RGB = float3(var_2, HSV.z, var_1); }
       else if (var_i == 2) { RGB = float3(var_1, HSV.z, var_3); }
       else if (var_i == 3) { RGB = float3(var_1, var_2, HSV.z); }
       else if (var_i == 4) { RGB = float3(var_3, var_1, HSV.z); }
       else                 { RGB = float3(HSV.z, var_1, var_2); }
   }
   RGB.x = (1/RGB.x)-1;
   RGB.y = (1/RGB.y)-1;
   RGB.z = (1/RGB.z)-1;
   return (RGB);
}

float3 hsv_safe(float3 InColor)
{
    float3 safeC = InColor;
    safeC.x = frac(safeC.x);
    /* if (safeC.x < 0.0) {
	safeC.x += 1.0;
    } else if (safeC.x > 1.0) {
	safeC.x -= 1.0;
    } */
    return(safeC);
}

float3 hsv_complement(float3 InColor)
{
    float3 complement = InColor;
    complement.x -= 0.5;
    if (complement.x<0.0) { complement.x += 1.0; } // faster than hsv_safe()
    return(complement);
}

#define COLOR_PI (3.141592652589793238)
#define COLOR_TWO_PI (2.0 * COLOR_PI)

float3 color_cylinder(float3 hsv)
{
    float a = hsv.x * COLOR_TWO_PI;
    float3 p;
    p.x = hsv.y * cos(a);
    p.y = hsv.y * sin(a);
    p.z = hsv.z;
    return p;
}

float3 from_cylinder(float3 p)
{
    float3 hsv;
    hsv.z = p.z;
    float q = p.x*p.x+p.y*p.y;
    q = sqrt(q);
    hsv.y = (q);
    float a = atan2(p.y,p.x);
    hsv.x = a / COLOR_TWO_PI;
    // return hsv_safe(hsv);
    return (hsv);
}

// lerp the shortest distance through the color solid
float3 hsv_lerp(float3 C0,float3 C1,float T)
{
    float3 p0 = color_cylinder(C0);
    float3 p1 = color_cylinder(C1);
    float3 pg = lerp(p0,p1,T);
    return from_cylinder(pg);
}

// lerp the shorterst distance around the color wheel - ONLY color
float3 hsv_tint(float3 SrcColor,float3 TintColor,float T)
{
    float3 tt = hsv_lerp(SrcColor,TintColor,T);
    tt.yz = SrcColor.yz;
    return(tt);
}

float hue_lerp(float h1,
		   float h2,
		   float v)
{
    float d = abs(h1 - h2);
    if (d <= 0.5) {
	return (float)lerp(h1,h2,v);
    } else if (h1 < h2) {
	return (float)frac(lerp((h1+1.0),h2,v));
    } else
	return (float)frac(lerp(h1,(h2+1.0),v));
}

float Luminance( float3 Color )
{
	return dot( Color, float3( 0.2125, 0.7154, 0.0721 ) );
}

float random(in float2 uv)
{
    float2 noise = (frac(sin(dot(uv , float2(12.9898,78.233) * 2.0)) * 43758.5453));
    return abs(noise.x + noise.y) * 0.5;
}

float smootherstep(float edge0, float edge1, float x)
{
    x = saturate((x - edge0)/(edge1 - edge0)); 
    return x*x*(3 - 2*x);
}

// fitRange: Take an input value (x) on the range [a, b] and return a value mapped to the range [c, d].
float fitRange (float a, float b, float x, float c, float d) {
//	if ( a == b ) return (c + d)/2; //Invalid input range, there is no 1 to 1 mapping of the range [a,b] to [c,d]. Since no particular value is valid, return the average of [c,d].
//	if ( c == d ) return c; //Invalid output range, there is no 1 to 1 mapping of the range [a,b] to [c,d]. Regardless of the input value (x), the output will be equal to (c) when mapped to this invalid range.
	return ((d - c) * (x - a) / (b - a)) + c;
}

// pCurve: Takes an input value (x) on the range [-1, 1] and a curve depth (n), fits values to a bell (ish) curve (actually a portion of the Lorentz curve if (n) is equal to pi, but close enough).
// Returns values for x=[-1, 1] ranging from 0 to 1, peeking at 1 where x = 0 (and falling to 0 at x=-1 and x=1). Values outside this range are negative.
// Note: (n) must be positive and non-zero. This function must not be passed any value for n <= 0.0.
float pCurve (float x, float n) {
	return ((n + 1) / (n * (1 + (n * pow(x, 2))))) - (1/n);
}

// sCurve: Takes an input value (x) on the range [-1, 1] and a curve depth (n), fits values to a smooth s-curve.
// Returns values for x=(-1, 1] ranging from 0 to 1, peeking at 1.0 where x = 1. Values outside this range are invalid.
// Note: The range (-1, 1] for (x) does not include -1.0. This function must not be passed x = -1.0.
float sCurve (float x, float n) {
	return 1 / (1 + pow((1 - x)/(1 + x), n));
}

// peakCurve: Wrapper for pCurve, takes an input value (x) on the range [a,b], along with a curve depth (n),
// Checks for invalid values, fits (x) to the appropriate range, then calls pCurve.
float peakCurve (float a, float b, float x, float n) {
	if (n <= 0.0) return -1.0; // check for invalid curve depth (n)
	x = fitRange(a, b, x, -1.0, 1.0);
	return pCurve(x, n);
}

// smoothCurve: Wrapper for sCurve, takes an input value (x) on the range [a,b], along with a curve depth (n). 
// Checks for invalid values, fits (x) to the appropriate range, then calls sCurve.
float smoothCurve (float a, float b, float x, float n) {
	if (x <= a) return 0.0; //return 0.0 if x is below the range.
	if (x >= b) return 1.0; //return 1.0 if x is below the range.
	x = fitRange(a, b, x,  -1.0, 1.0);
	return sCurve(x, n);
}

// compoundCurve: Wrapper for sCurve, take an input value (x) and a crossover point (c) on the range [a,b], along with a curve depth (n). 
// Check for invalid values, fit x < c to the range (-1, 0] and x > c to the range [0, 1), call sCurve, then scale the result to the appropriate range based on c.
float compoundCurve (float a, float b, float x, float n, float c) {
	if (x <= a) return 0.0; //return 0.0 if x is below the range.
	if (x >= b) return 1.0; //return 1.0 if x is below the range.

	if (c <= a) return -1.0; //invalid crossover point
	if (c >= b) return -1.0; //invalid crossover point

	float cMult = fitRange(a, b, c, 0.0, 2.0);
	
	if (x <= c) {
		return cMult * sCurve(fitRange(a, c, x, -1.0, 0.0), n);
	} else {
		return ((2.0 - cMult) * sCurve(fitRange(c, b, x, 0.0, 1.0), n)) + (cMult - 1);
	}
}

// Master Effect functions
float4 TonemapPass( float4 colorInput, float JKI, float JKND )
{

float MGamma =lerp( lerp( MGammaDay, MGammaNight, JKND ), MGammaInterior, JKI );
float MExposure =lerp( lerp( MExposureDay, MExposureNight, JKND ), MExposureInterior, JKI );
float MSaturation =lerp( lerp( MSaturationDay, MSaturationNight, JKND ), MSaturationInterior, JKI );
float MBleach =lerp( lerp( MBleachDay, MBleachNight, JKND ), MBleachInterior, JKI );
float MDefog =lerp( lerp( MDefogDay, MDefogNight, JKND ), MDefogInterior, JKI );
float MFogColor =lerp( lerp( MFogColorDay, MFogColorNight, JKND ), MFogColorInterior, JKI );
float MA =lerp( lerp( MADay, MANight, JKND ), MAInterior, JKI );
float MB =lerp( lerp( MBDay, MBNight, JKND ), MBInterior, JKI );
float MC =lerp( lerp( MCDay, MCNight, JKND ), MCInterior, JKI );
float MD =lerp( lerp( MDDay, MDNight, JKND ), MDInterior, JKI );
float ME =lerp( lerp( MEDay, MENight, JKND ), MEInterior, JKI );
float MF =lerp( lerp( MFDay, MFNight, JKND ), MFInterior, JKI );
float MW =lerp( lerp( MWDay, MWNight, JKND ), MWInterior, JKI );
float MExpAdjust =lerp( lerp( MExpAdjustDay, MExpAdjustNight, JKND ), MExpAdjustInterior, JKI );
float MAddContrast =lerp( lerp( MAddContrastDay, MAddContrastNight, JKND ), MAddContrastInterior, JKI );


	float3 color = colorInput.rgb;

		//mine
	float3 curr = ((color*(MA*color+MC*MB)+MD*ME)/(color*(MA*color+MB)+MD*MF))-ME/MF;
    	float3 whiteScale = ((MW*(MA*MW+MC*MB)+MD*ME)/(MW*(MA*MW+MB)+MD*MF))-ME/MF;
	color = curr*whiteScale;

	color = color*MExpAdjust;

	color = lerp(color, 0.5 * (1 + sin((color - 0.5)*3.1415926)), MAddContrast);

	color = saturate(color - MDefog * MFogColor); // Defog
	
	color *= pow(2.0f, MExposure); // Exposure
	
	color = pow(color, MGamma);    // Gamma -- roll into the first gamma correction in main.h ?
	
	float3 MlumCoeff = float3(0.2126, 0.7152, 0.0722);
	float Mlum = dot(MlumCoeff, color.rgb);
	
	float3 Mblend = Mlum.rrr; //dont use float3
	
	float ML = saturate( 10.0 * (Mlum - 0.45) );
  	
	float3 result1 = 2.0f * color.rgb * Mblend;
	float3 result2 = 1.0f - 2.0f * (1.0f - Mblend) * (1.0f - color.rgb);
	
	float3 newColor = lerp(result1, result2, ML);
	float A2 = MBleach * color.rgb; //why use a float for A2 here and then multiply by color.rgb (a float3)?
	//float3 A2 = Bleach * color.rgb; //
	float3 mixRGB = A2 * newColor;
	
	color.rgb += ((1.0f - A2) * mixRGB);
	
	float3 Mmiddlegray = dot(color,(1.0/3.0)); //1fps slower than the original on nvidia, 2 fps faster on AMD
	
	float3 Mdiffcolor = color - Mmiddlegray; //float 3 here
	colorInput.rgb = (color + Mdiffcolor * MSaturation)/(1+(Mdiffcolor*MSaturation)); //saturation

	return colorInput;
}




float4 CrossProcess_PS(float4 color, float JKI, float JKND)
 {

float CrossContrast =lerp( lerp( CrossContrastDay, CrossContrastNight, JKND ), CrossContrastInterior, JKI );
float CrossSaturation =lerp( lerp( CrossSaturationDay, CrossSaturationNight, JKND ), CrossSaturationInterior, JKI );
float CrossBrightness =lerp( lerp( CrossBrightnessDay, CrossBrightnessNight, JKND ), CrossBrightnessInterior, JKI );
float CrossAmount =lerp( lerp( CrossAmountDay, CrossAmountNight, JKND ), CrossAmountInterior, JKI );


		float4 image1 = color;
		float4 image2 = color;

		float gray = dot(float3(0.5,0.5,0.5), image1);  

		image1 = lerp (gray, image1,CrossSaturation);

		image1 = lerp (0.35, image1,CrossContrast);

		image1 +=CrossBrightness;

		image2.r = image1.r * CrossMatrix[0].x + CrossMatrix[0].y;
		image2.g = image1.g * CrossMatrix[1].x + CrossMatrix[1].y;
		image2.b = image1.b * CrossMatrix[2].x + CrossMatrix[2].y;

		color = lerp(image1, image2, CrossAmount);

		return color;
 }


static float3x3 RGB =
{
2.67147117265996,-1.26723605786241,-0.410995602172227,
-1.02510702934664,1.98409116241089,0.0439502493584124,
0.0610009456429445,-0.223670750812863,1.15902104167061
};

static float3x3 XYZ =
{
0.500303383543316,0.338097573222739,0.164589779545857,
0.257968894274758,0.676195259144706,0.0658358459823868,
0.0234517888692628,0.1126992737203,0.866839673124201
};

float4 DPXPass(float4 InputColor, float JKI, float JKND){


	float DPXRed =lerp( lerp( DPXRedDay, DPXRedNight, JKND ), DPXRedInterior, JKI );
	float DPXGreen =lerp( lerp( DPXGreenDay, DPXGreenNight, JKND ), DPXGreenInterior, JKI );
	float DPXBlue =lerp( lerp( DPXBlueDay, DPXBlueNight, JKND ), DPXBlueInterior, JKI );

	float DPXColorGamma =lerp( lerp( DPXColorGammaDay, DPXColorGammaNight, JKND ), DPXColorGammaInterior, JKI );

	float DPXDPXSaturation =lerp( lerp( DPXDPXSaturationDay, DPXDPXSaturationNight, JKND ), DPXDPXSaturationInterior, JKI );

	float DPXRedC =lerp( lerp( DPXRedCDay, DPXRedCNight, JKND ), DPXRedCInterior, JKI );
	float DPXGreenC =lerp( lerp( DPXGreenCDay, DPXGreenCNight, JKND ), DPXGreenCInterior, JKI );
	float DPXBlueC =lerp( lerp( DPXBlueCDay, DPXBlueCNight, JKND ), DPXBlueCInterior, JKI );
	
	float DPXBlend =lerp( lerp( DPXBlendDay, DPXBlendNight, JKND ), DPXBlendInterior, JKI );


	float DPXContrast = -0.2;

	float DPXGamma = 1.0;

	float RedCurve = DPXRed;
	float GreenCurve = DPXGreen;
	float BlueCurve = DPXBlue;
	
	float3 RGB_Curve = float3(DPXRed,DPXGreen,DPXBlue);
	float3 RGB_C = float3(DPXRedC,DPXGreenC,DPXBlueC);

	float3 B = InputColor.rgb;
	
	B = pow(B, 1.0/DPXGamma);

  	B = B * (1.0 - DPXContrast) + (0.5 * DPXContrast);

  	float3 Btemp = (1.0 / (1.0 + exp(RGB_Curve / 2.0)));	  
	B = ((1.0 / (1.0 + exp(-RGB_Curve * (B - RGB_C)))) / (-2.0 * Btemp + 1.0)) + (-Btemp / (-2.0 * Btemp + 1.0));


    	float value = max(max(B.r, B.g), B.b);
	float3 color = B / value;
	
	color = pow(color, 1.0/DPXColorGamma);
	
	float3 c0 = color * value;

	c0 = mul(XYZ, c0);

	float luma = dot(c0, float3(0.30, 0.59, 0.11)); 

	c0 = (1.0 - DPXDPXSaturation) * luma + DPXDPXSaturation * c0;
	   
	c0 = mul(RGB, c0);
	
	InputColor.rgb = lerp(InputColor.rgb, c0, DPXBlend);

	
	return InputColor;
}



/////////////////////////////////////////////////////////////////////////////////////////////////
///SHADER INITIALIZATIONS////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
//keyboard controlled temporary variables (in some versions exists in the config file). Press and hold key 1,2,3...8 together with PageUp or PageDown to modify. By default all set to 1.0
float4   tempF1;	 //0,1,2,3
float4   tempF2;	 //5,6,7,8
float4   tempF3;	 //9,0
float4   Timer;		 //x=generic timer in range 0..1, period of 16777216 ms (4.6 hours), w=frame time elapsed (in seconds)
float4   ScreenSize;	 //x=Width, y=1/Width, z=ScreenScaleY, w=1/ScreenScaleY
float   ENightDayFactor; //changes in range 0..1, 0 means that night time, 1 - day time
float   EInteriorFactor; //changes 0 or 1. 0 means that exterior, 1 - interior
float   EBloomAmount;	 //enb version of bloom applied, ignored if original post processing used

texture2D texs0;//color
texture2D texs3;//bloom enb
texture2D texs4;//adaptation enb
texture2D texs7;//palette enb

texture2D texs8 
<
string ResourceName="enblensdirt.bmp";
>;
texture2D texs10 
<
string ResourceName="enbeinringsiezuknechten.bmp";
>;


sampler2D _s0 = sampler_state
{
   Texture   = <texs0>;
   MinFilter = LINEAR;//
   MagFilter = LINEAR;//
   MipFilter = LINEAR;//LINEAR;
   AddressU  = Clamp;
   AddressV  = Clamp;
   SRGBTexture=FALSE;
   MaxMipLevel=0;
   MipMapLodBias=0;
};
sampler2D _s3 = sampler_state
{
   Texture   = <texs3>;
   MinFilter = LINEAR;//
   MagFilter = LINEAR;//
   MipFilter = NONE;//LINEAR;
   AddressU  = Clamp;
   AddressV  = Clamp;
   SRGBTexture=FALSE;
   MaxMipLevel=0;
   MipMapLodBias=0;
};

sampler2D _s4 = sampler_state
{
   Texture   = <texs4>;
   MinFilter = LINEAR;//
   MagFilter = LINEAR;//
   MipFilter = NONE;//LINEAR;
   AddressU  = Clamp;
   AddressV  = Clamp;
   SRGBTexture=FALSE;
   MaxMipLevel=0;
   MipMapLodBias=0;
};

sampler2D _s7 = sampler_state
{
   Texture   = <texs7>;
   MinFilter = LINEAR;
   MagFilter = LINEAR;
   MipFilter = NONE;
   AddressU  = Clamp;
   AddressV  = Clamp;
   SRGBTexture=FALSE;
   MaxMipLevel=0;
   MipMapLodBias=0;
};

sampler2D _s8 = sampler_state //additional
{
Texture = <texs8>;
MinFilter = LINEAR;
MagFilter = LINEAR;
};

sampler2D _s10 = sampler_state //additional
{
Texture = <texs10>;
MinFilter = LINEAR;
MagFilter = LINEAR;
};


struct VS_OUTPUT_POST
{
   float4 vpos  : POSITION;
   float2 txcoord0 : TEXCOORD0;
};
struct VS_INPUT_POST
{
   float3 pos  : POSITION;
   float2 txcoord0 : TEXCOORD0;
};

VS_OUTPUT_POST VS_Quad(VS_INPUT_POST IN)
{
   VS_OUTPUT_POST OUT;

   OUT.vpos=float4(IN.pos.x,IN.pos.y,IN.pos.z,1.0);

   OUT.txcoord0.xy=IN.txcoord0.xy;

   return OUT;
}





float4 PS_GTASA(VS_OUTPUT_POST IN, float2 vPos : VPOS) : COLOR
{
   float4 _oC0=0.0; //output

   float4 _c6=float4(0, 0, 0, 0);
   float4 _c7=float4(0.212500006, 0.715399981, 0.0720999986, 1.0);

   float4 r0;
   float4 r1;
   float4 r2;
   float4 r3;
   float4 r4;
   float4 r5;
   float4 r6;
   float4 r7;
   float4 r8;
   float4 r9;
   float4 r10;
   float4 r11;
	
/////////////////////////////////////////////////////////////////////////////////////////////////
///DNI CODE//////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

	// FLIP DNI CODE
	float JKInteriorFactor = EInteriorFactor;
	float JKNightDayFactor = ENightDayFactor;
	#if(FLIP_INT_EXT_FACTOR == 1)
			JKInteriorFactor = 1 - EInteriorFactor;
	#endif
	#if(FLIP_NITE_DAY_FACTOR == 1)
			JKNightDayFactor = 1 - ENightDayFactor;
	#endif
	
	   // FLIP DNI CODE
	float hnd = ENightDayFactor;
	float ji = EInteriorFactor;
		#if(FLIP_INT_EXT_FACTOR == 0)
		ji = 1 - EInteriorFactor;
		#endif
		#if(FLIP_NITE_DAY_FACTOR == 0)
		hnd = 1 - ENightDayFactor;
		#endif
   
   float2 hndtweak = float2( 3.1 , 1.5 );
	float vhnd = hnd; // effects vignette stregth;
	float bchnd = hnd; // effects hd6 bloom crisp
	float cdhnd = hnd; // effects hd6 colorsat daynight
	
	// Some caves are seen as daytime, so I set key 3 to force nightime
	// This doesnt work very well >_<
	hnd = tempF2.x < 1 ? 0 : hnd;
	hndtweak.x = tempF2.x < 1 ? hndtweak.y : hndtweak.x; // Dont ask, I have no idea why I need this lol
	
/////////////////////////////////////////////////////////////////////////////////////////////////
///LETTERBOX CODE////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

	#if(LETTERBOX_BARS == 1)
		float fLetterboxBarHeight =lerp( lerp( fLetterboxBarHeightDay, fLetterboxBarHeightNight, JKNightDayFactor ), fLetterboxBarHeightInterior, JKInteriorFactor );

	if( IN.txcoord0.y > 1.0 - fLetterboxBarHeight || IN.txcoord0.y  < fLetterboxBarHeight )
	{
		return _c6;
	}
	#endif
	
/////////////////////////////////////////////////////////////////////////////////////////////////
///VANILLA COLOR CORRECTION//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////	
	
	float4 _v0=0.0;

	_v0.xy=IN.txcoord0.xy;





//float3 LumCoeff = lerp( LumCoeffInterior, ( lerp( LumCoeffNight, LumCoeffDay,  JKNightDayFactor ) ), JKInteriorFactor);	


#if (SHARPEN==0)
	r1=tex2D(_s0, _v0.xy); // COLOR
#endif

#if (SHARPEN==1)

r1=tex2D(_s0, _v0.xy); 
r1 *= 9;

float ScreenSizeHoriz = 1/(ScreenSize.x * ScreenSize.w);

float fSharpScale = lerp( fSharpScaleInterior, ( lerp( fSharpScaleNight, fSharpScaleDay,  JKNightDayFactor ) ), JKInteriorFactor);

r1 -= tex2D(_s0, _v0.xy + float2(-ScreenSize.y, ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(0.0, ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(ScreenSize.y, ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(ScreenSize.y, 0.0) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(ScreenSize.y, -ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(0.0, -ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(-ScreenSize.y, -ScreenSizeHoriz) * fSharpScale);
r1 -= tex2D(_s0, _v0.xy + float2(-ScreenSize.y, 0.0) * fSharpScale);


#endif


//r1=tex2D(_s0, _v0.xy); // COLOR

	r11=r1; //my bypass
	_oC0.xyz=r1.xyz; // FOR FUTURE USE WITHOUT GAME COLOR CORRECTIONS


   float4 color=_oC0;

	
	color*=1.2;
	color=max(color,0.0001);	//KYO : decrease this value to increase black levels. I'm doing this to affect BLACKS only without touching anything else.
			
	float4   Adaptation=tex2D(_s4, 0.5);
	float   grayadaptation=Luminance(Adaptation.xyz);

/////////////////////////////////////////////////////////////////////////////////////////////////
///HD6 COLOR CODE////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

// HD6 - Alter Brightness using keyboard during gameplay
			
	float3 tuctbrt1[2] 	= { uctbrt1[0], uctbrt1[1] };					
	float3 tuctbrt2[2]	= { uctbrt2[0], uctbrt2[1] };
	float3 tuctcon[2]	= { uctcon[0], uctcon[1] };
	float3 tuctsat[2]	= { uctsat[0], uctsat[1] };
	
	tuctbrt1[0] -= darkenby1[0];
	tuctbrt1[1] -= darkenby1[1];

	float h1 = lerp(-1,1,tempF1.x); // Increases speed it changes by when pressing key		
	h1 = lerp( h1, 1, lerp(hnd, 0, ji) ); // Removes affect during day		
//	h1 = h1 - (h1 % 0.1); // Changes it so incriments are in steps, remove this if you want smooth changes when pressing keys
	float hbs = lerp( EBloomAmount/2, EBloomAmount, h1); // Reduce bloom as it gets darker, otherwise it just gets hazier, higher number reduces bloom more as it gets darker

	float h2 = lerp(-1,1,tempF1.y); // Increases speed it changes by when pressing key
	h2 = lerp( 1, h2, lerp(0, hnd, ji) ); // Removes affect during night
//	h2 = h2 - (h2 % 0.1); // Changes it so incriments are in steps, remove this if you want smooth changes when pressing keys
	
	float h3 = lerp(-1,1,tempF1.z); // Increases speed it changes by when pressing key
	h3 = lerp( h3, 1, ji ); // Removes affect in interior
//	h3 = h3 - (h3 % 0.1); // Changes it so incriments are in steps, remove this if you want smooth changes when pressing keys
	
	hbs = lerp( (hbs/2)-1, hbs, h2); // Reduce bloom as it gets darker, otherwise it just gets hazier, higher number reduces bloom more as it gets darker
	hbs = max(0,hbs);
	hbs = min(2,hbs); // should be able to go above 1, but not 2
	
	vhnd = lerp(-2,hnd,h2);
	vhnd = max(0,vhnd); // do not go below 0;
	vhnd = min(1,vhnd); // not above 1, just incase people like surface of sun
			
	cdhnd=bchnd=vhnd;
		
	#if(COLORSAT_DAYNIGHT == 1)

		float3 nsatn= lerp( ansati, ( lerp( ansatn, ansatd, hnd ) ), ji );
		float3 oldcoln = color.xyz;

		nsatn.rgb-= lerp( snsati, ( lerp( snsatn, snsatd, hnd ) ), ji );

		nsatn.rb*= lerp( hd6MAGENTAInterior, ( lerp( hd6MAGENTANight, hd6MAGENTADay, hnd ) ), ji );
		nsatn.bg*= lerp( hd6CYANInterior, ( lerp( hd6CYANNight, hd6CYANDay, hnd ) ), ji );
		nsatn.rg*= lerp( hd6YELLOWInterior, ( lerp( hd6YELLOWNight, hd6YELLOWDay, hnd ) ), ji );
		
		nsatn.rb-= lerp( hd6MAGENTAsubInterior, ( lerp( hd6MAGENTAsubNight, hd6MAGENTAsubDay, hnd ) ), ji );
		nsatn.bg-= lerp( hd6CYANsubInterior, ( lerp( hd6CYANsubNight, hd6CYANsubDay, hnd ) ), ji );
		nsatn.rg-= lerp( hd6YELLOWsubInterior, ( lerp( hd6YELLOWsubNight, hd6YELLOWsubDay, hnd ) ), ji );

		color.xyz *=nsatn;

//++Changes appareance of colors, bloom color perception handled elsewhere++++++++++++++++++++++++++++++++++++++++++++++++++
		float3 greycn = float3(0.299, 0.587, 0.114);  // perception of color luminace
		//float3 greycn = float3(0.811,0.523,0.996);	// perception of color luminace
		//float3 greycn = float3(0.333,0.333,0.333); 		// screw perception
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		color.xyz += (oldcoln.x-(oldcoln.x*nsatn.x)) * greycn.x;
		color.xyz += (oldcoln.y-(oldcoln.y*nsatn.y)) * greycn.y;
		color.xyz += (oldcoln.z-(oldcoln.z*nsatn.z)) * greycn.z;

	#endif	
	
	#if(COLOR_TWEAKS == 1)
		float3 uctbrt1t = float3( lerp( tuctbrt1[1].x, 	tuctbrt1[0].x,	h1), lerp( tuctbrt1[1].y, 	tuctbrt1[0].y, h2), lerp( tuctbrt1[1].z, 	tuctbrt1[0].z, h3) );			
		float3 uctbrt2t = float3( lerp( tuctbrt2[1].x, 	tuctbrt2[0].x,	h1), lerp( tuctbrt2[1].y, 	tuctbrt2[0].y, h2), lerp( tuctbrt2[1].z, 	tuctbrt2[0].z, h3) );			
		float3 uctcont = float3( lerp( tuctcon[1].x, 	tuctcon[0].x,	h1), lerp( tuctcon[1].y, 	tuctcon[0].y, h2), lerp( tuctcon[1].z, 	tuctcon[0].z, h3) );			
		float3 uctsatt = float3( lerp( tuctsat[1].x, 	tuctsat[0].x,	h1), lerp( tuctsat[1].y, 	tuctsat[0].y, h2), lerp( tuctsat[1].z, 	tuctsat[0].z, h3) );			
	
		float ctbrt1 = lerp( uctbrt1t.z,lerp( uctbrt1t.y, uctbrt1t.x, hnd ), ji ); 
		float ctbrt2 = lerp( uctbrt2t.z, lerp( uctbrt2t.y, uctbrt2t.x, hnd ), ji ); 
		float ctcon = lerp(  uctcont.z,lerp( uctcont.y, uctcont.x, hnd ), ji ); 
		float ctsat = lerp(  uctsatt.z, lerp( uctsatt.y, uctsatt.x, hnd ),  ji ); 

		float3 ctLumCoeff = float3(0.2125, 0.7154, 0.0721);				
		float3 ctAvgLumin = float3(0.5, 0.5, 0.5);
		float3 ctbrtColor = color.rgb * ctbrt1;

		float3 ctintensity = dot(ctbrtColor, ctLumCoeff);
		float3 ctsatColor = lerp(ctintensity, ctbrtColor, ctsat); 
		float3 cconColor = lerp(ctAvgLumin, ctsatColor, ctcon);

		color.xyz = cconColor * ctbrt2;
		float3 cbalance = lerp(rgbi, ( lerp (rgbn,rgbd, hnd) ), ji);
		color.xyz = cbalance.xyz * color.xyz;
	#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///PRE BLOOM CODE////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
	
#if(PRE_BLOOM == 1)


float mavg;
float3 nsat;
float3 oldcol;
float4 xcolorbloom;

#if(CURVE_BLOOM == 1)
		
		
		
		 xcolorbloom = tex2D( _s3, _v0.xy );
		
		
//++Changes appareance of colors+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		float3 cbgreycn = float3(0.299, 0.587, 0.114);  // perception of color luminace
		//float3 cbgreycn = float3(0.811,0.523,0.996);	// perception of color luminace
		//float3 cbgreycn = float3(0.333,0.333,0.333); 		// screw perception
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		float 	bloomBrightness = lerp( lerp( BloomBrightnessDay, BloomBrightnessNight, JKNightDayFactor), BloomBrightnessInt, JKInteriorFactor);
		float3 	bloomSaturation = lerp( lerp( BloomSaturationDay, BloomSaturationNight, JKNightDayFactor), BloomSaturationInt, JKInteriorFactor);
		float 	bloomContrast = lerp( lerp( BloomContrastDay, BloomContrastNight, JKNightDayFactor), BloomContrastInt, JKInteriorFactor);
		float	bloomThreshold = lerp( lerp( BloomThresholdDay, BloomThresholdNight, JKNightDayFactor), BloomThresholdInt, JKInteriorFactor);
		float 	bloomCurve = lerp( lerp( BloomCurveDay, BloomCurveNight, JKNightDayFactor), BloomCurveInt, JKInteriorFactor);
		float 	bloomavgbr = (color.x+color.y+color.z)/3;
		
		#if(BLOOM_DEFUZZ == 1)
			mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
			xcolorbloom.xyz-=(mavg/3);
			xcolorbloom.xyz+=(mavg*0.2);
			xcolorbloom.xyz*(mavg*1.2);
		#endif
		
		#if(BLOOM_COLORIZATION == 1)
			xcolorbloom.rgb*= lerp( lerp( curvebloommultDay, curvebloommultNight, JKNightDayFactor ), curvebloommultInterior, JKInteriorFactor );
			xcolorbloom.rgb-= lerp( lerp( curvebloomsubDay, curvebloomsubNight, JKNightDayFactor ), curvebloomsubInterior, JKInteriorFactor );
			xcolorbloom.rb*= lerp( lerp( curveMAGENTAbloomDay, curveMAGENTAbloomNight, JKNightDayFactor ), curveMAGENTAbloomInterior, JKInteriorFactor );
			xcolorbloom.gb*= lerp( lerp( curveCYANbloomDay, curveCYANbloomNight, JKNightDayFactor ), curveCYANbloomInterior, JKInteriorFactor );
			xcolorbloom.rg*= lerp( lerp( curveYELLOWbloomDay, curveYELLOWbloomNight, JKNightDayFactor ), curveYELLOWbloomInterior, JKInteriorFactor );
		#endif
		
		float4 bloomncolor = xcolorbloom;
		//remove bloom from dark areas//////////////////////////////////
		bloomncolor = pow(bloomncolor/bloomCurve, bloomThreshold + (bloomncolor*bloomncolor));
		//adjust saturation
		bloomncolor.xyz *= bloomSaturation;
		bloomncolor.xyz += (xcolorbloom.x-(xcolorbloom.x*bloomSaturation.x)) * cbgreycn.x;
		bloomncolor.xyz += (xcolorbloom.y-(xcolorbloom.y*bloomSaturation.y)) * cbgreycn.y;
		bloomncolor.xyz += (xcolorbloom.z-(xcolorbloom.z*bloomSaturation.z)) * cbgreycn.z;
		//adjust brightness/////////////////////////////////////////////
		bloomncolor.xyz	= pow(bloomncolor, 1.0 / max(0.0001, bloomBrightness));
		//adjust contrast///////////////////////////////////////////////
		bloomncolor.xyz	= pow(bloomncolor, bloomContrast) / (pow(saturate(bloomncolor), bloomContrast) + pow(1.0 - saturate(bloomncolor), bloomContrast));		//weird adaptation//////////////////////////////////////////////
		//sharpen///////////////////////////////////////////////////////
		#if( SHARP_MODE == 1)
			bloomncolor = max(0, lerp(0, bloomncolor, saturate(bloomavgbr*2)));
			bloomncolor = max(0, lerp(bloomncolor, 1, saturate(bloomavgbr-0.5)*2));
		#endif
		//mix bloom/////////////////////////////////////////////////////
		#if(BLOOM_LERP == 1)
			color.xyz = lerp( color, bloomncolor, EBloomAmount );
		#endif
		#if(BLOOM_ADD == 1)
			color.xyz += bloomncolor * EBloomAmount;
		#endif
		#if(BLOOM_LERP == 0)
		#if(BLOOM_ADD == 0)
			color.xyz = max(color, bloomncolor * EBloomAmount);
		#endif
		#endif
#endif

#if(ENB_BLOOM == 1)

			float4	enbbloomcol=tex2D(_s3, _v0.xy);


	// DEBUG OUTPUT
	// return enbbloomcol;

	if( enbbloomcol.r + enbbloomcol.g + enbbloomcol.b > 0.0 )
	{
		
		#if(BLOOM_DEFUZZ == 1)
			mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
			xcolorbloom.xyz-=(mavg/3);
			xcolorbloom.xyz+=(mavg*0.2);
			xcolorbloom.xyz*(mavg*1.2);
		#endif
		
		#if(BLOOM_COLORIZATION == 1)
		enbbloomcol.rgb*= lerp( lerp( ENBbloommultDay, ENBbloommultNight, JKNightDayFactor ), ENBbloommultInterior, JKInteriorFactor );
		enbbloomcol.rgb-= lerp( lerp( ENBbloomsubDay, ENBbloomsubNight, JKNightDayFactor ), ENBbloomsubInterior, JKInteriorFactor );
		enbbloomcol.rb*= lerp( lerp( ENBMAGENTAbloomDay, ENBMAGENTAbloomNight, JKNightDayFactor ), ENBMAGENTAbloomInterior, JKInteriorFactor );
		enbbloomcol.gb*= lerp( lerp( ENBCYANbloomDay, ENBCYANbloomNight, JKNightDayFactor ), ENBCYANbloomInterior, JKInteriorFactor );
		enbbloomcol.rg*= lerp( lerp( ENBYELLOWbloomDay, ENBYELLOWbloomNight, JKNightDayFactor ), ENBYELLOWbloomInterior, JKInteriorFactor );
		#endif
		
		float fBloomSaturationSmooth =lerp( lerp( fBloomSaturationSmoothDay, fBloomSaturationSmoothNight, JKNightDayFactor ), fBloomSaturationSmoothInterior, JKInteriorFactor );
		float fBloomSaturationCurve =lerp( lerp( fBloomSaturationCurveDay, fBloomSaturationCurveNight, JKNightDayFactor ), fBloomSaturationCurveInterior, JKInteriorFactor );
		float fBloomSaturationMult =lerp( lerp( fBloomSaturationMultDay, fBloomSaturationMultNight, JKNightDayFactor ), fBloomSaturationMultInterior, JKInteriorFactor );

		float fBloomIntensitySmooth =lerp( lerp( fBloomIntensitySmoothDay, fBloomIntensitySmoothNight, JKNightDayFactor ), fBloomIntensitySmoothInterior, JKInteriorFactor );
		float fBloomIntensityCurve =lerp( lerp( fBloomIntensityCurveDay, fBloomIntensityCurveNight, JKNightDayFactor ), fBloomIntensityCurveInterior, JKInteriorFactor );
		float fBloomIntensityMult =lerp( lerp( fBloomIntensityMultDay, fBloomIntensityMultNight, JKNightDayFactor ), fBloomIntensityMultInterior, JKInteriorFactor );
		float fBloomIntensityMod =lerp( lerp( fBloomIntensityModDay, fBloomIntensityModNight, JKNightDayFactor ), fBloomIntensityModInterior, JKInteriorFactor );
		float fBloomIntensityMax =lerp( lerp( fBloomIntensityMaxDay, fBloomIntensityMaxNight, JKNightDayFactor ), fBloomIntensityMaxInterior, JKInteriorFactor );

		float3 bloomhsv = RGBtoHSV( enbbloomcol.rgb );
		bloomhsv.y = lerp( bloomhsv.y, smoothstep( 0.0, 1.0, bloomhsv.y ), fBloomSaturationSmooth );
		bloomhsv.y = pow( bloomhsv.y, fBloomSaturationCurve );
		bloomhsv.y *= fBloomSaturationMult;
		bloomhsv.z = lerp( bloomhsv.z, smoothstep( 0.0, 1.0, bloomhsv.z ), fBloomIntensitySmooth );
		bloomhsv.z = pow( bloomhsv.z, fBloomIntensityCurve );
		bloomhsv.z *= fBloomIntensityMult;
		bloomhsv.z += fBloomIntensityMod;
		bloomhsv.z = clamp( bloomhsv.z, 0.0, fBloomIntensityMax );
		enbbloomcol.rgb = HSVtoRGB( bloomhsv );

		#if(BLOOM_LERP == 1)
		color.rgb = lerp( color.rgb, enbbloomcol.rgb, EBloomAmount );
		#endif
		#if(BLOOM_ADD == 1)
		color.rgb += enbbloomcol.rgb * EBloomAmount;
		#endif
		#if(BLOOM_LERP == 0)
		#if(BLOOM_ADD == 0)
		color.rgb = max(color.xyz, enbbloomcol.xyz * EBloomAmount);
		#endif
		#endif
				
	}
	#endif
	
	
#if(DIFFUSE_BLOOM == 1)

	
		 xcolorbloom = tex2D( _s3, _v0.xy );

		
	#if(BLOOM_DEFUZZ == 1)
		// Heliosdouble cobbled together bloom defuzzer - increases contrast of bloom / stop it hazing low brightness values
		// modulated by the overall brightness of the screen.

		mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
		xcolorbloom.xyz-=(mavg/3);
		//xcolorbloom.xyz=min(xcolorbloom.xyz,0.0);
		xcolorbloom.xyz+=(mavg*0.2);
		xcolorbloom.xyz*(mavg*1.2);
	#endif
		
	#if( BLOOM_COLORIZATION == 1)
		xcolorbloom.xyz*= lerp( lerp( diffbloommultDay, diffbloommultNight, JKNightDayFactor ), diffbloommultInterior, JKInteriorFactor );
		xcolorbloom.xyz-= lerp( lerp( diffbloomsubDay, diffbloomsubNight, JKNightDayFactor ), diffbloomsubInterior, JKInteriorFactor );
		xcolorbloom.xz*= lerp( lerp( diffMAGENTAbloomDay, diffMAGENTAbloomNight, JKNightDayFactor ), diffMAGENTAbloomInterior, JKInteriorFactor );
		xcolorbloom.yz*= lerp( lerp( diffCYANbloomDay, diffCYANbloomNight, JKNightDayFactor ), diffCYANbloomInterior, JKInteriorFactor );
		xcolorbloom.xy*= lerp( lerp( diffYELLOWbloomDay, diffYELLOWbloomNight, JKNightDayFactor ), diffYELLOWbloomInterior, JKInteriorFactor );
	#endif
		float Saturation = lerp( lerp( SatDay, SatNight, JKNightDayFactor ), SatInterior, JKInteriorFactor );
		float Luma = lerp( lerp( LumaDay, LumaNight, JKNightDayFactor ), LumaInterior, JKInteriorFactor );
		float Pow = lerp( lerp( PowDay, PowNight, JKNightDayFactor ), PowInterior, JKInteriorFactor );
		float Pow2 = lerp( lerp( Pow2Day, Pow2Night, JKNightDayFactor ), Pow2Interior, JKInteriorFactor );

		float3 cgray2=dot(xcolorbloom.xyz, Luma);
		float3 poweredcolor2=pow(xcolorbloom.xyz, Saturation);
		float newgray2=dot(poweredcolor2.xyz, Pow);
		xcolorbloom.xyz=poweredcolor2.xyz*cgray2/(newgray2+Pow2);
		
		color.xyz+=xcolorbloom.xyz*EBloomAmount;
	
	#if( BLOOM_LERP == 1)
		color.xyz = lerp( color.xyz, xcolorbloom.xyz, EBloomAmount );
	#endif
	#if( BLOOM_ADD == 1)
		color.xyz += xcolorbloom.xyz * EBloomAmount;
	#endif
	#if(BLOOM_LERP == 0)
	#if(BLOOM_ADD == 0)
		color.xyz =max(color.xyz, xcolorbloom.xyz*EBloomAmount);
	#endif
	#endif
#endif

#if( HD6_BLOOM_CRISP == 1)

		
		 xcolorbloom = tex2D( _s3, _v0.xy );
	
		
			float3 LumCoeff = lerp( LumCoeffInterior, ( lerp( LumCoeffNight, LumCoeffDay,  JKNightDayFactor ) ), JKInteriorFactor);			
			float3 AvgLumin = lerp( AvgLuminInterior, ( lerp( AvgLuminNight, AvgLuminDay,  JKNightDayFactor ) ), JKInteriorFactor);	
			
		#if( BLOOM_DEFUZZ == 1)
		mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
		xcolorbloom.xyz-=(mavg/3);
		xcolorbloom.xyz+=(mavg*0.2);
		xcolorbloom.xyz*(mavg*1.2);
		#endif
			
		#if( BLOOM_COLORIZATION == 1)
			xcolorbloom.rgb*= lerp( lerp( crispbloommultDay, crispbloommultNight, JKNightDayFactor ), crispbloommultInterior, JKInteriorFactor );
			xcolorbloom.rgb-= lerp( lerp( crispbloomsubDay, crispbloomsubNight, JKNightDayFactor ), crispbloomsubInterior, JKInteriorFactor );

			xcolorbloom.rb*= lerp( lerp( crispMAGENTAbloomDay, crispMAGENTAbloomNight, JKNightDayFactor ), crispMAGENTAbloomInterior, JKInteriorFactor );
			xcolorbloom.gb*= lerp( lerp( crispCYANbloomDay, crispCYANbloomNight, JKNightDayFactor ), crispCYANbloomInterior, JKInteriorFactor );
			xcolorbloom.rg*= lerp( lerp( crispYELLOWbloomDay, crispYELLOWbloomNight, JKNightDayFactor ), crispYELLOWbloomInterior, JKInteriorFactor );
		#endif
			
			// Limits what triggers a bloom
			float3 brightbloom = xcolorbloom - lerp( TrigInterior, ( lerp( TrigNight, TrigDay,  JKNightDayFactor ) ), JKInteriorFactor);
				brightbloom = max( brightbloom , 0);

			// Limits bloom to superbright spots only
			float3 superbright = xcolorbloom - lerp( SBrightInterior, ( lerp( SBrightNight, SBrightDay,  JKNightDayFactor ) ), JKInteriorFactor);
				superbright = max( superbright , 0 ) ; // crop so dont go any lower than black
				//superbright = lerp( AvgLumin, superbright, 0.5); // Contrast
				superbright *= 0.6;		
			
			// Bloom - Brightness, Contrast and Saturation
			float3 brt = lerp( CBrightnessInterior, ( lerp( CBrightnessNight, CBrightnessDay,   JKNightDayFactor ) ), JKInteriorFactor);
			float3 con = lerp( CContrastInterior, ( lerp( CContrastNight, CContrastDay,   JKNightDayFactor ) ), JKInteriorFactor);
			float3 sat = lerp( CSaturationInterior, ( lerp( CSaturationNight, CSaturationDay,   JKNightDayFactor ) ), JKInteriorFactor);
				float3 brtColor = brightbloom * brt;
				float3 cintensity = dot( brtColor, LumCoeff );
				float3 satColor = lerp( cintensity, brtColor, sat ); 
				float3 conColor = lerp( AvgLumin, satColor, con );
				conColor -= 0.3;
				brightbloom = conColor;

			// These values compensates the brightness when no bloom is used
			color.xyz +=  lerp( BrightnessModInterior, ( lerp( BrightnessModNight, BrightnessModDay, JKNightDayFactor ) ), JKInteriorFactor);
			color.xyz *= lerp( BrightnessMultInterior, ( lerp( BrightnessMultNight, BrightnessMultDay, JKNightDayFactor ) ), JKInteriorFactor);

			// Adds bloom while compensating for any brightness change
			color.xyz += (( superbright * hbs ) * lerp( CompSBInterior, ( lerp( CompSBNight, CompSBDay,  JKNightDayFactor ) ), JKInteriorFactor)); // Limits where the bloom will "bloom"
			brightbloom -= ( superbright * 2 ); // removes superbright from brightbloom
			brightbloom = max( brightbloom , 0.0 );
			color.xyz += (( brightbloom * hbs ) * lerp( BloomStrInterior, ( lerp( BloomStrNight, BloomStrDay,  JKNightDayFactor ) ), JKInteriorFactor)); // How strong the bloom will be

			// This blends the the ENB and Skyrim bloom together, for a more hazey effect
			color.xyz += (xcolorbloom.xyz * hbs) * lerp( BloomBlendInterior, ( lerp( BloomBlendNight, BloomBlendDay,  JKNightDayFactor ) ), JKInteriorFactor); // How much the blend there will be
			color.xyz *= lerp( BlendCompInterior, ( lerp( BlendCompNight, BlendCompDay,  JKNightDayFactor ) ), JKInteriorFactor); // compensate for brightening caused by above bloom

#endif

#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///HSV COLOR CODE////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

	#if( HSV_CONTROLS == 1)
	float fColorHueSmooth =lerp( lerp( fColorHueSmoothDay, fColorHueSmoothNight, JKNightDayFactor ), fColorHueSmoothInterior, JKInteriorFactor );
	float fColorSaturationSmooth =lerp( lerp( fColorSaturationSmoothDay, fColorSaturationSmoothNight, JKNightDayFactor ), fColorSaturationSmoothInterior, JKInteriorFactor );
	float fColorIntensitySmooth =lerp( lerp( fColorIntensitySmoothDay, fColorIntensitySmoothNight, JKNightDayFactor ), fColorIntensitySmoothInterior, JKInteriorFactor );

	float fColorHueCurve =lerp( lerp( fColorHueCurveDay, fColorHueCurveNight, JKNightDayFactor ), fColorHueCurveInterior, JKInteriorFactor );
	float fColorSaturationCurve =lerp( lerp( fColorSaturationCurveDay, fColorSaturationCurveNight, JKNightDayFactor ), fColorSaturationCurveInterior, JKInteriorFactor );
	float fColorIntensityCurve =lerp( lerp( fColorIntensityCurveDay, fColorIntensityCurveNight, JKNightDayFactor ), fColorIntensityCurveInterior, JKInteriorFactor );

	float fColorHueMult =lerp( lerp( fColorHueMultDay, fColorHueMultNight, JKNightDayFactor ), fColorHueMultInterior, 1.0 - JKInteriorFactor );
	float fColorSaturationMult =lerp( lerp( fColorSaturationMultDay, fColorSaturationMultNight, JKNightDayFactor ), fColorSaturationMultInterior, JKInteriorFactor );
	float fColorIntensityMult =lerp( lerp( fColorIntensityMultDay, fColorIntensityMultNight, JKNightDayFactor ), fColorIntensityMultInterior, JKInteriorFactor );

	float fColorHueMod =lerp( lerp( fColorHueModDay, fColorHueModNight, JKNightDayFactor ), fColorHueModInterior, JKInteriorFactor );
	float fColorSaturationMod =lerp( lerp( fColorSaturationModDay, fColorSaturationModNight, JKNightDayFactor ), fColorSaturationModInterior, JKInteriorFactor );
	float fColorIntensityMod =lerp( lerp( fColorIntensityModDay, fColorIntensityModNight, JKNightDayFactor ), fColorIntensityModInterior, JKInteriorFactor );

		float3 hsvcolor = RGBtoHSV( color.xyz );
		hsvcolor.x = lerp( hsvcolor.x, smoothstep( 0.0, 1.0, hsvcolor.x ), fColorHueSmooth );
		hsvcolor.y = lerp( hsvcolor.y, smoothstep( 0.0, 1.0, hsvcolor.y ), fColorSaturationSmooth );
		hsvcolor.z = lerp( hsvcolor.z, smoothstep( 0.0, 1.0, hsvcolor.z ), fColorIntensitySmooth );
		hsvcolor.x = pow( hsvcolor.x, fColorHueCurve );
		hsvcolor.y = pow( hsvcolor.y, fColorSaturationCurve );
		hsvcolor.z = pow( hsvcolor.z, fColorIntensityCurve );
		hsvcolor.x = fColorHueMod + ( fColorHueMult * hsvcolor.x );
		hsvcolor.y = fColorSaturationMod + ( fColorSaturationMult * hsvcolor.y );
		hsvcolor.z = fColorIntensityMod + ( fColorIntensityMult * hsvcolor.z );

	#if( HSV_EQUALIZER == 1)
		hsvcolor.y = ColorEqualizerMod( hsvcolor.x, JKNightDayFactor, JKInteriorFactor ) + ( ColorEqualizerMult( hsvcolor.x, JKNightDayFactor, JKInteriorFactor ) * hsvcolor.y );
	#endif
	
		color.xyz = HSVtoRGB( hsvcolor );
	#endif

	#if( COLOR_FILTER == 1)
		float3 EColorFilter =lerp( lerp( EColorFilterDay, EColorFilterNight, JKNightDayFactor ), EColorFilterInterior, JKInteriorFactor );
	
		EColorFilter.xyz-= lerp( lerp( EColorFilterSubDay, EColorFilterSubNight, JKNightDayFactor ), EColorFilterSubInterior, JKInteriorFactor );

		EColorFilter.xz*= lerp( lerp( MAGENTADay, MAGENTANight, JKNightDayFactor ), MAGENTAInterior, JKInteriorFactor );
		EColorFilter.yz*= lerp( lerp( CYANDay, CYANNight, JKNightDayFactor ), CYANInterior, JKInteriorFactor );
		EColorFilter.xy*= lerp( lerp( YELLOWDay, YELLOWNight, JKNightDayFactor ), YELLOWInterior, JKInteriorFactor );

		EColorFilter.xz-= lerp( lerp( MAGENTAsubDay, MAGENTAsubNight, JKNightDayFactor ), MAGENTAsubInterior, JKInteriorFactor );
		EColorFilter.yz-= lerp( lerp( CYANsubDay, CYANsubNight, JKNightDayFactor ), CYANsubInterior, JKInteriorFactor );
		EColorFilter.xy-= lerp( lerp( YELLOWsubDay, YELLOWsubNight, JKNightDayFactor ), YELLOWsubInterior, JKInteriorFactor );

		color.xyz*=EColorFilter;
	#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///BLEACH BYPASS CODE////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
	
#if(BLEACH_BYPASS == 1)
	float3 	bleachBypassAmountRGB 	= lerp( lerp( BleachBypassAmountRGBDay, BleachBypassAmountRGBNight, JKNightDayFactor), BleachBypassAmountRGBInt, JKInteriorFactor);
    
	float lum 		= saturate(Luminance(color.xyz));
    float L 		= min(1,max(0,10*(lum- 0.45)));
    float3 result1 	= 2.0f * color.rgb * L;
    float3 result2 	= 1.0f - 2.0f*(1.0f-L)*(1.0f-color.rgb);
    float3 newColor = lerp(result1,result2,L);
    color.rgb		= lerp(color.rgb, newColor.rgb, bleachBypassAmountRGB.rgb);
#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///VIGNETTE CODE/////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

#if( HD6_VIGNETTE == 1)
		// yes this is my own crazy creation after seing how boring the usual linear circle vignettes typically are
		// no doubt I have done it in an overly convoluted way :-)

		//float fExposureLevel = 1.0; // compensate for any change from vignette so center is same brightness
		float2 inTex = _v0;	
		float4 voriginal = r1;
		float4 vcolor = voriginal;
		vcolor.xyz=1;
		inTex -= 0.5; // Centers vignette
		inTex.y += 0.01; // Move it off center and up so it obscures sky less
		float vignette = 1.0 - dot( inTex, inTex );
		vcolor *= pow( vignette, vignettepow );

		// Round Vignette
		float4 rvigtex = vcolor;
		rvigtex.xyz = pow( vcolor, 1 );
		rvigtex.xyz = lerp(float3(0.5, 0.5, 0.5), rvigtex.xyz, 2.0); // Increase Contrast
		rvigtex.xyz = lerp(float3(1,1,1),rvigtex.xyz,rovigpwr); // Set strength of round vignette

		// Square Vignette (just top and bottom of screen)
		float4 vigtex = vcolor;
		vcolor.xyz = float3(1,1,1);
		float3 topv = min((inTex.y+0.5)*2,0.5) * 2; // Top vignette
		float3 botv = min(((0-inTex.y)+0.5)*2,0.5) * 2; // Bottom vignette

		topv= lerp(float3(1,1,1), topv, sqvigpwr.x);
		botv= lerp(float3(1,1,1), botv, sqvigpwr.y);
		vigtex.xyz = (topv)*(botv);

		//vigtex.xyz = lerp(float3(1,1,1),vigtex.xyz,sqvigpwr); // Set strength of square vignette

		// Add round and square together
		vigtex.xyz*=rvigtex.xyz; 
		float3 nvigtex = lerp(vigtex.xyz,1,(1-vstrengthinterior)*(1-ji)); // Alter Strength at night
		vigtex.xyz = lerp(vigtex.xyz,1,(1-vstrengthatnight)*(1-vhnd)); // Alter Strength at night
		
		vigtex.xyz = lerp(vigtex.xyz, nvigtex.xyz, 1-ji);
		
			vigtex.xyz = min(vigtex.xyz,1);
			vigtex.xyz = max(vigtex.xyz,0);
			//vigtex.xyz -= 0.5;
			//(base < 0.5 ? (2.0 * base * blend) : (1.0 - 2.0 * (1.0 - base) * (1.0 - blend)))
			//vigtex.xyz = vigtex.xyz < 0.5 ? (2.0 * color.xyz * vigtex.xyz) : (1 - 2 * (1 - color.xyz) * (1 - vigtex.xyz));
			// Crap I keep forgetting overlay mode doesnt work in floating point/32bit/hdr dur bee durr

		// Increase saturation where edges were darkenned
		float3 vtintensity = dot(color.xyz, float3(0.2125, 0.7154, 0.0721));
		color.xyz = lerp(vtintensity, color.xyz, ((((1-(vigtex.xyz*2))+2)-1)*vsatstrength)+1  );

			//color.xyz+=0.02;
		color.xyz *= (vigtex.xyz);
			//color.xyz *= fExposureLevel;	

	#endif
	
		#if( MT_VIGNETTE == 1)
		float2 fVignetteCenter =lerp( lerp( fVignetteCenterDay, fVignetteCenterNight, JKNightDayFactor ), fVignetteCenterInterior, JKInteriorFactor );
		float2 fVignetteScale =lerp( lerp( fVignetteScaleDay, fVignetteScaleNight, JKNightDayFactor ), fVignetteScaleInterior, JKInteriorFactor );
		float fVignetteRadius =lerp( lerp( fVignetteRadiusDay, fVignetteRadiusNight, JKNightDayFactor ), fVignetteRadiusInterior, JKInteriorFactor );
		float fVignetteSharpness =lerp( lerp( fVignetteSharpnessDay, fVignetteSharpnessNight, JKNightDayFactor ), fVignetteSharpnessInterior, JKInteriorFactor );
		float fVignetteCurve =lerp( lerp( fVignetteCurveDay, fVignetteCurveNight, JKNightDayFactor ), fVignetteCurveInterior, JKInteriorFactor );

	float2 VignettePosition = ( _v0.xy - fVignetteCenter ) * float2( ScreenSize.z, 1.0 );
	VignettePosition /= fVignetteScale;
	float VignetteDistance = distance( VignettePosition, float2(0.0 , 0.0) );
	float VignetteEffect = max( 0.0, ( VignetteDistance - fVignetteRadius ) * fVignetteSharpness * 50.0 );
	color.rgb *= max( 0.0, min( 1.0, 1.0 - pow( VignetteEffect, fVignetteCurve ) ) );
	#endif
	
	
/////////////////////////////////////////////////////////////////////////////////////////////////
///POSTPROCESSING METHODS////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////	


	
	//Post Processing 0 by JawZ//////////////////////////////////////////////////////////////////
	
	#if (POSTPROCESS==0)	

		float EBrightnessV0 = lerp( lerp( EBrightnessV0Day, EBrightnessV0Night, JKNightDayFactor ), EBrightnessV0Interior, JKInteriorFactor );
		float EContrastV0 =lerp( lerp( EContrastV0Day, EContrastV0Night, JKNightDayFactor ), EContrastV0Interior, JKInteriorFactor );
		float EColorSaturationV0 =lerp( lerp( EColorSaturationV0Day, EColorSaturationV0Night, JKNightDayFactor ), EColorSaturationV0Interior, JKInteriorFactor );
	#if( ENABLE_TONEMAPPING == 1)
		float EToneMappingCurveV0 =lerp( lerp( EToneMappingCurveV0Day, EToneMappingCurveV0Night, JKNightDayFactor ), EToneMappingCurveV0Interior, JKInteriorFactor );
	#endif
		color.xyz*=(EBrightnessV0);
		float cgray=dot(color.xyz, float3(0.27, 0.67, 0.06));
		cgray=pow(cgray, EContrastV0);
		float3 poweredcolor=pow(color.xyz, EColorSaturationV0);
		float newgray=dot(poweredcolor.xyz, float3(0.27, 0.67, 0.06));
		color.xyz=poweredcolor.xyz*cgray/(newgray+0.0001);
	#if( ENABLE_TONEMAPPING == 1)
		float3	luma=color.xyz;
		float	lumamax=300.0;
		color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV0);
	 #endif
	#endif
	
//Post Processing 1 by ENB//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==1)

	float EAdaptationMinV1 =lerp( lerp( EAdaptationMinV1Day, EAdaptationMinV1Night, JKNightDayFactor ), EAdaptationMinV1Interior, JKInteriorFactor );
	float EAdaptationMaxV1 =lerp( lerp( EAdaptationMaxV1Day, EAdaptationMaxV1Night, JKNightDayFactor ), EAdaptationMaxV1Interior, JKInteriorFactor );
	float EContrastV1 =lerp( lerp( EContrastV1Day, EContrastV1Night, JKNightDayFactor ), EContrastV1Interior, JKInteriorFactor );
	float EColorSaturationV1 =lerp( lerp( EColorSaturationV1Day, EColorSaturationV1Night, JKNightDayFactor ), EColorSaturationV1Interior, JKInteriorFactor );
	float EToneMappingCurveV1 =lerp( lerp( EToneMappingCurveV1Day, EToneMappingCurveV1Night, JKNightDayFactor ), EToneMappingCurveV1Interior, JKInteriorFactor );

		grayadaptation=max(grayadaptation, 0.0);
		grayadaptation=min(grayadaptation, 50.0);
		color.xyz=color.xyz/(grayadaptation*EAdaptationMaxV1+EAdaptationMinV1);//*tempF1.x

		float cgray=dot(color.xyz, float3(0.27, 0.67, 0.06));
		cgray=pow(cgray, EContrastV1);
		float3 poweredcolor=pow(color.xyz, EColorSaturationV1);
		float newgray=dot(poweredcolor.xyz, float3(0.27, 0.67, 0.06));
		color.xyz=poweredcolor.xyz*cgray/(newgray+0.0001);

		float3	luma=color.xyz;
		float	lumamax=300.0;
		color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV1);
	#endif
	
//Post Processing 2 by ENB modified by JawZ//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==2)

	float EAdaptationMaxV2 =lerp( lerp( EAdaptationMaxV2Day, EAdaptationMaxV2Night, JKNightDayFactor ), EAdaptationMaxV2Interior, JKInteriorFactor );
	float EAdaptationMinV2 =lerp( lerp( EAdaptationMinV2Day, EAdaptationMinV2Night, JKNightDayFactor ), EAdaptationMinV2Interior, JKInteriorFactor );
	float EBrightnessV2 = lerp( lerp( EBrightnessV2Day, EBrightnessV2Night, JKNightDayFactor ), EBrightnessV2Interior, JKInteriorFactor );
	float EIntensityContrastV2 =lerp( lerp( EIntensityContrastV2Day, EIntensityContrastV2Night, JKNightDayFactor ), EIntensityContrastV2Interior, JKInteriorFactor );
	float EColorSaturationV2 =lerp( lerp( EColorSaturationV2Day, EColorSaturationV2Night, JKNightDayFactor ), EColorSaturationV2Interior, JKInteriorFactor );
	float EBrightnessCurveV2 = lerp( lerp( EBrightnessCurveV2Day, EBrightnessCurveV2Night, JKNightDayFactor ), EBrightnessCurveV2Interior, JKInteriorFactor );
	float EBrightnessPostCurveV2 = lerp( lerp( EBrightnessPostCurveV2Day, EBrightnessPostCurveV2Night, JKNightDayFactor ), EBrightnessPostCurveV2Interior, JKInteriorFactor );
	float EToneMappingCurveV2 =lerp( lerp( EToneMappingCurveV2Day, EToneMappingCurveV2Night, JKNightDayFactor ), EToneMappingCurveV2Interior, JKInteriorFactor );
	float EToneMappingOversaturationV2 =lerp( lerp( EToneMappingOversaturationV2Day, EToneMappingOversaturationV2Night, JKNightDayFactor ), EToneMappingOversaturationV2Interior, JKInteriorFactor );

		grayadaptation=max(grayadaptation, 0.0);
		grayadaptation=min(grayadaptation, 50.0);
		color.xyz=color.xyz/(grayadaptation*EAdaptationMaxV2+EAdaptationMinV2);//*tempF1.x

		color.xyz*=(EBrightnessV2);
		color.xyz+=0.000001;
		float3 xncol=normalize(color.xyz);
		float3 scl=color.xyz/xncol.xyz;
		scl=pow(scl, EIntensityContrastV2);
		xncol.xyz=pow(xncol.xyz, EColorSaturationV2);
		color.xyz=scl*xncol.xyz;
		color.xyz=pow(color.xyz, EBrightnessCurveV2);
		color.xyz*=(EBrightnessPostCurveV2);

		float	lumamax=EToneMappingOversaturationV2;
		color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV2);
	#endif
	
//Post Processing 3 by ENB//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==3)

	float EAdaptationMaxV3 =lerp( lerp( EAdaptationMaxV3Day, EAdaptationMaxV3Night, JKNightDayFactor ), EAdaptationMaxV3Interior, JKInteriorFactor );
	float EAdaptationMinV3 =lerp( lerp( EAdaptationMinV3Day, EAdaptationMinV3Night, JKNightDayFactor ), EAdaptationMinV3Interior, JKInteriorFactor );
	float EToneMappingOversaturationV3 =lerp( lerp( EToneMappingOversaturationV3Day, EToneMappingOversaturationV3Night, JKNightDayFactor ), EToneMappingOversaturationV3Interior, JKInteriorFactor );
	float EToneMappingCurveV3 =lerp( lerp( EToneMappingCurveV3Day, EToneMappingCurveV3Night, JKNightDayFactor ), EToneMappingCurveV3Interior, JKInteriorFactor );

		grayadaptation=max(grayadaptation, 0.0);
		grayadaptation=min(grayadaptation, 50.0);
		color.xyz=color.xyz/(grayadaptation*EAdaptationMaxV3+EAdaptationMinV3);//*tempF1.x

		float	lumamax=EToneMappingOversaturationV3;
		color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV3);

	#endif
	
//Post Processing 4 by ENB//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==4)

	float EAdaptationMaxV4 =lerp( lerp( EAdaptationMaxV4Day, EAdaptationMaxV4Night, JKNightDayFactor ), EAdaptationMaxV4Interior, JKInteriorFactor );
	float EAdaptationMinV4 =lerp( lerp( EAdaptationMinV4Day, EAdaptationMinV4Night, JKNightDayFactor ), EAdaptationMinV4Interior, JKInteriorFactor );
	float EBrightnessCurveV4 =lerp( lerp( EBrightnessCurveV4Day, EBrightnessCurveV4Night, JKNightDayFactor ), EBrightnessCurveV4Interior, JKInteriorFactor );
	float EBrightnessMultiplierV4 =lerp( lerp( EBrightnessMultiplierV4Day, EBrightnessMultiplierV4Night, JKNightDayFactor ), EBrightnessMultiplierV4Interior, JKInteriorFactor );
	float EBrightnessToneMappingCurveV4 =lerp( lerp( EBrightnessToneMappingCurveV4Day, EBrightnessToneMappingCurveV4Night, JKNightDayFactor ), EBrightnessToneMappingCurveV4Interior, JKInteriorFactor );

		grayadaptation=max(grayadaptation, 0.0);
		grayadaptation=min(grayadaptation, 50.0);
		color.xyz=color.xyz/(grayadaptation*EAdaptationMaxV4+EAdaptationMinV4);

		float Y = dot(color.xyz, float3(0.299, 0.587, 0.114)); //0.299 * R + 0.587 * G + 0.114 * B;
		float U = dot(color.xyz, float3(-0.14713, -0.28886, 0.436)); //-0.14713 * R - 0.28886 * G + 0.436 * B;
		float V = dot(color.xyz, float3(0.615, -0.51499, -0.10001)); //0.615 * R - 0.51499 * G - 0.10001 * B;
		Y=pow(Y, EBrightnessCurveV4);
		Y=Y*EBrightnessMultiplierV4;
	//	Y=Y/(Y+EBrightnessToneMappingCurveV4);
	//	float	desaturatefact=saturate(Y*Y*Y*1.7);
	//	U=lerp(U, 0.0, desaturatefact);
	//	V=lerp(V, 0.0, desaturatefact);
		color.xyz=V * float3(1.13983, -0.58060, 0.0) + U * float3(0.0, -0.39465, 2.03211) + Y;

		color.xyz=max(color.xyz, 0.0);
		color.xyz=color.xyz/(color.xyz+EBrightnessToneMappingCurveV4);
	#endif
	
//Post Processing 5 by HD6 modified by JawZ//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==5)

//	float EBrightnessV5 =lerp( lerp( EBrightnessV5Day, EBrightnessV5Night, JKNightDayFactor ), EBrightnessV5Interior, JKInteriorFactor );
	float EIntensityContrastV5 =lerp( lerp( EIntensityContrastV5Day, EIntensityContrastV5Night, JKNightDayFactor ), EIntensityContrastV5Interior, JKInteriorFactor );
	float EColorSaturationV5 =lerp( lerp( EColorSaturationV5Day, EColorSaturationV5Night, JKNightDayFactor ), EColorSaturationV5Interior, JKInteriorFactor );
	float HCompensateSatV5 =lerp( lerp( HCompensateSatV5Day, HCompensateSatV5Night, JKNightDayFactor ), HCompensateSatV5Interior, JKInteriorFactor );
	float EToneMappingCurveV5 =lerp( lerp( EToneMappingCurveV5Day, EToneMappingCurveV5Night, JKNightDayFactor ), EToneMappingCurveV5Interior, JKInteriorFactor );

		grayadaptation=max(grayadaptation, 0.0);
		grayadaptation=min(grayadaptation, 50.0);
		//color.xyz=color.xyz/(grayadaptation*EAdaptationMaxV5+EAdaptationMinV5); //*tempF1.x // JZ - This is the original dynamic adaptation code.	
		color.xyz*=lerp( lerp( JKNightDayFactortweak.x, JKNightDayFactortweak.y, JKNightDayFactor ), JKNightDayFactortweak.z, JKInteriorFactor );

		//color.xyz*=EBrightnessV5; // JZ - If you want to have a assigned brightness command to PP5
		//color.xyz+=0.000001;
		float3 xncol=normalize(color.xyz);
		float3 scl=color.xyz/xncol.xyz;
		scl=pow(scl, EIntensityContrastV5);
		xncol.xyz=pow(xncol.xyz, EColorSaturationV5);
		color.xyz=scl*xncol.xyz;
		color.xyz*=HCompensateSatV5; // compensate for darkening caused my EcolorSat above

		//float	lumamax=EToneMappingOversaturationV5;
		//color.xyz=(color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV5);

		color.xyz=color.xyz/(color.xyz + EToneMappingCurveV5);
		//color.xyz=tex2D(_s0, _v0.xy);
		//color.xyz=color.xyz-0.03; // JZ - Try using either *, + or / instead of -
		//color.xyz/=10; // JZ - Try using either *, + or - instead of / and set it to 0.1
	#endif
	
//Post Processing 6 by Kermles//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==6)
	
		//hd6/ppv2///////////////////////////////////////////
		float 	EIntensityContrastV6 		= lerp( lerp( EIntensityContrastV6Day, EIntensityContrastV6Night, JKNightDayFactor), EIntensityContrastV6Interior, JKInteriorFactor );
		float 	EColorSaturationV6 			= lerp( lerp( EColorSaturationV6Day, EColorSaturationV6Night, JKNightDayFactor), EColorSaturationV6Interior, JKInteriorFactor );
		float 	EToneMappingCurveV6 		= lerp( lerp( EToneMappingCurveV6Day, EToneMappingCurveV6Night, JKNightDayFactor), EToneMappingCurveV6Interior, JKInteriorFactor );
		float 	EBrightnessV6 				= lerp( lerp( EBrightnessV6Day, EBrightnessV6Night, JKNightDayFactor), EBrightnessV6Interior, JKInteriorFactor );
		float 	EToneMappingOversaturationV6= lerp( lerp( EToneMappingOversaturationV6Day, EToneMappingOversaturationV6Night, JKNightDayFactor), EToneMappingOversaturationV6Interior, JKInteriorFactor );
		float 	EAdaptationMaxV6 			= lerp( lerp( EAdaptationMaxV6Day, EAdaptationMaxV6Night, JKNightDayFactor ), EAdaptationMaxV6Interior, JKInteriorFactor );
		float 	EAdaptationMinV6 			= lerp( lerp( EAdaptationMinV6Day, EAdaptationMinV6Night, JKNightDayFactor ), EAdaptationMinV6Interior, JKInteriorFactor );
		float	lumamax 					= EToneMappingOversaturationV6;
		float3  xncol;
		float3  scl;
		//kermles////////////////////////////////////////////
		float3 	moodColor 					= float3(lerp( lerp( EMoodColorDay.x, EMoodColorNight.x, JKNightDayFactor), EMoodColorInt.x, JKInteriorFactor), lerp( lerp( EMoodColorDay.y, EMoodColorNight.y, JKNightDayFactor), EMoodColorInt.y, JKInteriorFactor),lerp( lerp( EMoodColorDay.z, EMoodColorNight.z, JKNightDayFactor), EMoodColorInt.z, JKInteriorFactor));
		float 	moodAmount 					= lerp( lerp( EMoodAmountDay, EMoodAmountNight, JKNightDayFactor), EMoodAmountInt, JKInteriorFactor);
		float 	moodThreshold 				= lerp( lerp( EMoodThresholdDay, EMoodThresholdNight, JKNightDayFactor), EMoodThresholdInt, JKInteriorFactor);
		float 	moodCurve 					= lerp( lerp( EMoodCurveDay, EMoodCurveNight, JKNightDayFactor), EMoodCurveInt, JKInteriorFactor);
		float3 	shadowColor 				= float3(lerp( lerp( EShadowColorDay.x, EShadowColorNight.x, JKNightDayFactor), EShadowColorInt.x, JKInteriorFactor), lerp( lerp( EShadowColorDay.y, EShadowColorNight.y, JKNightDayFactor), EShadowColorInt.y, JKInteriorFactor),lerp( lerp( EShadowColorDay.z, EShadowColorNight.z, JKNightDayFactor), EShadowColorInt.z, JKInteriorFactor));
		float 	shadowThreshold 			= lerp( lerp( EShadowThresholdDay, EShadowThresholdNight, JKNightDayFactor), EShadowThresholdInt, JKInteriorFactor);
		float 	shadowAmount 				= lerp( lerp( EShadowAmountDay, EShadowAmountNight, JKNightDayFactor), EShadowAmountInt, JKInteriorFactor);
		float 	shadowCurve 				= lerp( lerp( EShadowCurveDay, EShadowCurveNight, JKNightDayFactor), EShadowCurveInt, JKInteriorFactor);
		float3	brightSpotColor 			= float3(lerp( lerp( EBrightSpotColorDay.x, EBrightSpotColorNight.x, JKNightDayFactor), EBrightSpotColorInt.x, JKInteriorFactor), lerp( lerp( EBrightSpotColorDay.y, EBrightSpotColorNight.y, JKNightDayFactor), EBrightSpotColorInt.y, JKInteriorFactor),lerp( lerp( EBrightSpotColorDay.z, EBrightSpotColorNight.z, JKNightDayFactor), EBrightSpotColorInt.z, JKInteriorFactor));
		float 	brightSpotAmount 			= lerp( lerp( EBrightSpotAmountDay, EBrightSpotAmountNight, JKNightDayFactor), EBrightSpotAmountInt, JKInteriorFactor);
		float	brightSpotThreshold 		= lerp( lerp( EBrightSpotThresholdDay, EBrightSpotThresholdNight, JKNightDayFactor), EBrightSpotThresholdInt, JKInteriorFactor);
		float 	brightSpotCurve 			= lerp( lerp( EBrightSpotCurveDay, EBrightSpotCurveNight, JKNightDayFactor), EBrightSpotCurveInt, JKInteriorFactor);
		float 	EFinalContrastV6 			= lerp( lerp( EFinalContrastV6Day, EFinalContrastV6Night, JKNightDayFactor), EFinalContrastV6Interior, JKInteriorFactor );
		float 	EFinalExposureV6 			= lerp( lerp( EFinalExposureV6Day, EFinalExposureV6Night, JKNightDayFactor), EFinalExposureV6Interior, JKInteriorFactor );
		float 	PPAmount 					= 1.0;			//controls interpolation between vanilla colors and PP6 colors	
		float 	avgbr;
		float4 	ncolor;	
		float4 	oldcolor;	
		float3 	hsvncolor;	
		
		grayadaptation			= clamp(grayadaptation, 0, 50);
		//store vanilla colors//////////////////////////////////////////
		oldcolor 				= color;
		//ppv2 modified by kermles//////////////////////////////////////
		xncol					= normalize(color.xyz);
		scl						= color.xyz/xncol.xyz;
		xncol.xyz				= pow(xncol.xyz, EColorSaturationV6);
		color.xyz				= scl*xncol.xyz;
		color.xyz				= pow(color, 1.0 / EBrightnessV6);
		//convert to linear colorspace//////////////////////////////////
		color.r 				= 1.0/(1.0+color.r);
		color.g 				= 1.0/(1.0+color.g);
		color.b 				= 1.0/(1.0+color.b);
		//contrast//////////////////////////////////////////////////////
		color.xyz				= pow(color, EIntensityContrastV6) / (pow(color, EIntensityContrastV6) + pow((1.0 - color), EIntensityContrastV6));
		//restore dynamic range/////////////////////////////////////////
		color.r 				= (1.0/color.r)-1.0;
		color.g 				= (1.0/color.g)-1.0;
		color.b 				= (1.0/color.b)-1.0;
		//tonemapping///////////////////////////////////////////////////
		color.xyz 				= (color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV6);
		#if( PRE_COLORATION == 1)
		//mood coloring/////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
			color.xyz 		+= ncolor*shadowAmount;
		#else
			color.xyz 		= lerp(color, max(color, ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		//adaptation////////////////////////////////////////////////////
		color.xyz			/= (grayadaptation*EAdaptationMaxV6+EAdaptationMinV6);
		#if( POST_COLORATION == 1)
		//mood coloring/////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
			color.xyz 		+= ncolor*shadowAmount;
		#else
			color.xyz 		= lerp(color, max(color, ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		//dpeasant contrast code////////////////////////////////////////
		color.xyz 				= lerp(color.xyz, 0.5 * (1 + sin((color.xyz - 0.5)*3.1415926)), EFinalContrastV6);
		//dpeasant exposure code////////////////////////////////////////
		color.rgb 				*= pow(2.0f, EFinalExposureV6);
		//lerp between vanilla and pp6 colors///////////////////////////
		color 					= lerp(oldcolor, color, PPAmount);
	#endif

//Post Processing 7 by Kermles//////////////////////////////////////////////////////////////////

	#if (POSTPROCESS==7)
		//hd6/ppv2///////////////////////////////////////////
		float 	EIntensityContrastV7 		= lerp( lerp( EIntensityContrastV7Day, EIntensityContrastV7Night, JKNightDayFactor), EIntensityContrastV7Interior, JKInteriorFactor );
		float 	EColorSaturationV7 			= lerp( lerp( EColorSaturationV7Day, EColorSaturationV7Night, JKNightDayFactor), EColorSaturationV7Interior, JKInteriorFactor );
		float 	EToneMappingCurveV7 		= lerp( lerp( EToneMappingCurveV7Day, EToneMappingCurveV7Night, JKNightDayFactor), EToneMappingCurveV7Interior, JKInteriorFactor );
		float 	EBrightnessV7 				= lerp( lerp( EBrightnessV7Day, EBrightnessV7Night, JKNightDayFactor), EBrightnessV7Interior, JKInteriorFactor );
		float 	EToneMappingOversaturationV7= lerp( lerp( EToneMappingOversaturationV7Day, EToneMappingOversaturationV7Night, JKNightDayFactor), EToneMappingOversaturationV7Interior, JKInteriorFactor );
		float 	EAdaptationMaxV7 			= lerp( lerp( EAdaptationMaxV7Day, EAdaptationMaxV7Night, JKNightDayFactor ), EAdaptationMaxV7Interior, JKInteriorFactor );
		float 	EAdaptationMinV7 			= lerp( lerp( EAdaptationMinV7Day, EAdaptationMinV7Night, JKNightDayFactor ), EAdaptationMinV7Interior, JKInteriorFactor );
		float	lumamax 					= EToneMappingOversaturationV7;
		//kermles////////////////////////////////////////////
		float	EColorAdaptationStrengthV7	= lerp( lerp( EColorAdaptationStrengthV7Day, EColorAdaptationStrengthV7Night, JKNightDayFactor ), EColorAdaptationStrengthV7Interior, JKInteriorFactor );
		float3 	moodColor 					= float3(lerp( lerp( EMoodColorDay.x, EMoodColorNight.x, JKNightDayFactor), EMoodColorInt.x, JKInteriorFactor), lerp( lerp( EMoodColorDay.y, EMoodColorNight.y, JKNightDayFactor), EMoodColorInt.y, JKInteriorFactor),lerp( lerp( EMoodColorDay.z, EMoodColorNight.z, JKNightDayFactor), EMoodColorInt.z, JKInteriorFactor));
		float 	moodAmount 					= lerp( lerp( EMoodAmountDay, EMoodAmountNight, JKNightDayFactor), EMoodAmountInt, JKInteriorFactor);
		float 	moodThreshold 				= lerp( lerp( EMoodThresholdDay, EMoodThresholdNight, JKNightDayFactor), EMoodThresholdInt, JKInteriorFactor);
		float 	moodCurve 					= lerp( lerp( EMoodCurveDay, EMoodCurveNight, JKNightDayFactor), EMoodCurveInt, JKInteriorFactor);
		float3 	shadowColor 				= float3(lerp( lerp( EShadowColorDay.x, EShadowColorNight.x, JKNightDayFactor), EShadowColorInt.x, JKInteriorFactor), lerp( lerp( EShadowColorDay.y, EShadowColorNight.y, JKNightDayFactor), EShadowColorInt.y, JKInteriorFactor),lerp( lerp( EShadowColorDay.z, EShadowColorNight.z, JKNightDayFactor), EShadowColorInt.z, JKInteriorFactor));
		float 	shadowThreshold 			= lerp( lerp( EShadowThresholdDay, EShadowThresholdNight, JKNightDayFactor), EShadowThresholdInt, JKInteriorFactor);
		float 	shadowAmount 				= lerp( lerp( EShadowAmountDay, EShadowAmountNight, JKNightDayFactor), EShadowAmountInt, JKInteriorFactor);
		float 	shadowCurve 				= lerp( lerp( EShadowCurveDay, EShadowCurveNight, JKNightDayFactor), EShadowCurveInt, JKInteriorFactor);
		float3	brightSpotColor 			= float3(lerp( lerp( EBrightSpotColorDay.x, EBrightSpotColorNight.x, JKNightDayFactor), EBrightSpotColorInt.x, JKInteriorFactor), lerp( lerp( EBrightSpotColorDay.y, EBrightSpotColorNight.y, JKNightDayFactor), EBrightSpotColorInt.y, JKInteriorFactor),lerp( lerp( EBrightSpotColorDay.z, EBrightSpotColorNight.z, JKNightDayFactor), EBrightSpotColorInt.z, JKInteriorFactor));
		float 	brightSpotAmount	 		= lerp( lerp( EBrightSpotAmountDay, EBrightSpotAmountNight, JKNightDayFactor), EBrightSpotAmountInt, JKInteriorFactor);
		float	brightSpotThreshold 		= lerp( lerp( EBrightSpotThresholdDay, EBrightSpotThresholdNight, JKNightDayFactor), EBrightSpotThresholdInt, JKInteriorFactor);
		float 	brightSpotCurve 			= lerp( lerp( EBrightSpotCurveDay, EBrightSpotCurveNight, JKNightDayFactor), EBrightSpotCurveInt, JKInteriorFactor);
		float 	hsvDesatCurve 				= lerp( lerp( EHSVDesatCurveDay, EHSVDesatCurveNight, JKNightDayFactor), EHSVDesatCurveInt, JKInteriorFactor); //controls desaturation strength
		float 	EFinalContrastV7 			= lerp( lerp( EFinalContrastV7Day, EFinalContrastV7Night, JKNightDayFactor), EFinalContrastV7Interior, JKInteriorFactor );
		float 	EFinalExposureV7 			= lerp( lerp( EFinalExposureV7Day, EFinalExposureV7Night, JKNightDayFactor), EFinalExposureV7Interior, JKInteriorFactor );
		float 	PPAmount 					= 1.0;			//controls interpolation between vanilla colors and PP6 colors	
		float4 	ncolor;					
		float 	avgbr;			
		
		grayadaptation			= clamp(grayadaptation, 0, 50);
		//store vanilla colors//////////////////////////////////////////
		float4 oldcolor 		= color;
		//convert to hsv////////////////////////////////////////////////
		float3 hsvncolor 		= RGBtoHSV7( color.xyz );
		//desaturate based on original saturation///////////////////////
		hsvncolor.y 			= pow( hsvncolor.y, hsvDesatCurve );
		//saturation////////////////////////////////////////////////////
		hsvncolor.y 			= hsvncolor.y*EColorSaturationV7;
		//convert back to rgb///////////////////////////////////////////
		color.xyz 				= HSVtoRGB7( hsvncolor );
		//brightness////////////////////////////////////////////////////
		color.xyz				= pow(color, 1.0 / max(0.0001, EBrightnessV7));
		//convert to linear colorspace//////////////////////////////////
		color.r 				= 1.0/(1.0+color.r);
		color.g 				= 1.0/(1.0+color.g);
		color.b 				= 1.0/(1.0+color.b);
		//contrast//////////////////////////////////////////////////////
		color.xyz				= pow(color, EIntensityContrastV7) / (pow(color, EIntensityContrastV7) + pow((1.0 - color), EIntensityContrastV7));
		//restore dynamic range/////////////////////////////////////////
		color.r 				= (1.0/color.r)-1.0;
		color.g 				= (1.0/color.g)-1.0;
		color.b 				= (1.0/color.b)-1.0;
		color.xyz 				= (color.xyz * (1.0 + color.xyz/lumamax))/(color.xyz + EToneMappingCurveV7);
		#if( PRE_COLORATION == 1)
		//mood coloring/////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				= max(0.0, color);
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
		color.xyz 			+= max(color, ncolor)*shadowAmount;
		#else
		color.xyz 			= lerp(color, max(color,ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		color.xyz			/= (grayadaptation*EAdaptationMaxV7+EAdaptationMinV7);
		#if( POST_COLORATION == 1)
			//mood coloring/////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
		color.xyz 			+= ncolor*shadowAmount;
		#else
		color.xyz 			= lerp(color, max(color,ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		#if( COLOR_ADAPTATION == 1)
		avgbr				= Luminance(color.xyz);
		grayadaptation		= saturate(grayadaptation);
		//convert to hsv////////////////////////////////////////////////
		hsvncolor 			= RGBtoHSV( color.xyz );
		hsvncolor.y 		= max( hsvncolor.y, 0 );
		//desaturate based on adaptation///////////////////////
		hsvncolor.y	 		= hsvncolor.y/(1+((1-avgbr)*(1-grayadaptation))*EColorAdaptationStrengthV7);
		//convert back to rgb///////////////////////////////////////////
		color.xyz 			= HSVtoRGB( hsvncolor );
		#endif
		//dpeasant contrast code////////////////////////////////////////
		color.xyz 			= lerp(color.xyz, 0.5 * (1 + sin((color.xyz - 0.5)*3.1415926)), EFinalContrastV7);
		//dpeasant exposure code////////////////////////////////////////
		color.rgb 			*= pow(2.0f, EFinalExposureV7);
		//lerp between vanilla and pp6 colors///////////////////////////
		color = lerp(oldcolor, color, PPAmount);
	#endif

//Improved Tonemapping by Brodiggan Gale modified by Kermles//////////////////////////////////////////////////////////////////

	#if POSTPROCESS == 8	
		float  	saturationMin 				= lerp( lerp( EMinSaturationPowerDay, EMinSaturationPowerNight, JKNightDayFactor), EMinSaturationPowerInt, JKInteriorFactor);
		float  	saturationMax 				= lerp( lerp( EMaxSaturationPowerDay, EMaxSaturationPowerNight, JKNightDayFactor), EMaxSaturationPowerInt, JKInteriorFactor);
		float  	brightCurve 				= lerp( lerp( EBrightCurveDay, EBrightCurveNight, JKNightDayFactor), EBrightCurveInt, JKInteriorFactor);
		float  	contrastCurve 				= lerp( lerp( EContrastCurveDay, EContrastCurveNight, JKNightDayFactor), EContrastCurveInt, JKInteriorFactor);
		float  	contrastThreshold 			= lerp( lerp( EContrastThresholdDay, EContrastThresholdNight, JKNightDayFactor), EContrastThresholdInt, JKInteriorFactor);
		float 	EToneMappingOversaturationV8= lerp( lerp( EToneMappingOversaturationV8Day, EToneMappingOversaturationV8Night, JKNightDayFactor), EToneMappingOversaturationV8Interior, JKInteriorFactor );
		float 	EToneMappingCurveV8 		= lerp( lerp( EToneMappingCurveV8Day, EToneMappingCurveV8Night, JKNightDayFactor), EToneMappingCurveV8Interior, JKInteriorFactor );
		float 	EAdaptationMaxV8 			= lerp( lerp( EAdaptationMaxV8Day, EAdaptationMaxV8Night, JKNightDayFactor ), EAdaptationMaxV8Interior, JKInteriorFactor );
		float 	EAdaptationMinV8 			= lerp( lerp( EAdaptationMinV8Day, EAdaptationMinV8Night, JKNightDayFactor ), EAdaptationMinV8Interior, JKInteriorFactor );
		float3 	moodColor 					= float3(lerp( lerp( EMoodColorDay.x, EMoodColorNight.x, JKNightDayFactor), EMoodColorInt.x, JKInteriorFactor), lerp( lerp( EMoodColorDay.y, EMoodColorNight.y, JKNightDayFactor), EMoodColorInt.y, JKInteriorFactor),lerp( lerp( EMoodColorDay.z, EMoodColorNight.z, JKNightDayFactor), EMoodColorInt.z, JKInteriorFactor));
		float 	moodAmount 					= lerp( lerp( EMoodAmountDay, EMoodAmountNight, JKNightDayFactor), EMoodAmountInt, JKInteriorFactor);
		float 	moodThreshold 				= lerp( lerp( EMoodThresholdDay, EMoodThresholdNight, JKNightDayFactor), EMoodThresholdInt, JKInteriorFactor);
		float 	moodCurve 					= lerp( lerp( EMoodCurveDay, EMoodCurveNight, JKNightDayFactor), EMoodCurveInt, JKInteriorFactor);
		float3 	shadowColor 				= float3(lerp( lerp( EShadowColorDay.x, EShadowColorNight.x, JKNightDayFactor), EShadowColorInt.x, JKInteriorFactor), lerp( lerp( EShadowColorDay.y, EShadowColorNight.y, JKNightDayFactor), EShadowColorInt.y, JKInteriorFactor),lerp( lerp( EShadowColorDay.z, EShadowColorNight.z, JKNightDayFactor), EShadowColorInt.z, JKInteriorFactor));
		float 	shadowThreshold 			= lerp( lerp( EShadowThresholdDay, EShadowThresholdNight, JKNightDayFactor), EShadowThresholdInt, JKInteriorFactor);
		float 	shadowAmount 				= lerp( lerp( EShadowAmountDay, EShadowAmountNight, JKNightDayFactor), EShadowAmountInt, JKInteriorFactor);
		float 	shadowCurve 				= lerp( lerp( EShadowCurveDay, EShadowCurveNight, JKNightDayFactor), EShadowCurveInt, JKInteriorFactor);
		float3	brightSpotColor 			= float3(lerp( lerp( EBrightSpotColorDay.x, EBrightSpotColorNight.x, JKNightDayFactor), EBrightSpotColorInt.x, JKInteriorFactor), lerp( lerp( EBrightSpotColorDay.y, EBrightSpotColorNight.y, JKNightDayFactor), EBrightSpotColorInt.y, JKInteriorFactor),lerp( lerp( EBrightSpotColorDay.z, EBrightSpotColorNight.z, JKNightDayFactor), EBrightSpotColorInt.z, JKInteriorFactor));
		float 	brightSpotAmount	 		= lerp( lerp( EBrightSpotAmountDay, EBrightSpotAmountNight, JKNightDayFactor), EBrightSpotAmountInt, JKInteriorFactor);
		float	brightSpotThreshold 		= lerp( lerp( EBrightSpotThresholdDay, EBrightSpotThresholdNight, JKNightDayFactor), EBrightSpotThresholdInt, JKInteriorFactor);
		float 	brightSpotCurve 			= lerp( lerp( EBrightSpotCurveDay, EBrightSpotCurveNight, JKNightDayFactor), EBrightSpotCurveInt, JKInteriorFactor);
		float 	EFinalContrastV8 			= lerp( lerp( EFinalContrastV8Day, EFinalContrastV8Night, JKNightDayFactor), EFinalContrastV8Interior, JKInteriorFactor );
		float 	EFinalExposureV8 			= lerp( lerp( EFinalExposureV8Day, EFinalExposureV8Night, JKNightDayFactor), EFinalExposureV8Interior, JKInteriorFactor );
		float4 	ncolor;					
		float 	avgbr;			
		grayadaptation			= clamp(grayadaptation, 0, 50);
		color.x					= 1/(1+color.x);
		color.y					= 1/(1+color.y);
		color.z					= 1/(1+color.z);
		float luminance 		= max(color.x, max(color.y, color.z)); // Too low or high of a luminance value will cause some artifacting in the steps to follow
		color.xyz 				= saturate(pow(color.xyz / luminance,  lerp(saturationMin, saturationMax, peakCurve(0.0, 1.0, (color.x+color.y+color.z)/3, 1.8)))) * luminance; // Increase/Decrease Saturation
		color.xyz 				= color.xyz * (1.0 + compoundCurve(0.0, 1.0, luminance, contrastCurve, contrastThreshold) - luminance); //Contrast Tonemapping
		color.xyz 				= color.xyz * (1.0 + color.xyz/brightCurve)/(color.xyz + (1/brightCurve)); //Brightness Tonemapping
		color.x					= (1/color.x)-1;
		color.y					= (1/color.y)-1;
		color.z					= (1/color.z)-1;
		color.xyz 				= (color.xyz * (1.0 + color.xyz/EToneMappingOversaturationV8))/(color.xyz + EToneMappingCurveV8);
		#if( PRE_COLORATION == 1)
			//mood coloring/////////////////////////////////////////////////
		ncolor 				= color;
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				=  color;
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
		color.xyz 			+= max(color, ncolor)*shadowAmount;
		#else
		color.xyz 			= lerp(color, max(color,ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		#if( BRIGHTSPOT_USE_SUBTRACTION == 1)
		color.xyz 			-= ncolor*brightSpotAmount;
		#else
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		#endif
		color.xyz			/= (grayadaptation*EAdaptationMaxV8+EAdaptationMinV8);
		#if( POST_COLORATION == 1)
			//mood coloring/////////////////////////////////////////////////
		ncolor 				= max(0.0001,color);
		avgbr 				= Luminance(color.xyz);
		moodColor 			= lerp(0.0001, moodColor, saturate(avgbr*2));
		moodColor 			= lerp(moodColor, 1, saturate(avgbr-0.5)*2);
		ncolor.xyz 			= lerp(ncolor, moodColor, saturate(pow(avgbr, moodCurve + ((ncolor)*(1-moodColor)) / moodThreshold)));
		color.xyz 			= lerp(color, ncolor, moodAmount);
		//shadows///////////////////////////////////////////////////////
		ncolor 				= max(0.0001, color);
		avgbr 				= Luminance(color.xyz);
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0+ncolor)* (2.55-shadowColor))*shadowThreshold)/shadowCurve);
		#if( SHADOW_USE_ADDITION == 1)
		color.xyz 			+= max(color, ncolor)*shadowAmount;
		#else
		color.xyz 			= lerp(color, max(color,ncolor), shadowAmount);
		#endif
		//brightspots///////////////////////////////////////////////////
		avgbr 				= Luminance(color.xyz);
		#if( BRIGHTSPOT_IGNORE_WHITES == 1)
		brightSpotColor 	= lerp(0.0001, brightSpotColor, saturate(avgbr*2));
		brightSpotColor 	= lerp(brightSpotColor, 1, saturate(avgbr-0.5)*2);
		#endif
		ncolor 				= 1-color;
		ncolor.xyz 			= max(ncolor, pow(ncolor, ((1.0 + ncolor) * (brightSpotColor))*brightSpotThreshold)/brightSpotCurve);
		color.xyz 			= lerp(color, 1-ncolor, brightSpotAmount);
		#endif
		//dpeasant contrast code////////////////////////////////////////
		color.xyz 			= lerp(color.xyz, 0.5 * (1 + sin((color.xyz - 0.5)*3.1415926)), EFinalContrastV8);
		//dpeasant exposure code////////////////////////////////////////
		color.rgb 			*= pow(2.0f, EFinalExposureV8);		
	#endif
	
/////////////////////////////////////////////////////////////////////////////////////////////////
///POST BLOOM CODE///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////		
	
#if( POST_BLOOM == 1)

float mavg;
float3 nsat;
float3 oldcol;
float4 xcolorbloom;

#if(CURVE_BLOOM == 1)
		
		
		 xcolorbloom = tex2D( _s3, _v0.xy );
	
		
//++Changes appareance of colors+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		float3 cbgreycn = float3(0.299, 0.587, 0.114);  // perception of color luminace
		//float3 cbgreycn = float3(0.811,0.523,0.996);	// perception of color luminace
		//float3 cbgreycn = float3(0.333,0.333,0.333); 		// screw perception
//++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
		
		float 	bloomBrightness = lerp( lerp( BloomBrightnessDay, BloomBrightnessNight, JKNightDayFactor), BloomBrightnessInt, JKInteriorFactor);
		float3 	bloomSaturation = lerp( lerp( BloomSaturationDay, BloomSaturationNight, JKNightDayFactor), BloomSaturationInt, JKInteriorFactor);
		float 	bloomContrast = lerp( lerp( BloomContrastDay, BloomContrastNight, JKNightDayFactor), BloomContrastInt, JKInteriorFactor);
		float	bloomThreshold = lerp( lerp( BloomThresholdDay, BloomThresholdNight, JKNightDayFactor), BloomThresholdInt, JKInteriorFactor);
		float 	bloomCurve = lerp( lerp( BloomCurveDay, BloomCurveNight, JKNightDayFactor), BloomCurveInt, JKInteriorFactor);
		float 	bloomavgbr = (color.x+color.y+color.z)/3;
		
		#if(BLOOM_DEFUZZ == 1)
			mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
			xcolorbloom.xyz-=(mavg/3);
			xcolorbloom.xyz+=(mavg*0.2);
			xcolorbloom.xyz*(mavg*1.2);
		#endif
		
		#if(BLOOM_COLORIZATION == 1)
			xcolorbloom.rgb*= lerp( lerp( curvebloommultDay, curvebloommultNight, JKNightDayFactor ), curvebloommultInterior, JKInteriorFactor );
			xcolorbloom.rgb-= lerp( lerp( curvebloomsubDay, curvebloomsubNight, JKNightDayFactor ), curvebloomsubInterior, JKInteriorFactor );
			xcolorbloom.rb*= lerp( lerp( curveMAGENTAbloomDay, curveMAGENTAbloomNight, JKNightDayFactor ), curveMAGENTAbloomInterior, JKInteriorFactor );
			xcolorbloom.gb*= lerp( lerp( curveCYANbloomDay, curveCYANbloomNight, JKNightDayFactor ), curveCYANbloomInterior, JKInteriorFactor );
			xcolorbloom.rg*= lerp( lerp( curveYELLOWbloomDay, curveYELLOWbloomNight, JKNightDayFactor ), curveYELLOWbloomInterior, JKInteriorFactor );
		#endif
		
		float4 bloomncolor = xcolorbloom;
		//remove bloom from dark areas//////////////////////////////////
		bloomncolor = pow(bloomncolor/bloomCurve, bloomThreshold + (bloomncolor*bloomncolor));
		//adjust saturation
		bloomncolor.xyz *= bloomSaturation;
		bloomncolor.xyz += (xcolorbloom.x-(xcolorbloom.x*bloomSaturation.x)) * cbgreycn.x;
		bloomncolor.xyz += (xcolorbloom.y-(xcolorbloom.y*bloomSaturation.y)) * cbgreycn.y;
		bloomncolor.xyz += (xcolorbloom.z-(xcolorbloom.z*bloomSaturation.z)) * cbgreycn.z;
		//adjust brightness/////////////////////////////////////////////
		bloomncolor.xyz		= pow(bloomncolor, 1.0 / max(0.0001, bloomBrightness));
		//adjust contrast///////////////////////////////////////////////
		bloomncolor.xyz		= pow(bloomncolor, bloomContrast) / (pow(saturate(bloomncolor), bloomContrast) + pow(1.0 - saturate(bloomncolor), bloomContrast));
		//sharpen///////////////////////////////////////////////////////
		#if(SHARP_MODE == 1)
			bloomncolor = max(0, lerp(0, bloomncolor, saturate(bloomavgbr*2)));
			bloomncolor = max(0, lerp(bloomncolor, 1, saturate(bloomavgbr-0.5)*2));
		#endif
		//mix bloom/////////////////////////////////////////////////////
		#if(BLOOM_LERP == 1)
			color.xyz = lerp( color, bloomncolor, EBloomAmount );
		#endif
		#if(BLOOM_ADD == 1)
			color.xyz += bloomncolor * EBloomAmount;
		#endif
		#if(BLOOM_LERP == 0)
		#if(BLOOM_ADD == 0)
			color.xyz = max(color, bloomncolor * EBloomAmount);
		#endif
		#endif
#endif

#if( ENB_BLOOM == 1)

	
		float4	enbbloomcol=tex2D(_s3, _v0.xy);


	// DEBUG OUTPUT
	// return enbbloomcol;

	if( enbbloomcol.r + enbbloomcol.g + enbbloomcol.b > 0.0 )
	{
		#if( BLOOM_COLORIZATION == 1)
		enbbloomcol.rgb*= lerp( lerp( ENBbloommultDay, ENBbloommultNight, JKNightDayFactor ), ENBbloommultInterior, JKInteriorFactor );
		enbbloomcol.rgb-= lerp( lerp( ENBbloomsubDay, ENBbloomsubNight, JKNightDayFactor ), ENBbloomsubInterior, JKInteriorFactor );
		enbbloomcol.rb*= lerp( lerp( ENBMAGENTAbloomDay, ENBMAGENTAbloomNight, JKNightDayFactor ), ENBMAGENTAbloomInterior, JKInteriorFactor );
		enbbloomcol.gb*= lerp( lerp( ENBCYANbloomDay, ENBCYANbloomNight, JKNightDayFactor ), ENBCYANbloomInterior, JKInteriorFactor );
		enbbloomcol.rg*= lerp( lerp( ENBYELLOWbloomDay, ENBYELLOWbloomNight, JKNightDayFactor ), ENBYELLOWbloomInterior, JKInteriorFactor );
		#endif

		float fBloomSaturationSmooth =lerp( lerp( fBloomSaturationSmoothDay, fBloomSaturationSmoothNight, JKNightDayFactor ), fBloomSaturationSmoothInterior, JKInteriorFactor );
		float fBloomSaturationCurve =lerp( lerp( fBloomSaturationCurveDay, fBloomSaturationCurveNight, JKNightDayFactor ), fBloomSaturationCurveInterior, JKInteriorFactor );
		float fBloomSaturationMult =lerp( lerp( fBloomSaturationMultDay, fBloomSaturationMultNight, JKNightDayFactor ), fBloomSaturationMultInterior, JKInteriorFactor );

		float fBloomIntensitySmooth =lerp( lerp( fBloomIntensitySmoothDay, fBloomIntensitySmoothNight, JKNightDayFactor ), fBloomIntensitySmoothInterior, JKInteriorFactor );
		float fBloomIntensityCurve =lerp( lerp( fBloomIntensityCurveDay, fBloomIntensityCurveNight, JKNightDayFactor ), fBloomIntensityCurveInterior, JKInteriorFactor );
		float fBloomIntensityMult =lerp( lerp( fBloomIntensityMultDay, fBloomIntensityMultNight, JKNightDayFactor ), fBloomIntensityMultInterior, JKInteriorFactor );
		float fBloomIntensityMod =lerp( lerp( fBloomIntensityModDay, fBloomIntensityModNight, JKNightDayFactor ), fBloomIntensityModInterior, JKInteriorFactor );
		float fBloomIntensityMax =lerp( lerp( fBloomIntensityMaxDay, fBloomIntensityMaxNight, JKNightDayFactor ), fBloomIntensityMaxInterior, JKInteriorFactor );

		float3 bloomhsv = RGBtoHSV( enbbloomcol.rgb );
		bloomhsv.y = lerp( bloomhsv.y, smoothstep( 0.0, 1.0, bloomhsv.y ), fBloomSaturationSmooth );
		bloomhsv.y = pow( bloomhsv.y, fBloomSaturationCurve );
		bloomhsv.y *= fBloomSaturationMult;
		bloomhsv.z = lerp( bloomhsv.z, smoothstep( 0.0, 1.0, bloomhsv.z ), fBloomIntensitySmooth );
		bloomhsv.z = pow( bloomhsv.z, fBloomIntensityCurve );
		bloomhsv.z *= fBloomIntensityMult;
		bloomhsv.z += fBloomIntensityMod;
		bloomhsv.z = clamp( bloomhsv.z, 0.0, fBloomIntensityMax );
		enbbloomcol.rgb = HSVtoRGB( bloomhsv );
		
		#if( BLOOM_DEFUZZ == 1)
			mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
			xcolorbloom.xyz-=(mavg/3);
			xcolorbloom.xyz+=(mavg*0.2);
			xcolorbloom.xyz*(mavg*1.2);
		#endif

		#if( BLOOM_LERP == 1)
		color.rgb = lerp( color.rgb, enbbloomcol.rgb, EBloomAmount );
		#endif
		#if( BLOOM_ADD == 1)
		color.rgb += enbbloomcol.rgb * EBloomAmount;
		#endif
		#if( BLOOM_LERP == 0)
		#if( BLOOM_ADD == 0)
		color.rgb = max(color.xyz, enbbloomcolor.xyz * EBloomAmount);
		#endif
		#endif
				
	}
	#endif
	
#if( DIFFUSE_BLOOM == 1)

	
		 xcolorbloom = tex2D( _s3, _v0.xy );

		
	#if( BLOOM_DEFUZZ == 1)
		// Heliosdouble cobbled together bloom defuzzer - increases contrast of bloom / stop it hazing low brightness values
		// modulated by the overall brightness of the screen.

		mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
		xcolorbloom.xyz-=(mavg/3);
		//xcolorbloom.xyz=min(xcolorbloom.xyz,0.0);
		xcolorbloom.xyz+=(mavg*0.2);
		xcolorbloom.xyz*(mavg*1.2);
	#endif
		
	#if( BLOOM_COLORIZATION == 1)
		xcolorbloom.xyz*= lerp( lerp( diffbloommultDay, diffbloommultNight, JKNightDayFactor ), diffbloommultInterior, JKInteriorFactor );
		xcolorbloom.xyz-= lerp( lerp( diffbloomsubDay, diffbloomsubNight, JKNightDayFactor ), diffbloomsubInterior, JKInteriorFactor );
		xcolorbloom.xz*= lerp( lerp( diffMAGENTAbloomDay, diffMAGENTAbloomNight, JKNightDayFactor ), diffMAGENTAbloomInterior, JKInteriorFactor );
		xcolorbloom.yz*= lerp( lerp( diffCYANbloomDay, diffCYANbloomNight, JKNightDayFactor ), diffCYANbloomInterior, JKInteriorFactor );
		xcolorbloom.xy*= lerp( lerp( diffYELLOWbloomDay, diffYELLOWbloomNight, JKNightDayFactor ), diffYELLOWbloomInterior, JKInteriorFactor );
	#endif
		float Saturation = lerp( lerp( SatDay, SatNight, JKNightDayFactor ), SatInterior, JKInteriorFactor );
		float Luma = lerp( lerp( LumaDay, LumaNight, JKNightDayFactor ), LumaInterior, JKInteriorFactor );
		float Pow = lerp( lerp( PowDay, PowNight, JKNightDayFactor ), PowInterior, JKInteriorFactor );
		float Pow2 = lerp( lerp( Pow2Day, Pow2Night, JKNightDayFactor ), Pow2Interior, JKInteriorFactor );

		float3 cgray2=dot(xcolorbloom.xyz, Luma);
		float3 poweredcolor2=pow(xcolorbloom.xyz, Saturation);
		float newgray2=dot(poweredcolor2.xyz, Pow);
		xcolorbloom.xyz=poweredcolor2.xyz*cgray2/(newgray2+Pow2);
		
		color.xyz+=xcolorbloom.xyz*EBloomAmount;
	
	#if( BLOOM_LERP == 1)
		color.xyz = lerp( color.xyz, xcolorbloom.xyz, EBloomAmount );
	#endif
	#if( BLOOM_ADD == 1)
		color.xyz += xcolorbloom.xyz * EBloomAmount;
	#endif
	#if( BLOOM_LERP == 0)
	#if( BLOOM_ADD == 0)
		color.xyz =max(color.xyz, xcolorbloom.xyz*EBloomAmount);
	#endif
	#endif
#endif


#if( BLOOM_CRISP == 1)

			 xcolorbloom = tex2D( _s3, _v0.xy );
				
			float3 LumCoeff = lerp( LumCoeffInterior, ( lerp( LumCoeffNight, LumCoeffDay,  JKNightDayFactor ) ), JKInteriorFactor);			
			float3 AvgLumin = lerp( AvgLuminInterior, ( lerp( AvgLuminNight, AvgLuminDay,  JKNightDayFactor ) ), JKInteriorFactor);	
			
		#if( BLOOM_DEFUZZ == 1)
		// Heliosdouble cobbled together bloom defuzzer - increases contrast of bloom / stop it hazing low brightness values
		// modulated by the overall brightness of the screen.

		mavg=((xcolorbloom.x+xcolorbloom.y+xcolorbloom.z)/3);
		xcolorbloom.xyz-=(mavg/3);
		//xcolorbloom.xyz=min(xcolorbloom.xyz,0.0);
		xcolorbloom.xyz+=(mavg*0.2);
		xcolorbloom.xyz*(mavg*1.2);
		#endif
			
		#if( BLOOM_COLORIZATION == 1)

			xcolorbloom.rgb*= lerp( lerp( crispbloommultDay, crispbloommultNight, JKNightDayFactor ), crispbloommultInterior, JKInteriorFactor );
			xcolorbloom.rgb-= lerp( lerp( crispbloomsubDay, crispbloomsubNight, JKNightDayFactor ), crispbloomsubInterior, JKInteriorFactor );

			xcolorbloom.rb*= lerp( lerp( crispMAGENTAbloomDay, crispMAGENTAbloomNight, JKNightDayFactor ), crispMAGENTAbloomInterior, JKInteriorFactor );
			xcolorbloom.gb*= lerp( lerp( crispCYANbloomDay, crispCYANbloomNight, JKNightDayFactor ), crispCYANbloomInterior, JKInteriorFactor );
			xcolorbloom.rg*= lerp( lerp( crispYELLOWbloomDay, crispYELLOWbloomNight, JKNightDayFactor ), crispYELLOWbloomInterior, JKInteriorFactor );

		//color.xyz+=xcolorbloom.xyz*EBloomAmount;

		#endif
			
			// Limits what triggers a bloom
			float3 brightbloom = xcolorbloom - lerp( TrigInterior, ( lerp( TrigNight, TrigDay,  JKNightDayFactor ) ), JKInteriorFactor);
				brightbloom = max( brightbloom , 0);

			// Limits bloom to superbright spots only
			float3 superbright = xcolorbloom - lerp( SBrightInterior, ( lerp( SBrightNight, SBrightDay,  JKNightDayFactor ) ), JKInteriorFactor);
				superbright = max( superbright , 0 ) ; // crop so dont go any lower than black
				//superbright = lerp( AvgLumin, superbright, 0.5); // Contrast
				superbright *= 0.6;		
			
			// Bloom - Brightness, Contrast and Saturation
			float3 brt = lerp( CBrightnessInterior, ( lerp( CBrightnessNight, CBrightnessDay,   JKNightDayFactor ) ), JKInteriorFactor);
			float3 con = lerp( CContrastInterior, ( lerp( CContrastNight, CContrastDay,   JKNightDayFactor ) ), JKInteriorFactor);
			float3 sat = lerp( CSaturationInterior, ( lerp( CSaturationNight, CSaturationDay,   JKNightDayFactor ) ), JKInteriorFactor);
				float3 brtColor = brightbloom * brt;
				float3 cintensity = dot( brtColor, LumCoeff );
				float3 satColor = lerp( cintensity, brtColor, sat ); 
				float3 conColor = lerp( AvgLumin, satColor, con );
				conColor -= 0.3;
				brightbloom = conColor;

			// These values compensates the brightness when no bloom is used
			color.xyz +=  lerp( BrightnessModInterior, ( lerp( BrightnessModNight, BrightnessModDay, JKNightDayFactor ) ), JKInteriorFactor);
			color.xyz *= lerp( BrightnessMultInterior, ( lerp( BrightnessMultNight, BrightnessMultDay, JKNightDayFactor ) ), JKInteriorFactor);

			// Adds bloom while compensating for any brightness change
			color.xyz += (( superbright * hbs ) * lerp( CompSBInterior, ( lerp( CompSBNight, CompSBDay,  JKNightDayFactor ) ), JKInteriorFactor)); // Limits where the bloom will "bloom"
			brightbloom -= ( superbright * 2 ); // removes superbright from brightbloom
			brightbloom = max( brightbloom , 0.0 );
			color.xyz += (( brightbloom * hbs ) * lerp( BloomStrInterior, ( lerp( BloomStrNight, BloomStrDay,  JKNightDayFactor ) ), JKInteriorFactor)); // How strong the bloom will be

			// This blends the the ENB and Skyrim bloom together, for a more hazey effect
			color.xyz += (xcolorbloom.xyz * hbs) * lerp( BloomBlendInterior, ( lerp( BloomBlendNight, BloomBlendDay,  JKNightDayFactor ) ), JKInteriorFactor); // How much the blend there will be
			color.xyz *= lerp( BlendCompInterior, ( lerp( BlendCompNight, BlendCompDay,  JKNightDayFactor ) ), JKInteriorFactor); // compensate for brightening caused by above bloom

#endif

#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///ADVANCED COLOR CONTROL CODE///////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

#if( COLOR_POLARIZATION == 1)
float3 	GuideHue = lerp( lerp( GuideHueDay, GuideHueNight, JKNightDayFactor), GuideHueInt, JKInteriorFactor);
float 	Amount = lerp( lerp( AmountDay, AmountNight, JKNightDayFactor), AmountInt, JKInteriorFactor);
float 	DesatCorr = lerp( lerp( DesatCorrDay, DesatCorrNight, JKNightDayFactor), DesatCorrInt, JKInteriorFactor);
float 	Concentrate = lerp( lerp( ConcentrateDay, ConcentrateNight, JKNightDayFactor), ConcentrateInt, JKInteriorFactor);

float4 rgbaTex = color;
    float3 hsvTex = RGBtoHSV7(rgbaTex.rgb);
    float3 huePole1 = RGBtoHSV7(GuideHue); // uniform
    float3 huePole2 = hsv_complement(huePole1); // uniform
    float dist1 = abs(hsvTex.x - huePole1.x); if (dist1>0.5) dist1 = 1.0-dist1;
    float dist2 = abs(hsvTex.x - huePole2.x); if (dist2>0.5) dist2 = 1.0-dist2;
    float dsc = smoothstep(0,DesatCorr,hsvTex.y);
    float3 newHsv = hsvTex;
// #define FORCEHUE
#ifdef FORCEHUE
    if (dist1 < dist2) {
	newHsv = huePole1;
    } else {
	newHsv = huePole2;
    }
#else /* ! FORCEHUE */
    if (dist1 < dist2) {
	float c = dsc * Amount * (1.0 - pow((dist1*2.0),1.0/Concentrate));
	newHsv.x = hue_lerp(hsvTex.x,huePole1.x,c);
	newHsv.y = lerp(hsvTex.y,huePole1.y,c);
    } else {
	float c = dsc * Amount * (1.0 - pow((dist2*2.0),1.0/Concentrate));
	newHsv.x = hue_lerp(hsvTex.x,huePole2.x,c);
	newHsv.y = lerp(hsvTex.y,huePole1.y,c);
    }
#endif /* ! FORCEHUE */
    float3 newRGB = HSVtoRGB7(newHsv);
#ifdef FORCEHUE
    newRGB = lerp(rgbaTex.rgb,newRGB,Amount);
#endif /* FORCEHUE */
color.xyz = newRGB;
#endif

#if(COLOR_GRADING == 1)
float3 RedVector 	= lerp(lerp(RedVectorDay, RedVectorNight, JKNightDayFactor), RedVectorInt, JKInteriorFactor);
float3 GreenVector 	= lerp(lerp(GreenVectorDay, GreenVectorNight, JKNightDayFactor), GreenVectorInt, JKInteriorFactor);
float3 BlueVector 	= lerp(lerp(BlueVectorDay, BlueVectorNight, JKNightDayFactor), BlueVectorInt, JKInteriorFactor);

float3 texCol = color.xyz;
float rm = dot(texCol.xyz,RedVector);
float gm = dot(texCol.xyz,GreenVector);
float bm = dot(texCol.xyz,BlueVector);
color.xyz= float3(rm, gm, bm);
#endif

/////////////////////////////////////////////////////////////////////////////////////////////////
///SEPIA TONE CODE///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
#if( SEPIATONE == 1)
	float fSepiaExposure =lerp( lerp( fSepiaExposureDay, fSepiaExposureNight, JKNightDayFactor ), fSepiaExposureInterior, JKInteriorFactor );
	float3 fSepiaColor =lerp( lerp( fSepiaColorDay, fSepiaColorNight, JKNightDayFactor ), fSepiaColorInterior, JKInteriorFactor );
	float fSepiaDesaturation =lerp( lerp( fSepiaDesaturationDay, fSepiaDesaturationNight, JKNightDayFactor ), fSepiaDesaturationInterior, JKInteriorFactor );

float SepiaWeight = float3( 0.2125, 0.7154, 0.0721 );
float SepiaLuminance = min( 1.0, dot( color, SepiaWeight ) * fSepiaExposure ) ;
float3 SepiaColor = fSepiaColor * SepiaLuminance;
color.rgb = lerp( color.rgb, SepiaColor, fSepiaDesaturation );
#endif



//TONEMAPPERS

#if (TVLEVELS==1)

float DARK_LEVEL = lerp( lerp( DARK_LEVEL_DAY, DARK_LEVEL_NIGHT, JKNightDayFactor ), DARK_LEVEL_INT, JKInteriorFactor );
float BRIGHT_LEVEL = lerp( lerp( BRIGHT_LEVEL_DAY, BRIGHT_LEVEL_NIGHT, JKNightDayFactor ), BRIGHT_LEVEL_INT, JKInteriorFactor );


#define const_1 (DARK_LEVEL/255.0)
#define const_2 (255.0/(255.0-BRIGHT_LEVEL))

color.xyz = (color.xyz  - const_1) * const_2;

#endif


#if (VIBRANCE==1)

float Vibrance =lerp( lerp( VibranceDay, VibranceNight, JKNightDayFactor ), VibranceInterior, JKInteriorFactor );

float3 VlumCoeff = float3(0.2126, 0.7152, 0.0722);
float vibranceluma = dot(VlumCoeff, color.xyz);

float max_color = max(color.x, max(color.y,color.z)); //Find the strongest color
float min_color = min(color.x, max(color.y,color.z)); //Find the weakest color
float color_saturation = max_color - min_color;

color.xyz = lerp(vibranceluma, color.xyz, (1.0 + (Vibrance * (1.0 - (sign(Vibrance) * color_saturation)))));
#endif


#if (SPHERICAL == 1)
	
	float sphericalAmount =lerp( lerp( sphericalAmountDay, sphericalAmountNight, JKNightDayFactor ), sphericalAmountInterior, JKInteriorFactor );

	float3 signedColor = color.rgb * 2.0 - 1.0;
	float3 sphericalColor = sqrt(1.0 - signedColor.rgb * signedColor.rgb);
	sphericalColor = sphericalColor * 0.5 + 0.5;
	sphericalColor *= color.rgb;
	color.rgb += sphericalColor.rgb * sphericalAmount;
	color.rgb *= 0.95;

#endif

#if (CINEONDPX == 1 )
color = DPXPass(color, JKInteriorFactor, JKNightDayFactor);
#endif


#if (MASTEREFFECT_TONEMAP == 1)
color = TonemapPass(color, JKInteriorFactor, JKNightDayFactor);
#endif

#if (CROSSPROCESS == 1)
color = CrossProcess_PS(color, JKInteriorFactor, JKNightDayFactor);
#endif

/*
#define SAGE_BLOOM		1

#if ( SAGE_BLOOM == 1)

float SAGEBloomDownsampling = 6;
float SAGEBloomThreshold = 0.25;
float SAGEBloomIntensity = 10.2;

float4 sagebloomcol = tex2Dlod(_s0, float4(IN.txcoord0.xy,0,SAGEBloomDownsampling));
sagebloomcol = max(_c6, sagebloomcol - SAGEBloomThreshold);
sagebloomcol = saturate(sagebloomcol * SAGEBloomIntensity);

color = 1-(1-color)*(1-sagebloomcol);
#endif
*/


/////////////////////////////////////////////////////////////////////////////////////////////////
///FINAL COLOR CONTROL CODE//////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

#if(FINAL_ADJUSTMENTS == 1)
	float3 	FinalSaturation 	= lerp( lerp( SaturationDay, SaturationNight, JKNightDayFactor), SaturationInt, JKInteriorFactor );
	float 	FinalBrightness 	= lerp( lerp( BrightnessDay, BrightnessNight, JKNightDayFactor), BrightnessInt, JKInteriorFactor );
	float 	FinalContrast 		= clamp(lerp( lerp( ContrastDay, ContrastNight, JKNightDayFactor), ContrastInt, JKInteriorFactor ), -1.0, 1.0);				
	//convert to linear colorspace
	color.r 		= 1.0/(1.0+color.r);
	color.g 		= 1.0/(1.0+color.g);
	color.b 		= 1.0/(1.0+color.b);
	//reverse gamma correction
	color.rgb 		= pow(color.rgb, 2.2);
	//saturate
	color.rgb 		= lerp(dot(color.rgb,(float3(0.299, 0.587, 0.114))), color.rgb, FinalSaturation);
	//brighten
	color.rgb		/= FinalBrightness;
	//adjust contrast
	float factor 	= (1.0156862745098039215686274509804 * (FinalContrast + 1.0)) / (1.0156862745098039215686274509804 - FinalContrast);
	float newRed   	= saturate(factor * (color.r   - 0.5078431372549019607843137254902) + 0.5078431372549019607843137254902);
	float newGreen 	= saturate(factor * (color.g - 0.5078431372549019607843137254902) + 0.5078431372549019607843137254902);
	float newBlue  	= saturate(factor * (color.b  - 0.5078431372549019607843137254902) + 0.5078431372549019607843137254902);
	color.rgb 		= float3(newRed, newGreen, newBlue);
	//restore gamma correction
	color.rgb 		= pow(color.rgb, 0.45454545454545454545454545454545);
	//restore dynamic range
	color.r 		= (1.0/color.r)-1.0;
	color.g 		= (1.0/color.g)-1.0;
	color.b 		= (1.0/color.b)-1.0;
#endif
/////////////////////////////////////////////////////////////////////////////////////////////////
///ENB PALETTE CODE//////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
	#if( ENB_PALETTE == 1)
	float palmix =lerp( lerp( palmixDay, palmixNight, JKNightDayFactor ), palmixInterior, JKInteriorFactor );

	float3 enbpalcol = tex2D( _s7, 0.5 ).rgb;
	float enbpallum = ( enbpalcol.r + enbpalcol.g + enbpalcol.b );
	if( enbpallum > 0.0 )
	{
		color.rgb = saturate(color.rgb);
		float3	brightness = Adaptation.xyz;
		brightness=max(brightness.x, max(brightness.y, brightness.z));
		float3	palette=0.0;
		float4	uvsrc=0.0;
		uvsrc.x=color.r;
		uvsrc.y=brightness.r;
		palette.r=tex2D(_s7, uvsrc).r;
		uvsrc.x=color.g;
		uvsrc.y=brightness.g;
		palette.g=tex2D(_s7, uvsrc).g;
		uvsrc.x=color.b;
		uvsrc.y=brightness.b;
		palette.b=tex2D(_s7, uvsrc).b;
		color.rgb=palette.rgb * palmix;
	}
	#endif  

/////////////////////////////////////////////////////////////////////////////////////////////////
///ENB LENS DIRT CODE////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

#if ( ENB_PALETTE_LENSDIRT == 1)
	float4 lensdirtpal 		= 	tex2D(_s8, _v0.xy);
	float4 lensdirtbloom 		=	tex2D(_s3, _v0.xy);
		
	lensdirtbloom.xyz -= LensDirtThreshold;
	lensdirtbloom.xyz *= LensDirtPower;
	lensdirtbloom.xyz=max(lensdirtbloom.xyz, 0.0);

	float lensdirtbloomgray = dot(lensdirtbloom.xyz, 0.333);

	color.xyz += lensdirtpal.xyz * lensdirtbloomgray;
#endif



/*
 float4 dereinering = tex2D(_s10, _v0.xy);

float ringsum = (dereinering.x + dereinering.y + dereinering.z)/3;

if(ringsum < 0.95)
{
color = dereinering;
}
*/


/*
float HighSat = 1;
float HighDeSatPower = 2.0;
float HighDeSatThreshold = 0.85;

float HighDeSatLum = dot(color.rgb, 0.333);
HighDeSatLum -= HighDeSatThreshold;
HighDeSatLum = max(HighDeSatLum,0);


HighSat -= HighDeSatLum*HighDeSatPower;


float HighLuma = dot(color.xyz,float3(0.27, 0.67, 0.06));
float3 HighNcolor = normalize(color);
HighNcolor.xyz = pow(HighNcolor.xyz, HighSat);
float HighNluma = dot(HighNcolor.xyz,float3(0.27, 0.67, 0.06));
color.xyz = HighNcolor.xyz*HighLuma/HighNluma;


color *= 1.076;
*/



	

/////////////////////////////////////////////////////////////////////////////////////////////////
///FILM GRAIN CODE///////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////
	#if( ENABLE_GRAIN == 1)
		float fGrainMotion =lerp( lerp( fGrainMotionDay, fGrainMotionNight, JKNightDayFactor ), fGrainMotionInterior, JKInteriorFactor );
		float fGrainSaturation =lerp( lerp( fGrainSaturationDay, fGrainSaturationNight, JKNightDayFactor ), fGrainSaturationInterior, JKInteriorFactor );
		float fGrainIntensity =lerp( lerp( fGrainIntensityDay, fGrainIntensityNight, JKNightDayFactor ), fGrainIntensityInterior, JKInteriorFactor );

	float GrainTimerSeed = Timer.x * fGrainMotion;
	float2 GrainTexCoordSeed = _v0.xy * 1.0;
	float2 GrainSeed1 = GrainTexCoordSeed + float2( 0.0, GrainTimerSeed );
	float2 GrainSeed2 = GrainTexCoordSeed + float2( GrainTimerSeed, 0.0 );
	float2 GrainSeed3 = GrainTexCoordSeed + float2( GrainTimerSeed, GrainTimerSeed );
	float GrainNoise1 = random( GrainSeed1 );
	float GrainNoise2 = random( GrainSeed2 );
	float GrainNoise3 = random( GrainSeed3 );
	float GrainNoise4 = ( GrainNoise1 + GrainNoise2 + GrainNoise3 ) * 0.333333333;
	float3 GrainNoise = float3( GrainNoise4, GrainNoise4, GrainNoise4 );
	float3 GrainColor = float3( GrainNoise1, GrainNoise2, GrainNoise3 );
	color.rgb += ( lerp( GrainNoise, GrainColor, fGrainSaturation ) * fGrainIntensity ) - ( fGrainIntensity * 0.5);
	#endif


	#if ( BORDER == 1)

		#define BUFFER_RCP_WIDTH 	 (1/ScreenSize.x)
		#define BUFFER_RCP_HEIGHT	 (1/(ScreenSize.x * ScreenSize.w))

		#define pixxx BUFFER_RCP_WIDTH
		#define piyyy BUFFER_RCP_HEIGHT
		#define pixxxel float2(pixxx,piyyy)

		float2 distancefromcenter = abs(_v0.xy - 0.5);
		bool2 screen_border = step(0.5 - pixxxel,distancefromcenter);
		color.xyz = (!dot(screen_border, 1.0)) ? color.xyz : 0.0;	

	#endif



#if ( SINCITY == 1)
	float sinlumi = dot(color.rgb, float3(0.30f,0.59f,0.11f));
	if(color.r > (color.g + 0.2f) && color.r > (color.b + 0.025f))
	{
		color.rgb = float3(sinlumi, 0, 0)*1.5;
	}
	else
	{
		color.rgb = sinlumi;
	}
#endif



#if ( COLORMOD == 1)

color.xyz = (color.xyz - dot(color.xyz, 0.333)) * ColormodChroma + dot(color.xyz, 0.333);

color.x = (pow(color.x, ColormodGammaR) - 0.5) * ColormodContrastR + 0.5 + ColormodBrightnessR;
color.y = (pow(color.y, ColormodGammaG) - 0.5) * ColormodContrastG + 0.5 + ColormodBrightnessB;
color.z = (pow(color.z, ColormodGammaB) - 0.5) * ColormodContrastB + 0.5 + ColormodBrightnessB;


#endif








   _oC0.w=1.0;

   _oC0.xyz=color.xyz;
   return _oC0;
}

/////////////////////////////////////////////////////////////////////////////////////////////////
///FLIP TECHNIQUE CODE///////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////

//switch between vanilla and mine post processing
technique Shader_GTASA <string UIName="ENBSeries";>
{
	pass p0
	{
		VertexShader = compile vs_3_0 VS_Quad();
		PixelShader  = compile ps_3_0 PS_GTASA();

		ColorWriteEnable=ALPHA|RED|GREEN|BLUE;
		ZEnable=FALSE;
		ZWriteEnable=FALSE;
		CullMode=NONE;
		AlphaTestEnable=FALSE;
		AlphaBlendEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
	}
}



//original shader of post processing
float4	PS_ORIG(VS_OUTPUT_POST IN) : COLOR
{
	float4 _oC0=tex2D(_s0, IN.txcoord0.xy);
	_oC0.w=1.0;
	return _oC0;
}

technique Shader_ORIGINALPOSTPROCESS <string UIName="Vanilla";>
{
	pass p0
	{
		VertexShader = compile vs_3_0 VS_Quad();
		PixelShader  = compile ps_3_0 PS_ORIG();
		ColorWriteEnable=ALPHA|RED|GREEN|BLUE;
		ZEnable=FALSE;
		ZWriteEnable=FALSE;
		CullMode=NONE;
		AlphaTestEnable=FALSE;
		AlphaBlendEnable=FALSE;
		SRGBWRITEENABLE=FALSE;
    }
}
