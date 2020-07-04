#pragma once
#include "RenderWare.h"
#include "CVector.h"

#define g_CurrentMonthDay (*(unsigned char *)0xB70154)
#define g_CurrentMonth (*(unsigned char *)0xB70155)
#define g_MoonSize (*(unsigned int *)0x8D4B60)
#define g_2DFarScreenZ (*(float *)0xC3EF9C)
#define g_2DNearScreenZ (*(float *)0xC3EFA0)
#define DaysInMoth(month) (*(unsigned char *)(0x8CCF23 + month))

class CMoonphases
{
public:
	static void DrawExecutor();
	static void Draw(CVector *pos, unsigned char color);
	static void Patch();
	static void Load();
	static void Unload();
	static RwTexture *m_pTexture;
	static void InitVertex(int id, float x, float y, unsigned char r, unsigned char g, unsigned char b, unsigned char a, float u, float v);
	static RwIm2DVertex m_Verts[4];
	static float m_fMoonSize;
	static float m_fR, m_fG, m_fB, m_fA;
	static unsigned short m_usSrcBlend, m_usDstBlend;
};