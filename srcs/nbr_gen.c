#include <math.h>
#include <stdio.h>
#include <stdlib.h>

int	main(int argc, char **argv)
{
    if (argc != 2)
        return (0);

	int i, tot = atoi(argv[1]);
	float nd, phi = (sqrt(5) - 1) / 2 * tot;

    char sequence[tot];

    for (int i = 0; i < tot; i++)
        sequence[i] = 0;

	i = 0;
	nd = phi;
    while (1)
    {
        if (i >= tot)
            break ;
        int roundedValue = (int)round(nd);

        if (sequence[roundedValue] == 0) // Check for duplicates
        {
            printf("%i ", roundedValue);
            sequence[roundedValue] = 1;
            i++;
        }
        nd += phi;
        if (nd > tot)
            nd = (int)nd % tot;
    }
	return (0);
}

/* Thank you fsusanna */