// EGC_Bresenham.cpp : Defines the entry point for the console application.
//
//  Created by CGIS on 13/04/2020.
//  Copyright © 2020 CGIS. All rights reserved.
//

#include <iostream>
#include "include/SDL.h"
#include <vector>
#include "Bezier.h"

//define window dimensions
const int WINDOW_WIDTH = 640;
const int WINDOW_HEIGHT = 480;

//The window
SDL_Window *window = NULL;
//The window renderer
SDL_Renderer* renderer = NULL;
SDL_Event currentEvent;

bool quit = false;
int mouseX, mouseY;

std::vector<vec2> controlPoints;

bool initWindow()
{
	bool success = true;

	//Try to initialize SDL
	if (SDL_Init(SDL_INIT_VIDEO) < 0)
	{
		std::cout << "SDL initialization failed" << std::endl;
		success = false;
	}
	else {
		//Try to create the window
		window = SDL_CreateWindow("SDL Hello World Example", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, WINDOW_WIDTH, WINDOW_HEIGHT, SDL_WINDOW_SHOWN | SDL_WINDOW_ALLOW_HIGHDPI);

		if (window == NULL)
		{
			std::cout << "Failed to create window: " << SDL_GetError() << std::endl;
			success = false;
		}
		else
		{
			//Create renderer for window
			renderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);
			if (renderer == NULL)
			{
				printf("Renderer could not be created! SDL Error: %s\n", SDL_GetError());
				success = false;
			}
			else
			{
				//Initialize renderer color
				SDL_SetRenderDrawColor(renderer, 0xFF, 0xFF, 0xFF, 0xFF);
			}
		}
	}

	return success;
}

void destroyWindow()
{
	//Destroy window
	SDL_DestroyRenderer(renderer);
	SDL_DestroyWindow(window);
	window = NULL;
	renderer = NULL;
	//Quit SDL
	SDL_Quit();
}

void handleMouseEvents()
{
	//Mouse event -> pressed button
	if (currentEvent.type == SDL_MOUSEBUTTONDOWN)
	{
		if (currentEvent.button.button == SDL_BUTTON_LEFT)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			
		}

		if (currentEvent.button.button == SDL_BUTTON_RIGHT)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
		}
	}

	//Mouse event -> mouse movement
	if (currentEvent.type == SDL_MOUSEMOTION)
	{
		if (currentEvent.button.button & SDL_BUTTON_LMASK)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			
		}

		if (currentEvent.button.button & SDL_BUTTON_RMASK)
		{
			SDL_GetMouseState(&mouseX, &mouseY);
			
		}
	}
}

void handleKeyboardEvents()
{
	//Keyboard event
	if (currentEvent.type == SDL_KEYDOWN)
	{
		switch (currentEvent.key.keysym.sym)
		{
		case SDLK_ESCAPE:
			quit = true;
			break;

		default:
			break;
		}
	}
}


int main(int argc, char * argv[]) {
	if (!initWindow())
	{
		std::cout << "Failed to initialize" << std::endl;
		return -1;
	}

	controlPoints.push_back(egc::vec2(50,400));
	controlPoints.push_back(egc::vec2(150, 50));
	controlPoints.push_back(egc::vec2(500, 400));

	while (!quit) {
		//Handle events on queue
		while (SDL_PollEvent(&currentEvent) != 0)
		{
			//User requests quit
			if (currentEvent.type == SDL_QUIT)
			{
				quit = true;
			}

			handleMouseEvents();
			handleKeyboardEvents();

			//Clear screen
			SDL_SetRenderDrawColor(renderer, 0xFF, 0xFF, 0xFF, 0xFF);
			SDL_RenderClear(renderer);



			/****************************************************************************************************/
			/*                                   Parametric line render                                         */
			/****************************************************************************************************/
			//Paint the pixels along the line formed by points (400, 70) and (600, 400) 
			SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0x00, 0x00);
			drawParametricLinePoints(egc::vec2(400, 70), egc::vec2(600, 400), renderer);
			

			/****************************************************************************************************/
			/*                                     Bezier curve render                                          */
			/****************************************************************************************************/
			//Draw the lines formed by the control points
			//SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0xFF, 0xFF);
			//for (int i = 0; i < controlPoints.size() - 1; i++)
				//SDL_RenderDrawLine(renderer, controlPoints[i].x, controlPoints[i].y, controlPoints[i + 1].x, controlPoints[i + 1].y);
			SDL_SetRenderDrawColor(renderer, 0x00, 0x00, 0xF00, 0xFF);
			drawBezierPoints(controlPoints, renderer);
			
		

			//Update screen
			SDL_RenderPresent(renderer);
		}
	}

	destroyWindow();
	return 0;
}