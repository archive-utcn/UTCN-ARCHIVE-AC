# include "clip.h"
# include "vec3.h"
# include "edge.h"
# include <algorithm>
# include <stdlib.h>
# include <limits.h>
# define MAX_LEN 100

namespace egc {

	void ComputeClippingWindowNormals(std::vector<edge> &clipWindow) {

		vec3 p0, p1;

		for (int i = 0; i < clipWindow.size(); i++) { // normal for each edge in reverse order of the points
			
			p0 = clipWindow[i].b;
			p1 = clipWindow[i].a;

			int dy = p1.y - p0.y;
			int dx = p1.x - p0.x;

			clipWindow[i].normal.x = dy;
			clipWindow[i].normal.y = -dx;
		}
	}


	bool isPointOutsideClippingWindow(const vec3 &p, const std::vector<edge> &clippingWindow) { 

		for (int i = 0; i < clippingWindow.size(); i++) {

			vec3 v = clippingWindow[i].a - p;
			float product = dotProduct(v, clippingWindow[i].normal);

			if (product > 0)
				return true;
		}

		return false;
	}

	bool areTwoEdgesParallel(const edge &edgeToBeClipped, const edge &e) {

		float m1 = (e.a.y - e.b.y) / (e.a.x - e.b.x);
		float m2 = (edgeToBeClipped.a.y - edgeToBeClipped.b.y) / (edgeToBeClipped.a.x - edgeToBeClipped.b.x);

		if (m1 == m2)
			return true;
		else
			return false;
	}


	bool isPotentialEnteringPoint(const edge &e, const edge &edgeToBeClipped) {
		
		vec3 D = (edgeToBeClipped.b - edgeToBeClipped.a);
		float product = dotProduct(e.normal, D);

		if (product > 0) {
			return true;
		}
		else {
			return false;
		}

	}

	int lineClip_CyrusBeck(std::vector<edge> clipWindow, vec3& p0, vec3& p1) { 
		
		ComputeClippingWindowNormals(clipWindow);
		edge e;
		e.a = p0;
		e.b = p1;

		if (isPointOutsideClippingWindow(p0, clipWindow) == false && isPointOutsideClippingWindow(p1, clipWindow) == false) {
			return 0; // the clipping is done -- line is inside
		}

		for (int i = 0; i < clipWindow.size(); i++) {
			if (areTwoEdgesParallel(e, clipWindow[i]) && isPointOutsideClippingWindow(p0, clipWindow)) {
				return -1;
			}
		}
		
		double tE = 0, tL = INT_MAX;
		vec3 D = (p1 - p0);
		
		float product;
		edge edgeToBeClipped;
		edgeToBeClipped.a = p0;
		edgeToBeClipped.b = p1;
		
		for (int i = 0; i < clipWindow.size(); i++) {

			product = dotProduct(clipWindow[i].normal, D);

		
			if (product != 0) {
				double t = (dotProduct(clipWindow[i].normal, (p0 - clipWindow[i].a))) / -dotProduct(clipWindow[i].normal, D);

				printf("%f\n", t);

				if (t >= 0 && t <= 1) {

					if (isPotentialEnteringPoint(clipWindow[i], edgeToBeClipped)) {
						tE = std::max(tE, t);
					}
					else {
						tL = std::min(tL, t);
					}
				}
			}	
		}

		printf("\n");

		if (tE > tL)
			return -1;
		else {
			vec3 newP0 = p0 + D*tE;
			vec3 newP1 = p0 + D*tL;

			
			if (isPointOutsideClippingWindow(p0, clipWindow))
				if (isPointOutsideClippingWindow(newP0, clipWindow))
					return -1;
				else
					p0 = newP0;
			if (isPointOutsideClippingWindow(p1, clipWindow))
				if (isPointOutsideClippingWindow(newP1, clipWindow))
					return -1;
				else	
					p1 = newP1;
				
			return 0;
		}
	}

	std::vector<int> computeCSCode(std::vector<edge> clipWindow, const vec3 p) {

		int xMin = INT_MAX, xMax = 0, yMin = INT_MAX, yMax = 0;
		std::vector<int> code;

		for (int i = 0; i < clipWindow.size(); i++) {
			if (clipWindow[i].a.x > xMax) {
				xMax = clipWindow[i].a.x;
			}
			else if (clipWindow[i].a.x < xMin) {
				xMin = clipWindow[i].a.x;
			}

			if (clipWindow[i].a.y > yMax) {
				yMax = clipWindow[i].a.y;
			}
			else if (clipWindow[i].a.y < yMin) {
				yMin = clipWindow[i].a.y;
			}
		}

		if (p.y < yMin) {
			code.push_back(1);
		}
		else {
			code.push_back(0);
		}
		if (p.y > yMax) {
			code.push_back(1);
		}
		else {
			code.push_back(0);
		}
		if (p.x > xMax) {
			code.push_back(1);
		}
		else {
			code.push_back(0);
		}
		if (p.x < xMin) {
			code.push_back(1);
		}
		else {
			code.push_back(0);
		}

		return code;

	}


	int simpleAcceptanceRejection(std::vector<int> cod1, std::vector<int> cod2) {

		bool acceptance = true, rejection = false;
		
		for (int i = 0; i < cod1.size(); i++) {
			if (cod1[i] != 0 || cod2[i] != 0) {
				acceptance = false;
			}
			if (cod1[i] == 1 && cod2[i] == 1) {
				rejection = true;
			}
		}

		if (acceptance == true && rejection == false) {
			return 1;
		}
		else if (acceptance == false && rejection == true) {
			return -1;
		}
		else {
			return 0;
		}

	}

	bool isInside(std::vector<int> cod) {
		
		bool isInside = true;
		for (int i = 0; i < cod.size(); i++) {
			if (cod.at(i) != 0)
				isInside = false;
		}

		return isInside;
	}

	void invertPoints(edge &e, std::vector<int> &cod1, std::vector<int> &cod2) {

		vec3 aux;
		std::vector<int> auxCod;

		aux = e.a;
		e.a = e.b;
		e.b = aux;

		auxCod = cod1;
		cod1 = cod2;
		cod2 = auxCod;
	}

	int lineClip_CohenSutherland(std::vector<edge> clipWindow, vec3& p1, vec3& p2) {

		bool done = false;
		bool reject = false;
		bool display = true;
		std::vector<int> cod1, cod2, aux;
		edge e;
		e.a = p1;
		e.b = p2;

		int xMin = INT_MAX, xMax = 0, yMin = INT_MAX, yMax = 0;

		for (int i = 0; i < clipWindow.size(); i++) {
			if (clipWindow[i].a.x > xMax) {
				xMax = clipWindow[i].a.x;
			}
			else if (clipWindow[i].a.x < xMin) {
				xMin = clipWindow[i].a.x;
			}

			if (clipWindow[i].a.y > yMax) {
				yMax = clipWindow[i].a.y;
			}
			else if (clipWindow[i].a.y < yMin) {
				yMin = clipWindow[i].a.y;
			}
		}

		while (!done) {

			cod1 = computeCSCode(clipWindow, p1);
			cod2 = computeCSCode(clipWindow, p2);

			if (simpleAcceptanceRejection(cod1, cod2) == -1) { // simple rejection case
				done = true;
				printf("da");
				return -1;
			}
			else { // simple acceptance case
				if (simpleAcceptanceRejection(cod1, cod2) == 1) { // simple acceptance case
					done = true;
					return 0;
				}
				else { // clipping case

					if (isInside(cod1)) { // need to swap the codes and the points
						invertPoints(e, cod1, cod2);
					}

					p1 = e.a;
					p2 = e.b;

					printf("p1: %f %f p2: %f %f\n", p1.x, p1.y, p2.x, p2.y);

					if (cod1[0] == 1 && p1.y != p2.y) {
						p1.x = p1.x + (yMin - p1.y) * (p1.x - p2.x) / (p1.y - p2.y);
						p1.y = yMin;
					}
					else if (cod1[1] == 1 && p1.y != p2.y) {
						p1.x = p1.x + (yMax - p1.y) * (p1.x - p2.x) / (p1.y - p2.y);
						p1.y = yMax;
					}
					else if (cod1[2] == 1 && p1.x != p2.x) {
						p1.y = p1.y + (p1.y - p2.y) * (xMax - p1.x) / (p1.x - p2.x);
						p1.x = xMax;
					}
					else if (cod1[3] == 1 && p1.x != p2.x) {
						p1.y = p1.y + (p1.y - p2.y) * (xMin - p1.x) / (p1.x - p2.x);
						p1.x = xMin;
					}
				}
			}

			e.a = p1;
			e.b = p2;

			printf("p1: %f %f p2: %f %f\n\n", p1.x, p1.y, p2.x, p2.y);
		}

		return 0;
	}


}

