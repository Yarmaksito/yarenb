#pragma once
#include "CVector.h"
#include "CColPoint.h"

#define ProcessLineOfSight(start, end, colPoint, pEntity, buildings, vehicles, peds, objects, dummies, seeThrough, camera) ((unsigned char \
	(__cdecl *)(CVector *, CVector *, CColPoint *, void *, unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, unsigned char, \
	unsigned char))0x56BA00)(start, end, colPoint, pEntity, buildings, vehicles, peds, objects, dummies, seeThrough, camera)

#define g_IgnoringEntity (*(void **)0xB7CD68)
#define g_CameraEntity (*(void **)0xB6F5F0)