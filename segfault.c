#include <unistd.h>
#include <string.h>

int main(void)
{
    char *str = 0;

    write(1, "ra\n", 3);
    *str = 2;
    return (0);
}
