#include <console.h>
#include <gdt.h>

void kernel_main(){
	cinit();
	gdt_init();
	while(1);
}