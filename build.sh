#!/bin/sh

set -xe

CFLAGS="-O3 -Wall -Wextra -I./thirdparty/ `pkg-config --cflags raylib`"
LIBS="-lm -lglfw `pkg-config --libs raylib` -ldl -lpthread"

clang $CFLAGS -o adder adder.c $LIBS
clang $CFLAGS -o xor xor.c $LIBS
clang $CFLAGS -o img2nn img2nn.c $LIBS
