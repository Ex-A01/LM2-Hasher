import std.math;

enum chunkType : u16{
PointerList = 0x7003,
FENL_Data = 0x7002,
UI_File = 0x7000,
FENL_Header = 0x7001
};

struct Chunk{
chunkType Type ;
u16 Flags ;
u32 Size ;
u32 offset ;
};

struct ChunkChild{
u16 Type;
u16 Flags;
u32 ChildrenCount;
u32 ChildStartIndex;
};

struct FENL_Header{
u32 magic;
u32 idk;
u32 Chunk7002_size;
u32 Chunk7003_size;
};

//File 0 : File table
ChunkChild entry @ 0 [[color("ff0000")]];
Chunk SubChunks[entry.ChildrenCount] @ 12;

//File 2 : Pointer list
u8 Chunk7003[SubChunks[2].Size] @ 0x200;


//File 3 : UI data
//FENL_Header LayoutHeader @ (std::math::ceil(SubChunks[2].Size/512)*512 + 0x200);
FENL_Header LayoutHeader @ 0x1e00;
u8 Chunk7002[LayoutHeader.Chunk7002_size] @ 0x1E10;

//Chunks paddings align the chunks on 512
u8 Padding[0x1D0] @ 0x30 [[color("ffffff")]];
u8 Padding2[0x1BC] @ 0x1C44 [[color("ffffff")]];
u8 Padding3[0x74] @ 0x1918C [[color("ffffff")]];

struct UI_Object{
u32 idk;
u32 Hash;
u32 idk2;
u64 TwoOffsets;
float Matrice1[16];
float Matrice2[16];
float Matrice3[16];
u32 RGBA;
float vec4[3];
u32 always1;
};
UI_Object ui_object_at_0x3178 @ 0x3178;