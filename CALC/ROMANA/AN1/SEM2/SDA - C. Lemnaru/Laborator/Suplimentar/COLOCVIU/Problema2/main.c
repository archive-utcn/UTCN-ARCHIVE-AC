#include <stdio.h>
#include <stdlib.h>
#include <hash.h>
#define SEQ_LEN 7

// 11000010 10001010 10001010 00010000

void recurs(FILE *f, int hashed, char *rez,
            int pos, char *cifre, int cifreLen,
            char *vocale, int vocaleLen)
{
    // CVCVCCV
    // cifre: 0,2,4,5
    // vocale: 1,3,6
    if (pos == SEQ_LEN)
    {
        rez[SEQ_LEN] = 0;
        int gen_hash = generateHash(rez);
        fprintf(f, "%s %u\n", rez, gen_hash);
        if (hashed == gen_hash)
        {
            printf("%s\n", rez);
        }
        return;
    }

    switch (pos)
    {
    case 0:
    case 2:
    case 4:
    case 5:
        // seq cif
        for (int i = 0; i < cifreLen; i++)
        {
            rez[pos] = cifre[i];
            recurs(f, hashed, rez, pos + 1, cifre, cifreLen, vocale, vocaleLen);
        }
        break;

    case 1:
    case 3:
    case 6:
        // seq voc
        for (int i = 0; i < vocaleLen; i++)
        {
            rez[pos] = vocale[i];
            recurs(f, hashed, rez, pos + 1, cifre, cifreLen, vocale, vocaleLen);
        }

        break;

    default:
        printf("Cum s-a ajuns aici??\n");
        break;
    }
}

int main()
{
    FILE *intrare = fopen("./../subiect/ex2.txt", "r");
    if (!intrare)
    {
        printf("Problema la fisier!");
        return 0;
    }
    int hashed;
    fscanf(intrare, "%d ", &hashed);
    fclose(intrare);

    char cifre[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};
    char vocale[] = {'a', 'e', 'i', 'o', 'u'};

    FILE *iesire = fopen("./../ex2.out", "w");

    char rez[10];
    recurs(iesire,
           hashed,
           rez,
           0,
           cifre,
           sizeof(cifre) / sizeof(*cifre),
           vocale,
           sizeof(vocale) / sizeof(*vocale));

    fclose(iesire);
    return 0;
}