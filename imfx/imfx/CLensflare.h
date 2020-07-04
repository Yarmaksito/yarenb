#pragma once
#include "CRegisteredCorona.h"
#include "CRGBA.h"
#include "RenderWare.h"
#include "CVector.h"
#include "CPlaceable.h"
#include <stdio.h>
#include "CLoader.h"

#define MAX_SPRITES      30

#define g_GameCamera ((CPlaceable *)0xB6F028)

enum eLensFlareRotation
{
	LENSFLARE_ROTATION_NONE,
	LENSFLARE_ROTATION_IN,
	LENSFLARE_ROTATION_OUT
};

struct CHalo
{
	float distance;
	float point_rotate;
	float width;
	float height;
	float angle;
	unsigned short rotation;
	unsigned char blendSrc;
	unsigned char blendDst;
	CRGBA color;
	RwTexture *texture;
};

struct LoadedTexture
{
	char path[260];
	RwTexture *texture;
};

struct LoadedTextures
{
	unsigned int count;
	LoadedTexture loaded[MAX_SPRITES];
	void Init();
	RwTexture *Get(char *path);
	void Add(char *path, RwTexture *texture);
};

class CLensflare
{
public:
	static void DrawExecutor();
	static void Draw(CRegisteredCorona *corona, CVector *coronaPos, CVector *coronaScreenPos);
	static void DrawHalo(RwTexture *tex, float x, float y, float w, float h, float angle, unsigned char r, unsigned char g, unsigned char b, 
		unsigned char a, char srcBlend, char dstBlend);
	static void Patch();
	static void Read();
	static void Free();
	static CHalo *m_pSettings;
	static unsigned short m_nNumSprites;
	static unsigned short m_nNumTextures;
	static RwTexture **m_pTextures;
};