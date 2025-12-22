//
//  main.cpp
//  SDL_Lab1
//
//  Created by CGIS on 16/02/16.
//  Copyright © 2016 CGIS. All rights reserved.
//

#include <iostream>
#include "include\SDL.h"

//define window dimensions
const int WINDOW_WIDTH = 640;
const int WINDOW_HEIGHT = 480;

SDL_Window *window = NULL;
SDL_Surface *windowSurface = NULL;
SDL_Event currentEvent;

SDL_Rect rectangleCoordinates = {100, 100, 200, 200};
Uint32 rectagleColor;

bool quit = false;

int mouseX, mouseY;

char v = ' ';

int r = 0, g = 0, b = 0;

int startPosX, startPosY, endPosX, endPosY;

bool initWindow()
{
    bool success = true;
    
    //Try to initialize SDL
    if(SDL_Init(SDL_INIT_VIDEO) < 0)
    {
        std::cout << "SDL initialization failed" << std::endl;
        success = false;
    }
    else{
        //Try to create the window
        window = SDL_CreateWindow("SDL Hello World Example", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN | SDL_WINDOW_ALLOW_HIGHDPI);
        
        if(window == NULL)
        {
            std::cout << "Failed to create window: " << SDL_GetError() << std::endl;
            success = false;
        }
        else
        {
            //Try to get the window surface
            windowSurface = SDL_GetWindowSurface(window);
            
            if(windowSurface == NULL)
            {
                std::cout << "Failed to get the window surface: " << SDL_GetError() << std::endl;
                success = false;
            }
            else
            {
                //Initialize surface color
                SDL_FillRect(windowSurface, NULL, SDL_MapRGB(windowSurface->format, 255, 255, 255));
                
                //Update the surface
                SDL_UpdateWindowSurface(window);
            }

        }
    }
    
    return success;
}

void destroyWindow()
{
    //Destroy window
    SDL_DestroyWindow(window);
    window = NULL;
    
    //Quit SDL
    SDL_Quit();
}

int main(int argc, char * argv[]) {
    if(!initWindow())
    {
        std::cout << "Failed to initialize" << std::endl;
        return -1;
    }
    
    rectagleColor = SDL_MapRGB(windowSurface->format, 0, 0, 255);
    
    while (!quit) {
        //Handle events on queue
        if(SDL_WaitEvent(&currentEvent) != 0)
        {
            //User requests quit
            if(currentEvent.type == SDL_QUIT)
            {
                quit = true;
            }
            
            //Mouse event -> pressed button
            if(currentEvent.type == SDL_MOUSEBUTTONDOWN)
            {
                if(currentEvent.button.button == SDL_BUTTON_LEFT)
                {
                    SDL_GetMouseState(&mouseX, &mouseY);
                    std::cout << "Mouse click => " << "x: " << mouseX << ", y: " << mouseY << std::endl;

                    startPosX = mouseX;
                    endPosX = mouseX;
                    startPosY = mouseY;
                    endPosY = mouseY;
                }
            }
            
            //Mouse event -> mouse movement
            if(currentEvent.type == SDL_MOUSEMOTION)
            {
                if(currentEvent.button.button == SDL_BUTTON_LEFT)
                {
                    SDL_GetMouseState(&mouseX, &mouseY);
                    std::cout << "Mouse move => " << "x: " << mouseX << ", y: " << mouseY << std::endl;

                    endPosX = mouseX;
                    endPosY = mouseY;
                }
                
            }
            
            //Keyboard event
            if(currentEvent.type == SDL_KEYDOWN)
            {
                switch(currentEvent.key.keysym.sym)
                {
                    case SDLK_UP:
                        switch (v) 
                        {
                            case 'r':
                                if (r + 5 <= 255) {
                                    r += 5;
                                    rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                                }
                                break;
                            
                            case 'g':
                                if (g + 5 <= 255) {
                                    g += 5;
                                    rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                                }
                                break;

                            case 'b':
                                if (b + 5 <= 255) {
                                    b += 5;
                                    rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                                }
                                break;
                        }
                        break;

                    case SDLK_DOWN:
                        switch (v)
                        {
                        case 'r':
                            if (r - 5 >= 0) {
                                r -= 5;
                                rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                            }
                            break;

                        case 'g':
                            if (g - 5 >= 0) {
                                g -= 5;
                                rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                            }
                            break;

                        case 'b':
                            if (b - 5 >= 0) {
                                b -= 5;
                                rectagleColor = SDL_MapRGB(windowSurface->format, r, g, b);
                            }
                            break;
                        }
                        break;
                        
                    case SDLK_r:
                        v = 'r';
                        break;
                    
                    case SDLK_g:
                        v = 'g';
                        break;

                    case SDLK_b:
                        v = 'b';
                        break;
                        
                    default:
                        rectagleColor = SDL_MapRGB(windowSurface->format, 255, 255, 0);
                        break;
                }
            }

            // Curatam canvas-ul
            SDL_FillRect(windowSurface, NULL, SDL_MapRGB(windowSurface->format, 255, 255, 255));
            
            // Desenam dreptunghiul
            rectangleCoordinates.x = std::min(startPosX, endPosX);
            rectangleCoordinates.y = std::min(startPosY, endPosY);
            rectangleCoordinates.w = std::abs(endPosX - startPosX);
            rectangleCoordinates.h = std::abs(endPosY - startPosY);
            SDL_FillRect(windowSurface, &rectangleCoordinates, rectagleColor);
            
            SDL_UpdateWindowSurface(window);
        }
    }
    
    destroyWindow();
    return 0;
}
