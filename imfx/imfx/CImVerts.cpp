#include "CImVerts.h"

RwIm2DVertex CImVerts::m_Verts[4];

void CImVerts::InitVertex(int id, float x, float y, float z, float rhw, unsigned char r, unsigned char g, unsigned char b, unsigned char a, float u, float v)
{
	m_Verts[id].x = x;
	m_Verts[id].y = y;
	m_Verts[id].z = z;
	m_Verts[id].rhw = rhw;
	m_Verts[id].emissiveColor = RWRGBALONG(r, g, b, a);
	m_Verts[id].u = u;
	m_Verts[id].v = v;
}