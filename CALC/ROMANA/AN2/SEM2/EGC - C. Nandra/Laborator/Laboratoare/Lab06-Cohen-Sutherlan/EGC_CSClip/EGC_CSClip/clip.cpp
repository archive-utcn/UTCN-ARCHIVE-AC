#include "clip.h"
#include <math.h>

namespace egc {

	float getXmin(std::vector<vec3> clipWindow) {
		float x_min = clipWindow[0].x;
		for (int i = 1; i < 4; i++) {
			if (x_min > clipWindow[i].x) {
				x_min = clipWindow[i].x;
			}
		}
		return x_min;
	}

	float getYmin(std::vector<vec3> clipWindow) {
		float y_min = clipWindow[0].y;
		for (int i = 1; i < 4; i++) {
			if (y_min > clipWindow[i].y) {
				y_min = clipWindow[i].y;
			}
		}
		return y_min;
	}

	float getXmax(std::vector<vec3> clipWindow) {
		float x_max = clipWindow[0].x;
		for (int i = 1; i < 4; i++) {
			if (x_max < clipWindow[i].x) {
				x_max = clipWindow[i].x;
			}
		}
		return x_max;
	}

	float getYmax(std::vector<vec3> clipWindow) {
		float y_max = clipWindow[0].y;
		for (int i = 1; i < 4; i++) {
			if (y_max < clipWindow[i].y) {
				y_max = clipWindow[i].y;
			}
		}
		return y_max;
	}

	std::vector<int> computeCSCode(std::vector<vec3> clipWindow, const vec3 p) {
		std::vector<int> code(4);
		//TO DO - compute the code for the point given as argument
		float x_min = getXmin(clipWindow);
		float x_max = getXmax(clipWindow);
		float y_min = getYmin(clipWindow);
		float y_max = getYmax(clipWindow);
		if (p.x < x_min) {
			code[2] = 0;
			code[3] = 1;
			if (p.y > y_max) {
				code[0] = 1;
				code[1] = 0;
				
			}
			else if (p.y < y_min) {
				code[0] = 0;
				code[1] = 1;
			}
			else {
				code[0] = 0;
				code[1] = 0;
			}
		}
		else if (p.x > x_max) {
			code[2] = 1;
			code[3] = 0;
			if (p.y > y_max) {
				code[0] = 1;
				code[1] = 0;

			}
			else if (p.y < y_min) {
				code[0] = 0;
				code[1] = 1;
			}
			else {
				code[0] = 0;
				code[1] = 0;
			}
		}
		else {
			code[2] = 0;
			code[3] = 0;
			if (p.y > y_max) {
				code[0] = 1;
				code[1] = 0;

			}
			else if (p.y < y_min) {
				code[0] = 0;
				code[1] = 1;
			}
			else {
				code[0] = 0;
				code[1] = 0;
			}
		}
		return code;
	}

	bool simpleRejection(std::vector<int> cod1, std::vector<int> cod2) {
		//TO DO - write the code to determine if the two input codes represent 
		//points in the SIMPLE REJECTION case
		if (cod1[0] == 1 && cod2[0] == 1 || cod1[1] == 1 && cod2[1] == 1 || cod1[2] == 1 && cod2[2] == 1 || cod1[3] == 1 && cod2[3] == 1)
			return true;
		return false;
	}

	bool simpleAcceptance(std::vector<int> cod1, std::vector<int> cod2) {
		//TO DO - write the code to determine if the two input codes represent 
		//points in the SIMPLE ACCEPTANCE case
		if (cod1[0] == 0 && cod1[1] == 0 && cod1[2] == 0 && cod1[3] == 0 && cod2[0] == 0 && cod2[1] == 0 && cod2[2] == 0 && cod2[3] == 0)
			return true;
		return false;
	}

	//function returns -1 if the line segment cannot be clipped
	int lineClip_CohenSutherland(std::vector<vec3> clipWindow, vec3& p1, vec3& p2) {
		//TO DO - implement the Cohen-Sutherland line clipping algorithm - consult the laboratory work
		bool FINISHED = false;
		do {
			std::vector<int> cod1 = computeCSCode(clipWindow, p1);
			std::vector<int> cod2 = computeCSCode(clipWindow, p2);
			bool RESPINS = simpleRejection(cod1, cod2);
			if (RESPINS == true) {
				FINISHED = true;
				return -1;
			}
			else {
				bool DISPLAY = simpleAcceptance(cod1, cod2);
				if (DISPLAY == true)
					FINISHED = true;
				else {
					if (cod1[0] == 0 && cod1[1] == 0 && cod1[2] == 0 && cod1[3] == 0) {
						std::vector<int> auxCode(4);
						auxCode = cod1;
						cod1 = cod2;
						cod2 = auxCode;
						vec3 auxP;
						auxP = p1;
						p1 = p2;
						p2 = auxP;
					}
					if (cod1[0] == 1 && p2.y != p1.y) {
						p1.x = p1.x + (p2.x - p1.x) * (getYmax(clipWindow) - p1.y) / (p2.y - p1.y);
						p1.y = getYmax(clipWindow);
					}
					else if (cod1[1] == 1 && p2.y != p1.y) {
						p1.x = p1.x + (p2.x - p1.x) * (getYmin(clipWindow) - p1.y) / (p2.y - p1.y);
						p1.y = getYmin(clipWindow);
					}
					else if (cod1[2] == 1 && p2.x != p1.x) {
						p1.y = p1.y + (p2.y - p1.y) * (getXmax(clipWindow) - p1.x) / (p2.x - p1.x);
						p1.x = getXmax(clipWindow);
					}
					else if (cod1[3] == 1 && p2.x != p1.x) {
						p1.y = p1.y + (p2.y - p1.y) * (getXmin(clipWindow) - p1.x) / (p2.x - p1.x);
						p1.x = getXmin(clipWindow);
					}
				}
			}
		} while (FINISHED == false);
		return 0;
	}
}

