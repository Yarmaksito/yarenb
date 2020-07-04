#pragma once
#include "CLensflare.h"
#include <CPatch.h>
#include "CRegisteredCorona.h"
#include <stdio.h>
#include "RenderWare.h"
#include "CVector.h"
#include "CWorld.h"
#include "CPlaceable.h"
#include <math.h>
#include "CImVerts.h"

CHalo *CLensflare::m_pSettings;
unsigned short CLensflare::m_nNumSprites;
unsigned short CLensflare::m_nNumTextures;
RwTexture **CLensflare::m_pTextures;

void LoadedTextures::Init()
{
	this->count = 0;
}

RwTexture *LoadedTextures::Get(char *path)
{
	for(int i = 0; i < this->count; i++)
	{
		if(!strcmp(this->loaded[i].path, path))
			return this->loaded[i].texture;
	}
	return NULL;
}

void LoadedTextures::Add(char *path, RwTexture *texture)
{
	strcpy(this->loaded[this->count].path, path);
	this->loaded[this->count].texture = texture;
	this->count++;
}

void CLensflare::Read()
{
	char line[256];
	char path[256];
	char rotation[4];
	unsigned int r, g, b, a, src, dst;
	RwTexture *texture;
	FILE *file = fopen("imfx\\lensflare.dat", "r");
	LoadedTextures *textures = (LoadedTextures *)malloc(sizeof(LoadedTextures));
	textures->Init();
	m_nNumSprites = 0;
	m_nNumTextures = 0;
	while(!feof(file))
	{
		fgets(line, 256, file);
		if(*line != '#')
		{
			if(!m_nNumSprites)
				m_pSettings = (CHalo *)malloc(sizeof(CHalo));
			else
				m_pSettings = (CHalo *)realloc(m_pSettings, sizeof(CHalo) * (m_nNumSprites + 1));
			sscanf(line, "%f %f %f %f %f %s %d %d %d %d %d %d %s", &m_pSettings[m_nNumSprites].distance, &m_pSettings[m_nNumSprites].point_rotate,
				&m_pSettings[m_nNumSprites].width, &m_pSettings[m_nNumSprites].height, &m_pSettings[m_nNumSprites].angle, rotation, &r, &g, &b, &a,
				&src, &dst, path);
			m_pSettings[m_nNumSprites].color.m_ucRed = r;
			m_pSettings[m_nNumSprites].color.m_ucGreen = g;
			m_pSettings[m_nNumSprites].color.m_ucBlue = b;
			m_pSettings[m_nNumSprites].color.m_ucAlpha = a;
			m_pSettings[m_nNumSprites].blendSrc = src;
			m_pSettings[m_nNumSprites].blendDst = dst;
			if(*rotation == 'i')
				m_pSettings[m_nNumSprites].rotation = LENSFLARE_ROTATION_IN;
			else if(*rotation == 'o')
				m_pSettings[m_nNumSprites].rotation = LENSFLARE_ROTATION_OUT;
			else
				m_pSettings[m_nNumSprites].rotation = LENSFLARE_ROTATION_NONE;
			texture = textures->Get(path);
			if(!texture)
			{
				texture = CLoader::LoadTexture(path);
				textures->Add(path, texture);
				if(!m_nNumTextures)
					m_pTextures = (RwTexture **)malloc(4);
				else
					m_pTextures = (RwTexture **)realloc(m_pTextures, 4 * (m_nNumSprites + 1));
				m_pTextures[m_nNumTextures] = texture;
				m_nNumTextures++;
			}
			m_pSettings[m_nNumSprites].texture = texture;
			m_nNumSprites++;
			if(m_nNumSprites >= MAX_SPRITES)
				break;
		}
	}
	fclose(file);
	free(textures);
}

void CLensflare::Draw(CRegisteredCorona *corona, CVector *coronaPos, CVector *coronaScreenPos)
{
	void *entity;
	CColPoint point;
	CVector *camPos;
	float screenHalfX, screenHalfY, x, y, angle, dot, xold, yold;
	screenHalfX = (float)(g_Camera->frameBuffer->width / 2);
	screenHalfY = (float)(g_Camera->frameBuffer->height / 2);
	if(corona->m_ucFlare == 1)
	{
		if(g_GameCamera->m_pCoords)
			camPos = (CVector *)&g_GameCamera->m_pCoords->m_mMatrix.pos;
        else
			camPos = &g_GameCamera->m_vPos;
		g_IgnoringEntity = g_CameraEntity;
		if(!ProcessLineOfSight(coronaPos, camPos, &point, &entity, 0, 1, 1, 0, 0, 0, 0))
		{
			RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEZTESTENABLE, FALSE);
			for(int i = 0; i < m_nNumSprites; i++)
			{
				x = (coronaScreenPos->m_fX - screenHalfX) * m_pSettings[i].distance + screenHalfX;
				y = (coronaScreenPos->m_fY - screenHalfY) * m_pSettings[i].distance + screenHalfY;
				if(m_pSettings[i].point_rotate != 0.0)
				{
					angle = m_pSettings[i].point_rotate / 57.295776;
					float xold = x;
					float yold = y;
					x = coronaScreenPos->m_fX + (xold - coronaScreenPos->m_fX) * cos(angle) + (yold - coronaScreenPos->m_fY) * sin(angle);
					y = coronaScreenPos->m_fY - (xold - coronaScreenPos->m_fX) * sin(angle) + (yold - coronaScreenPos->m_fY) * cos(angle);
				}
				if(m_pSettings[i].rotation)
				{
					angle = atan2(y - coronaScreenPos->m_fY, x - coronaScreenPos->m_fX) - 1.570796326794;
					if(m_pSettings[i].rotation == LENSFLARE_ROTATION_IN)
						angle *= -1.0;
				}
				else
					angle = 0.0;
				angle += m_pSettings[i].angle / 57.295776;
				DrawHalo(m_pSettings[i].texture, x, y, m_pSettings[i].width * 4, m_pSettings[i].height * 4, angle, m_pSettings[i].color.m_ucRed, 
					m_pSettings[i].color.m_ucGreen, m_pSettings[i].color.m_ucBlue, m_pSettings[i].color.m_ucAlpha, m_pSettings[i].blendSrc, 
					m_pSettings[i].blendDst);
			}
			RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEZTESTENABLE, (void *)TRUE);
			RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATETEXTURERASTER, 0);
			RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATESRCBLEND, (void *)rwBLENDONE);
			RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEDESTBLEND, (void *)rwBLENDONE);
		}
		g_IgnoringEntity = NULL;
	}
}

void CLensflare::DrawHalo(RwTexture *tex, float x, float y, float w, float h, float angle, unsigned char r, unsigned char g, unsigned char b, 
	unsigned char a, char srcBlend, char dstBlend)
{
	float xold, yold;
	float x1 = x - w / 2;
	float y1 = y - h / 2;
	float x2 = x + w / 2;
	float y2 = y + h / 2;
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATETEXTURERASTER, tex->raster);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATESRCBLEND, (void *)srcBlend);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEDESTBLEND, (void *)dstBlend);
	CImVerts::InitVertex(0, x1, y1, 0.0, 3.33, r, g, b, a, 0.0, 0.0);
	CImVerts::InitVertex(1, x2, y1, 0.0, 3.33, r, g, b, a, 1.0, 0.0);
	CImVerts::InitVertex(2, x2, y2, 0.0, 3.33, r, g, b, a, 1.0, 1.0);
	CImVerts::InitVertex(3, x1, y2, 0.0, 3.33, r, g, b, a, 0.0, 1.0);
	if(angle != 0.0)
	{
		for(int i = 0; i < 4; i++)
	    {
	    	xold = CImVerts::m_Verts[i].x;
	    	yold = CImVerts::m_Verts[i].y;
	    	CImVerts::m_Verts[i].x = x + (xold - x) * cos(angle) + (yold - y) * sin(angle);
	    	CImVerts::m_Verts[i].y = y - (xold - x) * sin(angle) + (yold - y) * cos(angle);
	    }
	}
	RwEngineInstance->dOpenDevice.fpIm2DRenderPrimitive(rwPRIMTYPETRIFAN, CImVerts::m_Verts, 4);
}

void CLensflare::Free()
{
	for(int i = 0; i < m_nNumTextures; i++)
		RwTextureDestroy(m_pTextures[i]);
	free(m_pTextures);
	free(m_pSettings);
}

void __declspec(naked)CLensflare::DrawExecutor()
{
	__asm
	{
		lea  eax, [esp+0x20]
		push eax
		lea  eax, [esp+0x30]
		push eax
		lea  eax, [edi-0x38]
		push eax
		call Draw
		add  esp, 0xC
		mov  eax, 0x6FB605
		jmp  eax
	}
}

void CLensflare::Patch()
{
	CPatch::RedirectJump(0x6FB2EE, DrawExecutor); // CCoronas::Render
}