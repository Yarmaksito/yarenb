#pragma once

class CVector
{
public:
	float m_fX, m_fY, m_fZ;
};

#define VectorAdd(a, b, c) ((CVector *( __cdecl *)(CVector *, CVector *, CVector *))0x40FE30)(a, b, c)