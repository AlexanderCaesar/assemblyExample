#!/bin/bash

emcc -msse3  -fno-vectorize  ../../source/primitives.c ../../source/common/sum.c ../../source/common/intrinsics/x86-intrinsics-primitives.c  ../../source/main.c -s NO_EXIT_RUNTIME=0  \   #../../source/common/intrinsics/x86-intrinsics-primitives.c 
    -s WASM=1 \
    -s ALLOW_MEMORY_GROWTH=1 \
    -O3 \
    -o a.js 

