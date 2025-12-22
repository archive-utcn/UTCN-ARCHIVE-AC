#include <stdio.h>
#include <conio.h>

int main()
{
    int x;
    printf("Anul este: ");
    scanf("%d",&x);
    if(x>1600 && x<4900 )
        {if(x%4==0)
        printf("An bisect");
        else
        printf("Nu e an bisect");}
    else
    printf("Inafara intervalului");
}

