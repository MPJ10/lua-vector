root@debian-powerpc:~# cat test.s
        .file   "test.c"
        .section        .rodata
        .align 2
.LC0:
        .string "0123456789abcdef"
        .section        ".text"
        .align 2
        .globl itoa
        .type   itoa, @function
itoa:
        stwu 1,-48(1)
        stw 31,44(1)
        mr 31,1
        stw 3,24(31)
        stw 4,28(31)
        li 9,30
        stw 9,8(31)
        b .L2
.L4:
        lwz 9,24(31)
        lwz 10,28(31)
        divw 8,9,10
        lwz 10,28(31)
        mullw 10,8,10
        subf 9,10,9
        lis 10,.LC0@ha
        la 10,.LC0@l(10)
        lbzx 9,10,9
        rlwinm 8,9,0,0xff
        lis 9,buf.3364@ha
        la 10,buf.3364@l(9)
        lwz 9,8(31)
        stbx 8,10,9
        lwz 9,8(31)
        addi 9,9,-1
        stw 9,8(31)
        lwz 10,24(31)
        lwz 9,28(31)
        divw 9,10,9
        stw 9,24(31)
.L2:
        lwz 9,24(31)
        cmpwi 7,9,0
        beq 7,.L3
        lwz 9,8(31)
        cmpwi 7,9,0
        bne 7,.L4
.L3:
        lwz 9,8(31)
        addi 10,9,1
        lis 9,buf.3364@ha
        la 9,buf.3364@l(9)
        add 9,10,9
        mr 3,9
        addi 11,31,48
        lwz 31,-4(11)
        mr 1,11
        blr
        .size   itoa,.-itoa
        .align 2
        .globl is_big_endian
        .type   is_big_endian, @function
is_big_endian:
        stwu 1,-32(1)
        stw 31,28(1)
        mr 31,1
        li 9,1
        stw 9,12(31)
        addi 9,31,12
        stw 9,8(31)
        lwz 9,8(31)
        lbz 9,0(9)
        rlwinm 9,9,0,0xff
        cmpwi 7,9,0
        mfcr 9
        rlwinm 9,9,31,1
        rlwinm 9,9,0,0xff
        mr 3,9
        addi 11,31,32
        lwz 31,-4(11)
        mr 1,11
        blr
        .size   is_big_endian,.-is_big_endian
        .section        .rodata
        .align 2
.LC1:
        .string "is_big_endian=%d\n"
        .align 2
.LC2:
        .string "byte:"
        .align 2
.LC3:
        .string "value\t@%p\t=0x%x\n"
        .align 2
.LC4:
        .string "array[0]\t@%p\t=0x%x\n"
        .align 2
.LC5:
        .string "array[1]\t@%p\t=0x%x\n"
        .align 2
.LC6:
        .string "member c0\t@%p\t=0x%x\n"
        .align 2
.LC7:
        .string "member c3\t@%p\t=0x%x\n"
        .align 2
.LC8:
        .string "bit:"
        .align 2
.LC9:
        .string "value\t@%p\t=%016s\n"
        .align 2
.LC10:
        .string "array[0]\t@%p\t=%08s\n"
        .align 2
.LC11:
        .string "array[1]\t@%p\t=%08s\n"
        .align 2
.LC12:
        .string "member s1\t@%p\t=%s\n"
        .align 2
.LC13:
        .string "member s4\t@%p\t=%s\n"
        .section        ".text"
        .align 2
        .globl main
        .type   main, @function
main:
        stwu 1,-48(1)
        mflr 0
        stw 0,52(1)
        stw 31,44(1)
        mr 31,1
        stw 3,24(31)
        stw 4,28(31)
        bl is_big_endian
        mr 10,3
        lis 9,.LC1@ha
        la 3,.LC1@l(9)
        mr 4,10
        crxor 6,6,6
        bl printf
        lis 9,0x102
        ori 9,9,772
        stw 9,8(31)
        lis 9,.LC2@ha
        la 3,.LC2@l(9)
        bl puts
        lwz 10,8(31)
        lis 9,.LC3@ha
        la 3,.LC3@l(9)
        addi 9,31,8
        mr 4,9
        mr 5,10
        crxor 6,6,6
        bl printf
        lhz 9,8(31)
        rlwinm 9,9,0,0xffff
        mr 10,9
        lis 9,.LC4@ha
        la 3,.LC4@l(9)
        addi 9,31,8
        mr 4,9
        mr 5,10
        crxor 6,6,6
        bl printf
        lhz 9,10(31)
        rlwinm 9,9,0,0xffff
        mr 8,9
        addi 10,31,10
        lis 9,.LC5@ha
        la 3,.LC5@l(9)
        mr 4,10
        mr 5,8
        crxor 6,6,6
        bl printf
        lbz 9,8(31)
        rlwinm 9,9,0,0xff
        mr 10,9
        lis 9,.LC6@ha
        la 3,.LC6@l(9)
        addi 9,31,8
        mr 4,9
        mr 5,10
        crxor 6,6,6
        bl printf
        lbz 9,11(31)
        rlwinm 9,9,0,0xff
        mr 8,9
        addi 10,31,11
        lis 9,.LC7@ha
        la 3,.LC7@l(9)
        mr 4,10
        mr 5,8
        crxor 6,6,6
        bl printf
        lhz 9,12(31)
        oris 9,9,0xffff
        ori 9,9,32768
        sth 9,12(31)
        lhz 9,12(31)
        rlwinm 9,9,0,19,16
        ori 9,9,16384
        sth 9,12(31)
        lhz 9,12(31)
        rlwinm 9,9,0,22,18
        ori 9,9,4096
        sth 9,12(31)
        lhz 9,12(31)
        rlwinm 9,9,0,26,21
        ori 9,9,512
        sth 9,12(31)
        lis 9,.LC8@ha
        la 3,.LC8@l(9)
        bl puts
        lhz 9,12(31)
        rlwinm 9,9,0,0xffff
        mr 3,9
        li 4,2
        bl itoa
        mr 8,3
        addi 10,31,12
        lis 9,.LC9@ha
        la 3,.LC9@l(9)
        mr 4,10
        mr 5,8
        crxor 6,6,6
        bl printf
        lbz 9,12(31)
        rlwinm 9,9,0,0xff
        mr 3,9
        li 4,2
        bl itoa
        mr 8,3
        addi 10,31,12
        lis 9,.LC10@ha
        la 3,.LC10@l(9)
        mr 4,10
        mr 5,8
        crxor 6,6,6
        bl printf
        lbz 9,13(31)
        rlwinm 9,9,0,0xff
        mr 3,9
        li 4,2
        bl itoa
        mr 8,3
        addi 9,31,12
        addi 10,9,1
        lis 9,.LC11@ha
        la 3,.LC11@l(9)
        mr 4,10
        mr 5,8
        crxor 6,6,6
        bl printf
        lwz 9,12(31)
        srwi 9,9,31
        rlwinm 9,9,0,0xff
        mr 3,9
        li 4,2
        bl itoa
        mr 10,3
        lis 9,.LC12@ha
        la 3,.LC12@l(9)
        li 4,0
        mr 5,10
        crxor 6,6,6
        bl printf
        lwz 9,12(31)
        srwi 9,9,22
        rlwinm 9,9,0,28,31
        rlwinm 9,9,0,0xff
        mr 3,9
        li 4,2
        bl itoa
        mr 10,3
        lis 9,.LC13@ha
        la 3,.LC13@l(9)
        li 4,0
        mr 5,10
        crxor 6,6,6
        bl printf
        li 9,0
        mr 3,9
        addi 11,31,48
        lwz 0,4(11)
        mtlr 0
        lwz 31,-4(11)
        mr 1,11
        blr
        .size   main,.-main
        .lcomm  buf.3364,32,4
        .type   buf.3364, @object
        .ident  "GCC: (Debian 4.9.1-19) 4.9.1"
        .section        .note.GNU-stack,"",@progbits
root@debian-powerpc:~#
