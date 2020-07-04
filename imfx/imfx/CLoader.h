#pragma once
#include "RenderWare.h"

class CLoader
{
public:
	static void Patch();
	static void LoadExecutor();
	static void UnloadExecutor();
	static void Load();
	static void Unload();
	static RwTexture *LoadTexture(char *path);
};