#include <stdio.h>
#include <stdlib.h>
#include <dlfcn.h>
#include "functionPrototype.h"

#define CORRECT_ARGC_VALUE      3
#define ARGUMENT_NUMBER_MESSAGE "Only two arguments should be passed on the command line!\r\n"
#define NON_ZERO_MESSAGE        "Both arguments should be non-zero integers!\r\n"


/*
@brief Main function. Program's entry point.
*/
int main(int argc, char** argv)
{
    if (argc != CORRECT_ARGC_VALUE)
    {
        printf(ARGUMENT_NUMBER_MESSAGE);
        exit(1);
    }

    int x = atoi(argv[1]);
    int y = atoi(argv[2]);
    int z;

    if((x == 0) || (y == 0))
    {
        printf(NON_ZERO_MESSAGE);
    }

    z = function(x, y);
    printOp();

    printf("%d, %d ---> %d\r\n", x, y, z);
}