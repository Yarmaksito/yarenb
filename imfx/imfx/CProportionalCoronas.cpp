#include "CProportionalCoronas.h"
#include <CPatch.h>

void CProportionalCoronas::Patch()
{
	CPatch::Nop(0x6FB2C9, 4);
	CPatch::SetChar(0x6FB2BD, 0x6C);
	CPatch::SetChar(0x6FB2DC, 0x78);
	CPatch::SetChar(0x713BE5, 0x20);
	CPatch::SetChar(0x713B6D, 0x38);
	CPatch::SetChar(0x713CFB, 0x38);
	CPatch::SetChar(0x713EFC, 0x30);
	CPatch::SetChar(0x714004, 0x38);
}