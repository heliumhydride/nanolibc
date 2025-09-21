#define _XOPEN_SOURCE   600
#define _POSIX_C_SOURCE 200112L

#include "../include/unistd.h"

int main(void);

void _start(void) {
  _exit(main());
}
