#include <Windows.h>
#include "CLoader.h"

BOOL APIENTRY DllMain(HMODULE module, DWORD reason, LPVOID reserved)
{
    if(reason == DLL_PROCESS_ATTACH)
		CLoader::Patch();
    return TRUE;
}