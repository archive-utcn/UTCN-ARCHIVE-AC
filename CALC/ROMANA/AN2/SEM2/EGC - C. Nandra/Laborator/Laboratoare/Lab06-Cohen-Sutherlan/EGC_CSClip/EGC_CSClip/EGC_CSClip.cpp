//  SDL_TestClip
//
//  Created by CGIS on 27/03/2020.
//  Copyright � 2020 CGIS. All rights reserved.
//
//  This is a test setup for your clipping algorithm implementation
//  This application draws the clipping window beteen the points (250,200) and (550, 400)
//  You can draw the line that you want to clip with a "drag-n-drop" action within the window
//
//  To apply the Cohen-Sutherland algorithm to your line, press the 'c' key.
//  This will invoke the function implementation from the "clip.cpp" file. 
//  You must implement the functions within that file!!!! 
//  Check "clip.h" and the Laboratory work for clues about the implemntation
//

/************************************************* IMPORTANT *********************************************************/
//  !!!!! ADD ALL OF YOUR IMPLEMENTED SOURCES -> vec3, vec4, mat3, mat4, transform (".h" and ".cpp") files !!!!!!
//
/*******************************************************************************************************************/

#include <iostream>
#include "include/SDL.h"
#include "clip.h"

using namespace egc;

// define rectangle vertices
vec3 p1{ 0.0f, 0.0f, 1.0f };
vec3 p2{ 0.0f, 0.0f, 1.0f };

//define clipping window
std::vector<vec3> clipWindow;

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

//Create the corners of the clipping window (drawn as a rectangle)
void initClipWindow()
{
	clipWindow.push_back(vec3(250.0f, 200.0f, 1.0f));
	clipWindow.push_back(vec3(550.0f, 200.0f, 1.0f));
	clipWindow.push_back(vec3(550.0f, 400.0f, 1.0f));
	clipWindow.push_back(vec3(250.0f, 400.0f, 1.0f));
}

int main(int argc, char * argv[]) {

	(void)argc;
	(void)argv;

	if (!initWindow())
	{
		std::cout << "Failed to initialize" << std::endl;
		return -1;
	}

	initClipWindow();
	std::cout << "Draw the line you want to clip witha drang-n-drop mouse action!" << "\n";
	std::cout << "Press the \'c\' key to apply the Cohen-Sutherland clipping algorithm!" << "\n\n";

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
					p1.x = p2.x = (float)mouseX;
					p1.y = p2.y = (float)mouseY;
				}
			}

			//Mouse event -> mouse movement
			if (currentEvent.type == SDL_MOUSEMOTION)
			{
				if (currentEvent.motion.state & SDL_BUTTON_LMASK)
				{
					//left button pressed while moving
					SDL_GetMouseState(&mouseX, &mouseY);
					p2.x = (float)mouseX;
					p2.y = (float)mouseY;
				}
			}

			//Keyboard event
			if (currentEvent.type == SDL_KEYDOWN)
			{
				switch (currentEvent.key.keysym.sym)
				{
				case SDLK_c:
					std::cout << "Applying Cohen-Sutherland clipping" << "\n";
					//Applies the Cohen-Sutherland clipping algorithm -> implemented by you
					if (lineClip_CohenSutherland(clipWindow, p1, p2) == -1)
						p1.x = p2.x = p1.y = p2.y = 0.0f;
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

			//draw the clipping window
			SDL_SetRenderDrawColor(windowRenderer, 0, 128, 0, 255);
			for (size_t i = 0; i < clipWindow.size(); i++)
				SDL_RenderDrawLine(
					windowRenderer,
					(int)clipWindow.at(i).x,
					(int)clipWindow.at(i).y,
					(int)clipWindow.at((i + 1) % clipWindow.size()).x,
					(int)clipWindow.at((i + 1) % clipWindow.size()).y);

			//draw the line
			SDL_SetRenderDrawColor(windowRenderer, 0, 0, 255, 255);
			SDL_RenderDrawLine(windowRenderer, (int)p1.x, (int)p1.y, (int)p2.x, (int)p2.y);


			SDL_RenderPresent(windowRenderer);
		}
	}

	destroyWindow();
	return 0;
}