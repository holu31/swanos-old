@echo off
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/io/console.c -o bin/io/console.o

i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -c src/kernel/kernel.c -o bin/kernel/kernel.o
i686-elf-as src/boot/kernel_entry.s -o bin/boot/kernel_entry.o
i686-elf-gcc -g -I include -ffreestanding -Wall -Wextra -O0 -nostdlib -lgcc -T link.ld -o bin/kernel.elf bin/kernel/kernel.o bin/boot/kernel_entry.o bin/io/console.o
qemu-system-i386 -kernel bin/kernel.elf
pause 