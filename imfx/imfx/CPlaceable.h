#pragma once
#include "CVector.h"
#include "CMatrix.h"

class CPlaceable
{
	void *__vmt;
public:
	CVector  m_vPos;
	float    m_fHeading;
	CMatrix *m_pCoords;
};