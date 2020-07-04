#pragma once
#include "RenderWare.h"
#include "CVector.h"

#define GetPlayerClothesTextureCRC(playerPed, bodyPart) 

class CBloodSpots
{
public:
	static void DoFootstep(unsigned char type, RwTexture *texture, CVector *pos, float x1, float y1, float x2, float y2, unsigned short intensity,
		unsigned char r, unsigned char g, unsigned char b, unsigned char a, float distnce, unsigned int time, float scale);
	static RwTexture *m_pFootStepTex;
	static RwTexture 
};