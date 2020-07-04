#pragma once

#define AddPermanentShadow(type, texture, pos, x1, y1, x2, y2, intensity, r, g, b, a, distnce, time, scale) ((void (__cdecl *)(unsigned char, \
	RwTexture *, CVector *, float, float, float, float, unsigned short, unsigned char, unsigned char, unsigned char, unsigned char, float, \
	unsigned int, float))0x706F60)(type, texture, pos, x1, y1, x2, y2, intensity, r, g, b, a, distnce, time, scale)