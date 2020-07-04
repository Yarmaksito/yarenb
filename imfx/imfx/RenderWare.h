#pragma once

#define RWFORCEENUMSIZEINT ((int)((~((unsigned int)0))>>1))
#define RWRGBALONG(r,g,b,a) ((unsigned int) (((a) << 24) | ((r) << 16) | ((g) << 8) | (b)))

#define RtPNGImageRead(path) ((RwImage *(__cdecl *)(char *))0x7CF9B0)(path)
#define RwImageFindRasterFormat(image, rasterType, width, height, depth, format) ((RwImage *(__cdecl *)(RwImage *, unsigned int, unsigned int *, \
	unsigned int *, unsigned int *, unsigned int *))0x8042C0)(image, rasterType, width, height, depth, format)
#define RwRasterCreate(width, height, depth, flags) ((RwRaster *(__cdecl *)(unsigned int, unsigned int, unsigned int, unsigned int))0x7FB230)(width, \
	height, depth, flags)
#define RwRasterSetFromImage(raster, image) ((RwRaster *(__cdecl *)(RwRaster *, RwImage *))0x804290)(raster, image)
#define RwImageDestroy(image) ((bool (__cdecl *)(RwImage *))0x802740)(image)
#define RwTextureCreate(raster) ((RwTexture *(__cdecl *)(RwRaster *))0x7F37C0)(raster)
#define RwTextureDestroy(texture) ((unsigned int (__cdecl *)(RwTexture *))0x7F3820)(texture)

struct RwObject
{
    unsigned char  type;
    unsigned char  subType;
    unsigned char  flags;
    unsigned char  privateFlags;
	void          *parent;
};

struct RwLLLink
{
    RwLLLink *next;
    RwLLLink *prev;
};

struct RwLinkList
{
    RwLLLink link;
};

struct RwFreeList
{
    unsigned int   entrySize;
    unsigned int   entriesPerBlock;
    unsigned int   heapSize;
    unsigned int   alignment;
    RwLinkList     blockList;
    unsigned int   flags;
    RwLLLink       link;
};

struct RwTexDictionary
{
    RwObject         object;
    RwLinkList       texturesInDict;
    RwLLLink         lInInstance;
	RwTexDictionary *parent;
};

struct RwRaster
{
    RwRaster      *parent;
    unsigned char *cpPixels;
    unsigned char *palette;
    int            width, height, depth;
    int            stride;
    short          nOffsetX, nOffsetY;
    unsigned char  cType;
    unsigned char  cFlags;
    unsigned char  privateFlags;
    unsigned char  cFormat;
    unsigned char *originalPixels;
    int            originalWidth;
    int            originalHeight;
    int            originalStride;
#ifdef _D3D9_H_
    struct
    {
        union
        {
            IDirect3DTexture9 *texture;
            IDirect3DSurface9 *surface;
        };
        unsigned char       *palette;
        unsigned char        alpha;
        unsigned char        cubeTextureFlags; /* 0x01 IS_CUBEMAP_TEX */
        unsigned char        textureFlags;     /* 0x01 HAS_MIP_MAPS
                                                  0x10 IS_COMPRESSED */
        unsigned char        lockFlags;
        IDirect3DSurface9   *lockedSurface;
        D3DLOCKED_RECT       lockedRect;
        D3DFORMAT            format;
        IDirect3DSwapChain9 *swapChain;
        HWND                *hwnd;
    } RwD3D9Raster;
#endif
};

struct RwTexture
{
    RwRaster        *raster;
    RwTexDictionary *dict;
    RwLLLink        lInDictionary;
    char            name[32];
    char            mask[32];
    unsigned int    filterAddressing;
    int             refCount;
    unsigned char   maxAnisotropy;
    char            pad[3];
};

struct RwRGBA
{
    unsigned char red; 
    unsigned char green;
    unsigned char blue;
    unsigned char alpha;
};

struct RwImage
{
    int            flags;
    int            width;
    int            height;
    int            depth;
    int            stride;
    unsigned char *cpPixels;
    RwRGBA        *palette;
};

struct RwMemoryFunctions
{
    void *(*rwmalloc)(size_t size, unsigned int hint);
    void  (*rwfree)(void *mem);
    void *(*rwrealloc)(void *mem, size_t newSize, unsigned int hint);
    void *(*rwcalloc)(size_t numObj, size_t sizeObj, unsigned int hint);
};

struct RwD3D9Vertex
{
    float        x;
    float        y;
    float        z;
    float        rhw;
    unsigned int emissiveColor;
    float        u;
    float        v;
};

typedef RwD3D9Vertex    RwIm2DVertex;

enum RwRenderState
{
    rwRENDERSTATENARENDERSTATE = 0,
    rwRENDERSTATETEXTURERASTER,
    rwRENDERSTATETEXTUREADDRESS,
    rwRENDERSTATETEXTUREADDRESSU,
    rwRENDERSTATETEXTUREADDRESSV,
    rwRENDERSTATETEXTUREPERSPECTIVE,
    rwRENDERSTATEZTESTENABLE,
    rwRENDERSTATESHADEMODE,
    rwRENDERSTATEZWRITEENABLE,
    rwRENDERSTATETEXTUREFILTER,
    rwRENDERSTATESRCBLEND,
    rwRENDERSTATEDESTBLEND,
    rwRENDERSTATEVERTEXALPHAENABLE,
    rwRENDERSTATEBORDERCOLOR,
    rwRENDERSTATEFOGENABLE,
    rwRENDERSTATEFOGCOLOR,
    rwRENDERSTATEFOGTYPE,
    rwRENDERSTATEFOGDENSITY,
    rwRENDERSTATECULLMODE = 20,
    rwRENDERSTATESTENCILENABLE,
    rwRENDERSTATESTENCILFAIL,
    rwRENDERSTATESTENCILZFAIL,
    rwRENDERSTATESTENCILPASS,
    rwRENDERSTATESTENCILFUNCTION,
    rwRENDERSTATESTENCILFUNCTIONREF,
    rwRENDERSTATESTENCILFUNCTIONMASK,
    rwRENDERSTATESTENCILFUNCTIONWRITEMASK,
    rwRENDERSTATEALPHATESTFUNCTION,
    rwRENDERSTATEALPHATESTFUNCTIONREF,
    rwRENDERSTATEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

enum RwBlendFunction
{
    rwBLENDNABLEND = 0,		 // 0
    rwBLENDZERO,			 // 1
    rwBLENDONE,				 // 2
    rwBLENDSRCCOLOR,		 // 3
    rwBLENDINVSRCCOLOR,		 // 4
    rwBLENDSRCALPHA,		 // 5
    rwBLENDINVSRCALPHA,		 // 6
    rwBLENDDESTALPHA,		 // 7
    rwBLENDINVDESTALPHA,	 // 8
    rwBLENDDESTCOLOR,		 // 9
    rwBLENDINVDESTCOLOR,	 // 10
    rwBLENDSRCALPHASAT,		 // 11
    rwBLENDFUNCTIONFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

enum RwPrimitiveType
{
    rwPRIMTYPENAPRIMTYPE = 0,
    rwPRIMTYPELINELIST = 1,
    rwPRIMTYPEPOLYLINE = 2,
    rwPRIMTYPETRILIST = 3,
    rwPRIMTYPETRISTRIP = 4,
    rwPRIMTYPETRIFAN = 5,
    rwPRIMTYPEPOINTLIST = 6,
    rwPRIMITIVETYPEFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

enum RwEngineStatus
{
    rwENGINESTATUSIDLE = 0,
    rwENGINESTATUSINITED = 1,
    rwENGINESTATUSOPENED = 2,
    rwENGINESTATUSSTARTED = 3,
    rwENGINESTATUSFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

typedef unsigned short  RwImVertexIndex;

typedef int (*vecSprintfFunc)(char *buffer, const char *format, ...); 
typedef int (*vecVsprintfFunc)(char *buffer, const char *format, char *argptr); 
typedef char *(*vecStrcpyFunc)(char *dest, const char *srce);
typedef char *(*vecStrncpyFunc)(char *dest, const char *srce, size_t size);
typedef char *(*vecStrcatFunc)(char *dest, const char *srce);
typedef char *(*vecStrncatFunc)(char *dest, const char *srce, size_t size);
typedef char *(*vecStrrchrFunc)(const char *string, int findThis);
typedef char *(*vecStrchrFunc)(const char *string, int findThis);
typedef char *(*vecStrstrFunc)(const char *string, const char *findThis);
typedef int (*vecStrcmpFunc)(const char *string1, const char *string2);
typedef int (*vecStrncmpFunc)(const char *string1, const char *string2, size_t max_size);
typedef int (*vecStricmpFunc)(const char *string1, const char *string2);
typedef size_t (*vecStrlenFunc)(const char *string);
typedef char *(*vecStruprFunc)(char *string);
typedef char *(*vecStrlwrFunc)(char *string);
typedef char *(*vecStrtokFunc)(char *string, const char *delimit);
typedef int (*vecSscanfFunc)(const char *buffer, const char *format, ...);
typedef int(*RwSystemFunc)(int nOption, void *pOut, void *pInOut, int nIn);
typedef int(*RwRenderStateSetFunction)(RwRenderState nState,void *pParam);
typedef int(*RwRenderStateGetFunction)(RwRenderState nState,void *pParam);
typedef int(*RwIm2DRenderLineFunction)(RwIm2DVertex *vertices, int numVertices, int vert1, int vert2);
typedef int(*RwIm2DRenderTriangleFunction)(RwIm2DVertex *vertices, int numVertices, int vert1, int vert2, int vert3);
typedef int(*RwIm2DRenderPrimitiveFunction)(RwPrimitiveType primType, RwIm2DVertex *vertices, int numVertices);
typedef int(*RwIm2DRenderIndexedPrimitiveFunction)(RwPrimitiveType primType, RwIm2DVertex *vertices, int numVertices, RwImVertexIndex *indices, int numIndices);
typedef int(*RwIm3DRenderLineFunction)(int vert1, int vert2);
typedef int(*RwIm3DRenderTriangleFunction)(int vert1, int vert2, int vert3);
typedef int(*RwIm3DRenderPrimitiveFunction)(RwPrimitiveType primType);
typedef int(*RwIm3DRenderIndexedPrimitiveFunction)(RwPrimitiveType primtype, RwImVertexIndex *indices, int numIndices);
typedef int(*RwStandardFunc)(void *pOut, void *pInOut, int nI);
typedef void       *(*RwMemoryAllocFn)    (RwFreeList * fl, unsigned int hint);
typedef RwFreeList *(*RwMemoryFreeFn)     (RwFreeList * fl, void *pData);

struct RwStringFunctions
{
    vecSprintfFunc vecSprintf ;
    vecVsprintfFunc vecVsprintf;
    vecStrcpyFunc vecStrcpy;
    vecStrncpyFunc vecStrncpy;
    vecStrcatFunc vecStrcat;
    vecStrncatFunc vecStrncat;
    vecStrrchrFunc vecStrrchr;
    vecStrchrFunc vecStrchr;
    vecStrstrFunc vecStrstr;
    vecStrcmpFunc vecStrcmp;
    vecStrncmpFunc vecStrncmp;
    vecStricmpFunc vecStricmp;
    vecStrlenFunc vecStrlen;
    vecStruprFunc vecStrupr;
    vecStrlwrFunc vecStrlwr;
    vecStrtokFunc vecStrtok;
    vecSscanfFunc vecSscanf;
};

struct RwDevice
{
    float                                gammaCorrection;
    RwSystemFunc                         fpSystem;
    float                                zBufferNear;
    float                                zBufferFar;
    RwRenderStateSetFunction             fpRenderStateSet;
    RwRenderStateGetFunction             fpRenderStateGet;
    RwIm2DRenderLineFunction             fpIm2DRenderLine;
    RwIm2DRenderTriangleFunction         fpIm2DRenderTriangle;
    RwIm2DRenderPrimitiveFunction        fpIm2DRenderPrimitive;
    RwIm2DRenderIndexedPrimitiveFunction fpIm2DRenderIndexedPrimitive;
    RwIm3DRenderLineFunction             fpIm3DRenderLine;
    RwIm3DRenderTriangleFunction         fpIm3DRenderTriangle;
    RwIm3DRenderPrimitiveFunction        fpIm3DRenderPrimitive;
    RwIm3DRenderIndexedPrimitiveFunction fpIm3DRenderIndexedPrimitive;
};

struct RwMetrics
{
    unsigned int  numTriangles;
    unsigned int  numProcTriangles;
    unsigned int  numVertices;
    unsigned int  numTextureUploads;
    unsigned int  sizeTextureUploads;
    unsigned int  numResourceAllocs;
    void         *devSpecificMetrics;
};

struct RwGlobals
{
	void               *curCamera;
	void               *curWorld;
	unsigned short      renderFrame;
	unsigned short      lightFrame;
	unsigned short      pad[2];
	RwDevice            dOpenDevice;
	RwStandardFunc      stdFunc[29];
	RwLinkList          dirtyFrameList;
	void               *fileFuncs[0xB];
	RwStringFunctions   stringFuncs;
	RwMemoryFunctions   memoryFuncs;
	RwMemoryAllocFn     memoryAlloc;
	RwMemoryFreeFn      memoryFree;
	RwMetrics          *metrics;
	RwEngineStatus      engineStatus;
	unsigned int        resArenaInitSize;
};

typedef struct RwObjectHasFrame RwObjectHasFrame;
typedef RwObjectHasFrame * (*RwObjectHasFrameSyncFunction)(RwObjectHasFrame *object);

struct RwObjectHasFrame
{
    RwObject                     object;
    RwLLLink                     lFrame;
    RwObjectHasFrameSyncFunction sync;
};

enum RwCameraProjection
{
    rwNACAMERAPROJECTION = 0,
    rwPERSPECTIVE = 1,
    rwPARALLEL = 2,
    rwCAMERAPROJECTIONFORCEENUMSIZEINT = RWFORCEENUMSIZEINT
};

typedef struct RwCamera RwCamera;

typedef RwCamera   *(*RwCameraBeginUpdateFunc) (RwCamera * camera);
typedef RwCamera   *(*RwCameraEndUpdateFunc) (RwCamera * camera);

struct RwV2d
{
    float x;
    float y;
};

struct RwV3d
{
    float x;
    float y;
    float z;
};

struct RwMatrix
{
    RwV3d        right;
    unsigned int flags;
    RwV3d        up;
    unsigned int pad1;
    RwV3d        at;
    unsigned int pad2;
    RwV3d        pos;
    unsigned int pad3;
};

struct RwBBox
{
    RwV3d sup;
    RwV3d inf;
};

struct RwPlane
{
    RwV3d normal;
    float distance;
};

struct RwFrustumPlane
{
    RwPlane       plane;
    unsigned char closestX;
    unsigned char closestY;
    unsigned char closestZ;
    unsigned char pad;
};

struct RwCamera
{
    RwObjectHasFrame         object;
    RwCameraProjection       projectionType;
    RwCameraBeginUpdateFunc  beginUpdate;
    RwCameraEndUpdateFunc    endUpdate;
    RwMatrix                 viewMatrix;
    RwRaster                *frameBuffer;
    RwRaster                *zBuffer;
    RwV2d                    viewWindow;
    RwV2d                    recipViewWindow;
    RwV2d                    viewOffset;
    float                    nearPlane;
    float                    farPlane;
    float                    fogPlane;
    float                    zScale, zShift;
    RwFrustumPlane           frustumPlanes[6];
    RwBBox                   frustumBoundBox;
    RwV3d                    frustumCorners[8];
};

#define RwEngineInstance (*(RwGlobals **)0xC97B24)
#define g_Camera (*(RwCamera **)0xC1703C)