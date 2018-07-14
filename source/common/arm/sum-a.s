@*************************** int sumAssembly(int add1, int add2); ***************************

.globl sumAssembly1

.type sumAssembly1, %function

sumAssembly1:
add r0,r0,r1
add r0,#2
bx lr

.globl sumAssembly

.type sumAssembly, %function

sumAssembly:
add r0,r0,r1
add r0,#3
bx lr

