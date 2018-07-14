@*************************** int sumAssembly(int add1, int add2); ***************************

function sumAssembly
1:  add         r3,pc,#const_83_36 - 1b - 8


    vld1.16     {d1-d4},[r0]                @loading 4 of rows
    vld1.16     {d0},[r3]                   @ d0 = {36,83}    @index = 1  0

    mov         r2,r2,lsl #1

    @ first stage computation starts
    vmull.s16   q10,d2,d0[0]                @83 * pi2_src[1]
    vmlal.s16   q10,d4,d0[1]                @o[0] = 83 * pi2_src[1] + 36 * pi2_src[3]
    vmull.s16   q11,d2,d0[1]                @36 * pi2_src[1]
    vmlsl.s16   q11,d4,d0[0]                @o[1] = 36 * pi2_src[1] - 83 * pi2_src[3]

    vaddl.s16   q12,d1,d3                   @pi2_src[0] + pi2_src[2]
    vsubl.s16   q13,d1,d3                   @pi2_src[0] - pi2_src[2]
    vshl.s32    q12,q12,#6                  @e[0] = 64*(pi2_src[0] + pi2_src[2])
    vshl.s32    q13,q13,#6                  @e[1] = 64*(pi2_src[0] - pi2_src[2])

    vadd.s32    q8,q12,q10                  @((e[0] + o[0] )
    vadd.s32    q9,q13,q11                  @((e[1] + o[1])
    vsub.s32    q14,q13,q11                 @((e[1] - o[1])
    vsub.s32    q15,q12,q10                 @((e[0] - o[0])

    vqrshrn.s32 d1,q8,#shift_stage1_idct    @pi2_out[0] = clip_s16((e[0] + o[0] + add)>>shift) )
    vqrshrn.s32 d2,q9,#shift_stage1_idct    @pi2_out[1] = clip_s16((e[1] + o[1] + add)>>shift) )
    vqrshrn.s32 d3,q14,#shift_stage1_idct   @pi2_out[2] = clip_s16((e[0] - o[0] + add)>>shift) )
    vqrshrn.s32 d4,q15,#shift_stage1_idct   @pi2_out[3] = clip_s16((e[0] - o[0] + add)>>shift) )

    vtrn.16     d1,d2
    vtrn.16     d3,d4
    vtrn.32     d1,d3
    vtrn.32     d2,d4

    @ first stage ends
    @ output in d1,d2,d3,d4
    @ second stage starts
    vmull.s16   q10,d2,d0[0]                @83 * pi2_src[1]
    vmlal.s16   q10,d4,d0[1]                @o[0] = 83 * pi2_src[1] + 36 * pi2_src[3]
    vmull.s16   q11,d2,d0[1]                @36 * pi2_src[1]
    vmlsl.s16   q11,d4,d0[0]                @o[1] = 36 * pi2_src[1] - 83 * pi2_src[3]

    vaddl.s16   q12,d1,d3                   @pi2_src[0] + pi2_src[2]
    vsubl.s16   q13,d1,d3                   @pi2_src[0] - pi2_src[2]
    vshl.s32    q12,q12,#6                  @e[0] = 64*(pi2_src[0] + pi2_src[2])
    vshl.s32    q13,q13,#6                  @e[1] = 64*(pi2_src[0] - pi2_src[2])


    vadd.s32    q8,q12,q10                  @((e[0] + o[0] )
    vadd.s32    q9,q13,q11                  @((e[1] + o[1])
    vsub.s32    q14,q13,q11                 @((e[1] - o[1])
    vsub.s32    q15,q12,q10                 @((e[0] - o[0])

    vqrshrn.s32 d0,q8,#shift_stage2_idct    @pi2_out[0] = clip_s16((e[0] + o[0] + add)>>shift) )
    vqrshrn.s32 d1,q9,#shift_stage2_idct    @pi2_out[1] = clip_s16((e[1] + o[1] + add)>>shift) )
    vqrshrn.s32 d2,q14,#shift_stage2_idct   @pi2_out[2] = clip_s16((e[0] - o[0] + add)>>shift) )
    vqrshrn.s32 d3,q15,#shift_stage2_idct   @pi2_out[3] = clip_s16((e[0] - o[0] + add)>>shift) )

    vtrn.16     d0,d1
    vtrn.16     d2,d3
    vtrn.32     d0,d2
    vtrn.32     d1,d3
    @ second stage ends
    @ output in d0,d1,d2,d3
    @ second stage computation ends

    @ storing destination
    vst1.32     {d0},[r1],r2
    vst1.32     {d1},[r1],r2
    vst1.32     {d2},[r1],r2
    vst1.32     {d3},[r1],r2
    bx          lr

    .ltorg
const_83_36:
    .hword 83, 36
endfunc