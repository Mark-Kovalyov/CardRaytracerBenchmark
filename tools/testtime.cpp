#include <stdlib.h>  
#include <stdio.h>
#include <string.h>
#include <time.h>

int main(int argc,char **argv) {
	if (argc==1) {
		fprintf(stderr,"\n\nUsage: testtime command_line\n");
		return -1;
	}
	char cmd[1024] = {0};
	for(int i = 1; i < argc; i++) {
		strcat(cmd, argv[i]);
		strcat(cmd, " ");
	}
	system(cmd);
	int t = clock();
	printf("\nTime %d.%03d sec\n", t/1000, t % 1000);
}

