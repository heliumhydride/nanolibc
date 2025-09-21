#!/bin/sh

[ "$AS" = "" ] && AS="nasm"
[ "$CC" = "" ] && CC="cc"
[ "$AR" = "" ] && AR="ar"
[ "$CFLAGS" = "" ] && CFLAGS="-std=c99 -Wall -Wextra -Wpedantic"

[ "$1" = "help" ] && {
  echo "help: show this help"
  echo "clean: clean project files"
  echo "tests: compile tests in tests/"
  exit 0
}

[ "$1" = "clean" ] && {
  rm -fv src/*.o
  rm -fv libc.a
  rm -fv tests/bin/*
  exit 0
}

set -e
set -x

[ -e "src/syscalls.o" ] || "$AS" -felf64 src/syscalls.asm -o src/syscalls.o
[ -e "src/loader.o" ] || "$CC" $CFLAGS src/loader.c -c -o src/loader.o -nostdlib
[ -e "libc.a" ] || "$AR" rcs libc.a src/*.o

[ "$1" = "tests" ] && {
  cd tests || exit 1
  for cfiles in *.c; do
    clang $CFLAGS -target x86_64-linux-none -nostdlib -nostdinc -static -L.. -I../include -lc "$cfiles" -o "bin/$(echo $cfiles | sed 's/.c$//')"
  done
}

set +x
set +e
