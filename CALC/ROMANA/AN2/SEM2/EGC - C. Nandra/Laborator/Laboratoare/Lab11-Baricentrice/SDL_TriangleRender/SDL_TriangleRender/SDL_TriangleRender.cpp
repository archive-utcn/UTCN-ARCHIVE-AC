// SDL_TriangleRender.cpp : Defines the entry point for the console application.
//

#include <iostream>
#include "include/SDL.h"
#include "rasterization.h"
#include "Validator.h"

#undef main

using namespace egc;

//define window dimensions
const int WINDOW_WIDTH = 800;
const int WINDOW_HEIGHT = 600;

SDL_Window *window = NULL;
SDL_Renderer *windowRenderer = NULL;
SDL_Event currentEvent;

bool quit = false;

int mouseX, mouseY;

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
			// Create a renderer for the current window
			windowRenderer = SDL_CreateRenderer(window, -1, SDL_RENDERER_ACCELERATED);

			if (windowRenderer == NULL)
			{
				std::cout << "Failed to create the renderer: " << SDL_GetError() << std::endl;
				success = false;
			}
			else
			{
				//Set background color
				SDL_SetRenderDrawColor(windowRenderer, 255, 255, 255, 255);

				//Apply background color
				SDL_RenderClear(windowRenderer);
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

	if (!initWindow())
	{
		std::cout << "Failed to initialize" << std::endl;
		return -1;
	}

	//Define the triangle as a vector of vertices (vec4)
	std::vector<egc::vec4> triangle;
	triangle.push_back(egc::vec4(300, 100, 0, 1));
	triangle.push_back(egc::vec4(600, 400, 0, 1));
	triangle.push_back(egc::vec4(100, 400, 0, 1));

	//Define colors for each of the triangle vertices
	std::vector<egc::vec4> triangleColors;
	triangleColors.push_back(egc::vec4(255, 0, 0, 255));
	triangleColors.push_back(egc::vec4(0, 255, 0, 255));
	triangleColors.push_back(egc::vec4(0, 0, 255, 255));

	validateComputeAlphaBetaGamma();

	while (!quit) {
		//Handle events on queue
		if (SDL_WaitEvent(&currentEvent) != 0)
		{
			//User requests quit
			if (currentEvent.type == SDL_QUIT)
			{
				quit = true;
			}

			//Mouse event -> pressed button
			if (currentEvent.type == SDL_MOUSEBUTTONDOWN)
			{
				if (currentEvent.button.button == SDL_BUTTON_LEFT)
				{
					//left mouse button was pressed
					SDL_GetMouseState(&mouseX, &mouseY);
				}
			}

			//Mouse event -> mouse movement
			if (currentEvent.type == SDL_MOUSEMOTION)
			{
				if (currentEvent.motion.state & SDL_BUTTON_LMASK)
				{
					//left button pressed while moving
					SDL_GetMouseState(&mouseX, &mouseY);
				}
			}

			//Keyboard event
			if (currentEvent.type == SDL_KEYDOWN)
			{
				switch (currentEvent.key.keysym.sym)
				{
				case SDLK_c:
					break;
				case SDLK_ESCAPE:
					quit = true;
					break;
				default:
					break;
				}
			}

			//Paint the white background
			SDL_SetRenderDrawColor(windowRenderer, 255, 255, 255, 255);
			SDL_RenderClear(windowRenderer);

			SDL_SetRenderDrawColor(windowRenderer, 0, 0,255, 255);
			//Draw the triangle outline - this should give you an ideea about the location/size of the triangle
			SDL_RenderDrawLine(windowRenderer, triangle[0].x, triangle[0].y, triangle[1].x, triangle[1].y);
			SDL_RenderDrawLine(windowRenderer, triangle[1].x, triangle[1].y, triangle[2].x, triangle[2].y);
			SDL_RenderDrawLine(windowRenderer, triangle[2].x, triangle[2].y, triangle[0].x, triangle[0].y);

			//draw the filled triangle
			rasterizeTriangle(windowRenderer, triangle, triangleColors);


			SDL_RenderPresent(windowRenderer);
		}
	}

	destroyWindow();
	return 0;
}
