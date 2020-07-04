#pragma once
#include "RenderWare.h"

class CImVerts
{
public:
	static RwIm2DVertex m_Verts[4];
	static void InitVertex(int id, float x, float y, float z, float rhw, unsigned char r, unsigned char g, unsigned char b, unsigned char a, float u, float v);
};