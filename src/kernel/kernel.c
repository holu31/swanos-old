#include <console.h>

char hello[5] = "Hello";

void kernel_main(){
	cinit();
	for(int i=0;i<5;i++)
		cputch(hello[i]);
	cputch('\n');
	cputch('h');
	while(1);
}