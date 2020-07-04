#pragma once
#include "CVector.h"
#include "RenderWare.h"
#include "CRGBA.h"

class CRegisteredCorona
{
public:
	CVector        m_vPos;
	int            m_iId;
	RwTexture     *m_pTexture;
	float          m_fSize;
	float          m_fAngle;
	float          m_fFarClip;
	float          m_fNearClip;
	float          m_fHeightAboveGround;
	float          m_fFadeSpeed;
	CRGBA          m_Color;
	unsigned char  m_ucFadeState;
	unsigned char  m_ucRegisteredThisFrame;
	unsigned char  m_ucFlare;
	unsigned char  m_ucUsesReflection;
	unsigned char  m_ucFlags1; /* 0x01 CHECK_OBSTACLES 0x02 OFF_SCREEN */
	unsigned char  m_ucJustCreated;
	unsigned char  m_ucFlags2; /* 0x01 ONLY_AT_LONG_DISTANCE 0x02 ONLY_FROM_BELOW 0x04 REFLECTION_DELAY 0x08 DRAW_WITH_WHITE_CORE 
							  0x10 IS_ATTACHED_TO_VEHICLE */
	char           __padding;
	void          *m_pAttachedTo;
};