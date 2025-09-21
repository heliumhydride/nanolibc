#ifndef _UNISTD_H
#define _UNISTD_H

long write(int fd, const void* buf, long count);
void _exit(int status);

#endif // _UNISTD_H
