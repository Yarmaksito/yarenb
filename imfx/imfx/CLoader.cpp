#include "CLoader.h"
#include <CPatch.h>
#include "CLensflare.h"
#include "RenderWare.h"
#include "CMoonphases.h"
#include "CProportionalCoronas.h"
#include "CWaterDrops.h"

RwTexture *CLoader::LoadTexture(char *path)
{
	unsigned int width, height, depth, flags;
	RwImage *image = RtPNGImageRead(path);
	RwImageFindRasterFormat(image, 4, &width, &height, &depth, &flags);
	RwRaster *raster = RwRasterCreate(width, height, depth, flags);
	RwRasterSetFromImage(raster, image);
	RwImageDestroy(image);
	return RwTextureCreate(raster);
}

void CLoader::Patch()
{
	CPatch::RedirectCall(0x6FAA73, LoadExecutor);   // CCoronas::Init
	CPatch::RedirectJump(0x6FAB01, UnloadExecutor); // CCoronas::Shutdown
	CLensflare::Patch();
	CMoonphases::Patch();
	CProportionalCoronas::Patch();
	CWaterDrops::Patch();
}

void CLoader::Load()
{
	CLensflare::Read();
	CMoonphases::Load();
	CWaterDrops::Load();
}

void CLoader::Unload()
{
	CLensflare::Free();
	CMoonphases::Unload();
	CWaterDrops::Unload();
}

void __declspec(naked)CLoader::LoadExecutor()
{
	__asm
	{
		call Load
		mov  eax, 0x7316A0
		call eax
		retn
	}
}

void __declspec(naked)CLoader::UnloadExecutor()
{
	__asm
	{
		call Unload
		mov  esi, 0xC3E000
		mov  eax, 0x6FAB06
		jmp  eax
	}
}