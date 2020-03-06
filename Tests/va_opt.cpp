#include <stdio.h>
#define LOG(msg, ...) printf(msg __VA_OPT__(,) __VA_ARGS__)
// #define LOG(msg, ...) printf(msg, __VA_ARGS__)

int main() {
    LOG("hello world\n");   // => printf("hello world")
    LOG("hello world\n", );  // => printf("hello world")
    LOG("hello %d\n", 0);   // => printf("hello %d", n)

    // printf("Hello world",);

    return 0;
}
