#include "clip.h"
#include "vec3.h"

namespace egc {

	//Cyrus-Beck clipping algorithm
	//clipWindow specifies the vertices that define the clipping area in conterclockwise order
	//and can represent any convex polygon
	//function returns -1 if the line segment cannot be clipped
	int lineClip_CyrusBeck(std::vector<vec3> clipWindow, vec3& p1, vec3& p2) {
		//TO DO - implement the Cyrus-Beck line clipping algorithm - consult the laboratory work
		vec3 PtE, PtL;
		float t, tE, tL;

		std::vector<vec3> norm(4);
		//calculez normala fiecarei laturi a ferestrei dreptunghiulare
		for (int i = 0; i < clipWindow.size(); i++) {
			vec3 pct1 = clipWindow[i];
			vec3 pct2 = clipWindow[(i + 1) % clipWindow.size()];
			vec3 Ei = pct2 - pct1;
			norm[i] = vec3(-Ei.y, Ei.x, 0).normalize();
		}

		if (p2 == p1) {
			if (p1.x >= clipWindow[0].x && p1.x <= clipWindow[3].x && p1.y <= clipWindow[1].y && p1.y >= clipWindow[0].y)
				return 0;
			return -1;
		}

		tE = 0;
		tL = 1;
		vec3 line = p2 - p1;
		for (int i = 0; i < clipWindow.size(); i++) {
			float prod = dotProduct(norm[i], line);
			if (prod != 0) {
				vec3 aux = p1 - clipWindow[i];
				t = dotProduct(norm[i], aux) * (-1.0f / prod);
				if (prod < 0) {
					if (t > tE)
						tE = t;
				}
				else {
					if (t < tL)
						tL = t;
				}
			}
		}

		if (tE > tL)
			return -1;

		PtE = p1 + line * tE;
		PtL = p1 + line * tL;

		p1 = PtE;
		p2 = PtL;

		if (p1.x >= clipWindow[0].x && p1.x <= clipWindow[3].x && p1.y <= clipWindow[1].y && p1.y >= clipWindow[0].y && p2.x >= clipWindow[0].x && p2.x <= clipWindow[3].x && p2.y <= clipWindow[1].y && p2.y >= clipWindow[0].y)
			return 0;
		return -1;

		return 0;
	}
	
}

