# nasm_path = /Users/changwei/project/opsys/nasm/nasm
nasm_path = ./nasm/nasm

a.img : first.bin
	dd if=first.bin of=a.img bs=512 count=1 conv=notrunc
first.bin : first.asm
	$(nasm_path) first.asm -o first.bin