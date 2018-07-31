#include <stdio.h>

int main(void)
{
	long  ret = 0;
	int  bfcs = 0;
	int  bfds = 0;
	int  bfss = 0;


	__asm__("mov %%cs,%%ax":"=a"(bfcs));
	__asm__("mov %%ds,%%ax":"=a"(bfds));
	__asm__("mov %%ss,%%ax":"=a"(bfss));
	printf("user space: bfcs = 0x%x bfds = 0x%x bfss=0x%x\n",bfcs,bfds,bfss);
	__asm volatile("int $0x80" \
			:"=a"(ret)\
			:"a"(87));
	printf("ret %ld\n",ret);
	return 0;
}



