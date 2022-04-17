@echo off
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/io/ports.c -o bin/io/ports.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/io/console.c -o bin/io/console.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/kernel/kernel.c -o bin/kernel/kernel.o
i686-elf-as src/boot/kernel_entry.s -o bin/boot/kernel_entry.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -nostdlib -lgcc -T link.ld -o build/boot/kernel.elf bin/kernel/kernel.o bin/boot/kernel_entry.o bin/io/console.o
wsl grub-mkrescue -o kernel.iso build/
qemu-system-i386 -m 32 -cdrom kernel.iso -monitor stdio -no-reboot 
pause 