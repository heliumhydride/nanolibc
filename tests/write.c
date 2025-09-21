#define _XOPEN_SOURCE   600
#define _POSIX_C_SOURCE 200112L

#include <unistd.h>

int main(void) {
  write(0, "This is a test \n", 16);
  return 0;
}
