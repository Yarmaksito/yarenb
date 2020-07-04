#include "CMoonphases.h"
#include "RenderWare.h"
#include "CLoader.h"
#include <CPatch.h>
#include "CImVerts.h"
#include <math.h>
#include <stdio.h>

RwTexture *CMoonphases::m_pTexture;
float CMoonphases::m_fMoonSize;
float CMoonphases::m_fR, CMoonphases::m_fG, CMoonphases::m_fB, CMoonphases::m_fA;
unsigned short CMoonphases::m_usSrcBlend, CMoonphases::m_usDstBlend;

void CMoonphases::Load()
{
	char line[256];
	char path[256];
	unsigned int srcBlend, dstBlend;
	FILE *file = fopen("imfx\\moonphases.dat", "r");
	do
		fgets(line, 256, file);
	while(*line == '#');
	sscanf(line, "%s", path);
	m_pTexture = CLoader::LoadTexture(path);
	do
		fgets(line, 256, file);
	while(*line == '#');
	sscanf(line, "%f", &m_fMoonSize);
	do
		fgets(line, 256, file);
	while(*line == '#');
	sscanf(line, "%f %f %f %f", &m_fR, &m_fG, &m_fB, &m_fA);
	do
		fgets(line, 256, file);
	while(*line == '#');
	sscanf(line, "%d %d", &srcBlend, &dstBlend);
	m_usSrcBlend = srcBlend;
	m_usDstBlend = dstBlend;
	fclose(file);
}

void CMoonphases::Draw(CVector *pos, unsigned char color)
{
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATESRCBLEND, (void *)m_usSrcBlend);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEDESTBLEND, (void *)m_usDstBlend);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEZWRITEENABLE, FALSE);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATETEXTURERASTER, m_pTexture->raster);
	float h = m_fMoonSize * 10.0 * ((float)g_MoonSize + (float)g_MoonSize + 4.0) / 2.0;
	float x1 = pos->m_fX - h;
	float y1 = pos->m_fY - h;
	float x2 = pos->m_fX + h;
	float y2 = pos->m_fY + h;
	float rhw = 1.0 / g_2DFarScreenZ;
	unsigned char r = color * m_fR;
	unsigned char g = color * m_fG;
	unsigned char b = color * m_fB;
	unsigned char a = color * m_fA;
	unsigned char id = (unsigned char)((float)(g_CurrentMonthDay - 1)/(float)(DaysInMoth(g_CurrentMonth) - 1) * 23.0);
	float z = (RwEngineInstance->dOpenDevice.zBufferFar - RwEngineInstance->dOpenDevice.zBufferNear) * (g_2DFarScreenZ - g_2DNearScreenZ) * 
		g_2DFarScreenZ / ((g_2DFarScreenZ - g_2DNearScreenZ) * g_2DFarScreenZ);
	float v = id / 4;
	float u = (id - (v * 4)) * 0.25;
	v *= 0.1666666666666667;
	CImVerts::InitVertex(0, x1, y1, z, rhw, r, g, b, a, u, v);
	CImVerts::InitVertex(1, x2, y1, z, rhw, r, g, b, a, u + 0.25, v);
	CImVerts::InitVertex(2, x2, y2, z, rhw, r, g, b, a, u + 0.25, v + 0.1666666666666667);
	CImVerts::InitVertex(3, x1, y2, z, rhw, r, g, b, a, u, v + 0.1666666666666667);
	RwEngineInstance->dOpenDevice.fpIm2DRenderPrimitive(rwPRIMTYPETRIFAN, CImVerts::m_Verts, 4);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATESRCBLEND, (void *)rwBLENDONE);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEDESTBLEND, (void *)rwBLENDONE);
}

void CMoonphases::Unload()
{
	RwTextureDestroy(m_pTexture);
}

void __declspec(naked)CMoonphases::DrawExecutor()
{
	__asm
	{
		push esi
		lea  eax, [esp+0x28]
		push eax
		call Draw
		add  esp, 8
		mov  eax, 0x713D24
		jmp  eax
	}
}

void CMoonphases::Patch()
{
	CPatch::RedirectJump(0x713ACB, DrawExecutor); // CClouds::Render
}