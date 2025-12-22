#include "hash.h"
#include <string.h>

unsigned generateHash(const char *string) {
    unsigned result = 0;
    int stringLength = strlen(string);
    for (int i = 0; i < stringLength; i++) {
        unsigned char *current = (unsigned char *)&result + i % sizeof(result);
        *current ^= (2 * string[i]);
    }
    return result;
}
