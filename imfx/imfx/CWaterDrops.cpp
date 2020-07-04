#include "CWaterDrops.h"
#include "CImVerts.h"
#include "CLoader.h"
#include "CVector.h"
#include "CMatrix.h"
#include "RenderWare.h"
#include <Windows.h>
#include <math.h>
#include <CPatch.h>

CWaterDrop CWaterDrops::waterDrops[MAX_WATER_DROPS];
RwTexture *CWaterDrops::texture;

void CWaterDrop::Render()
{
	//float xold, yold;
	float x1 = (float)this->x - (float)this->size / 2.0;
	float y1 = (float)this->y - (float)this->size / 2.0;
	float x2 = (float)this->x + (float)this->size / 2.0;
	float y2 = (float)this->y + (float)this->size / 2.0;
	unsigned char alpha = gTimer > this->time + WATER_DROPS_TIME ? (gTimer - (this->time + WATER_DROPS_TIME)) * -(255.0 / (float)WATER_DROPS_FADE_TIME) : 255;
	CImVerts::InitVertex(0, x1, y1, 0.0, 3.33, 255, 255, 255, alpha, 0.0, 0.0);
	CImVerts::InitVertex(1, x2, y1, 0.0, 3.33, 255, 255, 255, alpha, 1.0, 0.0);
	CImVerts::InitVertex(2, x2, y2, 0.0, 3.33, 255, 255, 255, alpha, 1.0, 1.0);
	CImVerts::InitVertex(3, x1, y2, 0.0, 3.33, 255, 255, 255, alpha, 0.0, 1.0);
	/*for(int i = 0; i < 4; i++)
	{
		xold = CImVerts::m_Verts[i].x;
		yold = CImVerts::m_Verts[i].y;
		CImVerts::m_Verts[i].x = (float)this->x + (xold - (float)this->x) * cos((float)this->angle) + (yold - (float)this->y) * sin((float)this->angle);
		CImVerts::m_Verts[i].y = (float)this->y - (xold - (float)this->x) * sin((float)this->angle) + (yold - (float)this->y) * cos((float)this->angle);
	}*/
	RwEngineInstance->dOpenDevice.fpIm2DRenderPrimitive(rwPRIMTYPETRIFAN, CImVerts::m_Verts, 4);
}

void CWaterDrops::Load()
{
	texture = CLoader::LoadTexture("imfx\\screenwater.png");
}

void CWaterDrops::Unload()
{
	RwTextureDestroy(texture);
}

void CWaterDrops::Clean()
{
	for(int i = 0; i < MAX_WATER_DROPS; i++)
		CWaterDrops::waterDrops[i].active = FALSE;
}

void CWaterDrops::Update()
{
	CVector camTarget;
	float dx, dy, dot;
	CMatrix *m;
	void *playerVehicle;
	if(!(rand() % 75) && gRainDensity > 0.0 && !CALLVOIDRETCHAR(0x72DDC0) && gCameraSeaDepth <= 0.0 && !gGameArea)
	{
		VectorAdd(&camTarget, gCameraPos, gCameraDir);
		if(gCameraPos->m_fZ < camTarget.m_fZ)
		{
			dx = camTarget.m_fX - gCameraPos->m_fX;
			dy = camTarget.m_fY - gCameraPos->m_fY;
			if(dx * dx + dy * dy < CAM_MAX_DISTANCE_SQUARED)
				CWaterDrops::AddWaterDrop();
		}
	}
	if(!(rand() % 75) && IsPedPointerValid(gPlayerPed) && gCameraSeaDepth <= 0.0)
	{
		playerVehicle = GetPedVehicle(gPlayerPed);
		if(playerVehicle)
		{
			m = *(CMatrix **)((unsigned int)playerVehicle + 0x14);
			if(m && gCameraDir->m_fX * m->m_mMatrix.up.x + gCameraDir->m_fY * m->m_mMatrix.up.y > 0.0)
			{
				for(int i = 0xC27994; i < 0xC279A4; i += 4)
				{
					if(playerVehicle == READPVOID(i))
						CWaterDrops::AddWaterDrop();
				}
			}
		}
	}
	for(int i = 0; i < MAX_WATER_DROPS; i++)
	{
		if(CWaterDrops::waterDrops[i].active)
		{
			if(gTimer - CWaterDrops::waterDrops[i].time > WATER_DROPS_TIME + WATER_DROPS_FADE_TIME)
				CWaterDrops::waterDrops[i].active = FALSE;
		}
	}
}

void CWaterDrops::AddWaterDrop()
{
	for(int i = 0; i < MAX_WATER_DROPS; i++)
	{
		if(!CWaterDrops::waterDrops[i].active)
		{
			CWaterDrops::waterDrops[i].active = TRUE;
			CWaterDrops::waterDrops[i].time = gTimer;
			CWaterDrops::waterDrops[i].size = rand() % 80 + 120;
			//CWaterDrops::waterDrops[i].angle = rand() % 360; removed random rotation
			CWaterDrops::waterDrops[i].x = rand() % (gScreenWidth - 200) + 100;
			CWaterDrops::waterDrops[i].y = rand() % (gScreenHeight - 200) + 100;
			break;
		}
	}
}

void CWaterDrops::Render()
{
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATETEXTURERASTER, CWaterDrops::texture->raster);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATESRCBLEND, (void *)5);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEDESTBLEND, (void *)6);
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEVERTEXALPHAENABLE, (void *)TRUE);
	for(int i = 0; i < MAX_WATER_DROPS; i++)
	{
		if(CWaterDrops::waterDrops[i].active)
			CWaterDrops::waterDrops[i].Render();
	}
	RwEngineInstance->dOpenDevice.fpRenderStateSet(rwRENDERSTATEVERTEXALPHAENABLE, FALSE);
}

void CWaterDrops::CleanExecutor()
{
	Clean();
	CALLVOID(0x724E40);
}

void CWaterDrops::UpdateExecutor()
{
	Update();
	CALLVOID(0x7229C0);
}

void CWaterDrops::RenderExecutor()
{
	Render();
	CALLVOID(0x7240E0);
}

void CWaterDrops::Patch()
{
	CPatch::RedirectCall(0x7269FA, CleanExecutor);
	CPatch::RedirectCall(0x726AC2, UpdateExecutor);
	CPatch::RedirectCall(0x726AD0, RenderExecutor);
}