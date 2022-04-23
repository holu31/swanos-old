@echo off
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/libc/string.c -o bin/libc/string.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/interrupts/gdt.c -o bin/interrupts/gdt.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/drivers/keyboard.c -o bin/drivers/keyboard.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/io/ports.c -o bin/io/ports.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/io/console.c -o bin/io/console.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/kernel/kernel.c -o bin/kernel/kernel.o
i686-elf-as src/boot/kernel_entry.s -o bin/boot/kernel_entry.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -nostdlib -lgcc -T link.ld -o build/boot/kernel.elf bin/kernel/kernel.o bin/boot/kernel_entry.o bin/io/console.o bin/io/ports.o bin/interrupts/gdt.o bin/libc/string.o bin/drivers/keyboard.o
wsl grub-mkrescue -o "kernel.iso" build/ -V SwanOS
qemu-system-i386 -m 32 -cdrom kernel.iso -monitor stdio -no-reboot 
pause 