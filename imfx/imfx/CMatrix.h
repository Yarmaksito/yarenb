#pragma once
#include "RenderWare.h"

class CMatrix
{
public:
	RwMatrix  m_mMatrix;
	CMatrix  *m_pMatrixPtr;
	unsigned int m_uiHaveRwMatrix;
};