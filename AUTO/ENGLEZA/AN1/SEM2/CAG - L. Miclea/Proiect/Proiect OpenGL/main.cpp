#include <windows.h>
#include <GL/glut.h>
#include <stdlib.h>

void scalare(int latime, int inaltime)
{
    float ar = (float) latime / (float) inaltime;
    glMatrixMode(GL_PROJECTION);
    glFrustum(-ar, ar, -1.0, 1.0, 2.0, 100.0);
    glMatrixMode(GL_MODELVIEW);

}

void afisare(void)
{
    double timp = glutGet(GLUT_ELAPSED_TIME) / 1000.0;
    double acceleratie = timp*100.0;

    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glColor3d(0,1,1);

    glPushMatrix();
        glTranslated(0,0,-3);
        glRotated(60,1,0,0);
        glRotated(acceleratie,0,0,1);
        glutSolidCone(1,1,4,4);
    glPopMatrix();


    glutSwapBuffers();
}

void continuare()
{
    glutPostRedisplay();
}

const GLfloat pozitia_luminii[] = { 2.0f, 5.0f, 5.0f, 0.0f };

int main()
{

    glutInitWindowSize(1024,720);
    glutInitDisplayMode(GLUT_RGB | GLUT_DOUBLE | GLUT_DEPTH);

    glutCreateWindow("Piramida");
    glutReshapeFunc(scalare);
    glutDisplayFunc(afisare);
    glutIdleFunc(continuare);

    glClearColor(1,1,1,1);

    glEnable(GL_CULL_FACE);
    glEnable(GL_LIGHT0);
    glEnable(GL_COLOR_MATERIAL);
    glEnable(GL_LIGHTING);
    glLightfv(GL_LIGHT0, GL_POSITION, pozitia_luminii);

    glutMainLoop();

    return 0;
}
