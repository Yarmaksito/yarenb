#pragma once
#include "CVector.h"

class CColPoint
{
public:
	CVector m_vPoint;
	int __unk1;
	CVector m_vNormal;
	int __unk2;
	unsigned char m_ucSurfaceA;
	unsigned char m_ucComponentA;
	unsigned char m_ucLightingA;
	unsigned char m_ucSurfaceB;
	unsigned char m_ucComponentB;
	unsigned char m_ucLightingB;
	char __unk3[2];
	float m_fDepth;
};