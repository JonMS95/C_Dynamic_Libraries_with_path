#include "main.h"

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

    /*
    It will generate a different output, and print a different operation name depending on
    which library has been dynamically loaded previously. 
    */

    z = function(x, y);
    printOp();

    printf("%d, %d ---> %d\r\n", x, y, z);
}