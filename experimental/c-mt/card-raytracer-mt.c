/**
 *  Special thanks to Paul Heckbert
 *
 *  http://tproger.ru/translations/business-card-raytracer
 */

#include <stdlib.h>   
#include <stdio.h>
#include <math.h>
#include <time.h>
#include <pthread.h>

#include <linux/sched.h>

#define WIDTH  512
#define HEIGHT 512

struct Vector {
  double x, y, z;
};

struct Frame {
  int x;
  int y;
  int w;
  int h;
}

void* thread_func(void* vptr_args) {
    printf("Hello from thead\n");
    return NULL;
}

int main(int argc,char **argv) {

  printf("Time slice : %d\n", RR_TIMESLICE);

  pthread_t thread;

  if (pthread_create(&thread,NULL,thread_func,NULL)) return EXIT_FAILURE;

  if (pthread_join(thread,NULL)) return EXIT_FAILURE;

  return EXIT_SUCCESS;
}