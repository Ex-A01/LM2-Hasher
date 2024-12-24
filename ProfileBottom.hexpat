struct Chunk{
u16 Type ;
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

Chunk chunk1s[3] @ 12;

u8 Chunk7003[0x1A44] @ 0x200;
ChunkChild FileEntry @ 0x00 ;

u8 Padding[0x1D0] @ 0x30 [[color("ffffff")]];
u8 Padding2[0x1BC] @ 0x1C44[[color("ffffff")]];

struct FENL{
u32 magic;
u32 idk;
u32 Chunk7002_size;
u32 Chunk7003_size;
}
;
FENL OffsetOf7002 @ 0x1E00;
u8 Chunk7002[0x1737C] @ 0x1E10;
u8 Padding3[0x74] @ 0x1918C;
u16 AnimData @ 0x00;
u16 LayoutHeader @ 0x0C;
u16 LayoutData @ 0x18;
u16 SomeKindOfTable @ 0x24;