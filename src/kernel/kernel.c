#include <console.h>
#include <gdt.h>
#include <keyboard.h>

void kernel_main(){
	cinit();
	gdt_init();
	kb_init();
	while(1);
}