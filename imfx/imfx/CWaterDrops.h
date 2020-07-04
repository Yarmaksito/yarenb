#pragma once
#include "RenderWare.h"
#include "CVector.h"

#define MAX_WATER_DROPS 8
#define WATER_DROPS_TIME 3000
#define WATER_DROPS_FADE_TIME 1000
#define CAM_MAX_DISTANCE_SQUARED 0.8

#define IsPedPointerValid(ped) ((char (__cdecl *)(void *))0x5E8A30)(ped)
#define gPlayerPed (*(void **)0xB7CD98)
#define GetPedVehicle(ped) (*(void **)((unsigned int)ped +0x58C))

#define gTimer (*(unsigned int *)0xB7CB84)
#define gScreenWidth (*(unsigned int *)0xC17044)
#define gScreenHeight (*(unsigned int *)0xC17048)
#define gRainDensity (*(float *)0xC81324)
#define gCameraPos ((CVector *)0xB6F338)
#define gCameraDir ((CVector *)0xB6F32C)
#define gCameraSeaDepth (*(float *)0xC8132C)
#define gGameArea (*(int *)0xB72914)

class CWaterDrop
{
public:
	unsigned char active;
	unsigned char size;
	//unsigned short angle;
	unsigned short x, y;
	unsigned int time;
	void Render();
};

class CWaterDrops
{
public:
	static void AddWaterDrop();
	static void Clean();
	static void Update();
	static void Render();
	static void Patch();
	static void Load();
	static void Unload();
	static void CleanExecutor();
	static void UpdateExecutor();
	static void RenderExecutor();
	static CWaterDrop waterDrops[MAX_WATER_DROPS];
	static RwTexture *texture;
};