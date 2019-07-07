# nasm_path = /Users/changwei/project/opsys/nasm/nasm
nasm_path = ./nasm/nasm

# src = /Users/changwei/OneDrive/[配套资料]x86汇编语言：从实模式到保护模式/booktool/配书源码和工具/c05/c05_mbr.asm
src = vram.asm

a.img : first.bin $(src)
	dd if=first.bin of=a.img bs=512 count=1 conv=notrunc && qemu-system-i386 -hda ./a.img
first.bin : $(src)
	$(nasm_path) $(src) -o first.bin

run : 
	qemu-system-i386 -hda ./a.img