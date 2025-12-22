// OpenCVApplication.cpp : Defines the entry point for the console application.
//

#include "stdafx.h"
#include "common.h"
#include <windows.h>
#include <queue>
#include <random>
#include <fstream>
#include "opencv2/core.hpp"
//#include "./imgproc/segmentation.hpp"

void testOpenImage()
{
	char fname[MAX_PATH];
	while(openFileDlg(fname))
	{
		Mat src;
		src = imread(fname);
		imshow("image",src);
		waitKey();
	}
}

void testOpenImagesFld()
{
	char folderName[MAX_PATH];
	if (openFolderDlg(folderName)==0)
		return;
	char fname[MAX_PATH];
	FileGetter fg(folderName,"bmp");
	while(fg.getNextAbsFile(fname))
	{
		Mat src;
		src = imread(fname);
		imshow(fg.getFoundFileName(),src);
		if (waitKey()==27) //ESC pressed
			break;
	}
}

void testImageOpenAndSave()
{
	Mat src, dst;

	src = imread("Images/Lena_24bits.bmp", IMREAD_COLOR);	// Read the image

	if (!src.data)	// Check for invalid input
	{
		printf("Could not open or find the image\n");
		return;
	}

	// Get the image resolution
	Size src_size = Size(src.cols, src.rows);

	// Display window
	const char* WIN_SRC = "Src"; //window for the source image
	namedWindow(WIN_SRC, WINDOW_AUTOSIZE);
	moveWindow(WIN_SRC, 0, 0);

	const char* WIN_DST = "Dst"; //window for the destination (processed) image
	namedWindow(WIN_DST, WINDOW_AUTOSIZE);
	moveWindow(WIN_DST, src_size.width + 10, 0);

	cvtColor(src, dst, COLOR_BGR2GRAY); //converts the source image to a grayscale one

	imwrite("Images/Lena_24bits_gray.bmp", dst); //writes the destination to file

	imshow(WIN_SRC, src);
	imshow(WIN_DST, dst);

	printf("Press any key to continue ...\n");
	waitKey(0);
}

void testNegativeImage()
{
	char fname[MAX_PATH];
	while(openFileDlg(fname))
	{
		double t = (double)getTickCount(); // Get the current time [s]
		
		Mat src = imread(fname,IMREAD_GRAYSCALE);
		int height = src.rows;
		int width = src.cols;
		Mat dst = Mat(height,width,CV_8UC1);
		// Asa se acceseaaza pixelii individuali pt. o imagine cu 8 biti/pixel
		// Varianta ineficienta (lenta)
		for (int i=0; i<height; i++)
		{
			for (int j=0; j<width; j++)
			{
				uchar val = src.at<uchar>(i,j);
				uchar neg = 255 - val;
				dst.at<uchar>(i,j) = neg;
			}
		}

		// Get the current time again and compute the time difference [s]
		t = ((double)getTickCount() - t) / getTickFrequency();
		// Print (in the console window) the processing time in [ms] 
		printf("Time = %.3f [ms]\n", t * 1000);

		imshow("input image",src);
		imshow("negative image",dst);
		waitKey();
	}
}

void testParcurgereSimplaDiblookStyle()
{
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		Mat src = imread(fname, IMREAD_GRAYSCALE);
		int height = src.rows;
		int width = src.cols;
		Mat dst = src.clone();

		double t = (double)getTickCount(); // Get the current time [s]

		// the fastest approach using the “diblook style”
		uchar *lpSrc = src.data;
		uchar *lpDst = dst.data;
		int w = (int) src.step; // no dword alignment is done !!!
		for (int i = 0; i<height; i++)
			for (int j = 0; j < width; j++) {
				uchar val = lpSrc[i*w + j];
				lpDst[i*w + j] = 255 - val;
			}

		// Get the current time again and compute the time difference [s]
		t = ((double)getTickCount() - t) / getTickFrequency();
		// Print (in the console window) the processing time in [ms] 
		printf("Time = %.3f [ms]\n", t * 1000);

		imshow("input image",src);
		imshow("negative image",dst);
		waitKey();
	}
}

void testColor2Gray()
{
	char fname[MAX_PATH];
	while(openFileDlg(fname))
	{
		Mat src = imread(fname);

		int height = src.rows;
		int width = src.cols;

		Mat dst = Mat(height,width,CV_8UC1);

		// Asa se acceseaaza pixelii individuali pt. o imagine RGB 24 biti/pixel
		// Varianta ineficienta (lenta)
		for (int i=0; i<height; i++)
		{
			for (int j=0; j<width; j++)
			{
				Vec3b v3 = src.at<Vec3b>(i,j);
				uchar b = v3[0];
				uchar g = v3[1];
				uchar r = v3[2];
				dst.at<uchar>(i,j) = (r+g+b)/3;
			}
		}
		
		imshow("input image",src);
		imshow("gray image",dst);
		waitKey();
	}
}

void testBGR2HSV()
{
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		Mat src = imread(fname);
		int height = src.rows;
		int width = src.cols;

		// Componentele d eculoare ale modelului HSV
		Mat H = Mat(height, width, CV_8UC1);
		Mat S = Mat(height, width, CV_8UC1);
		Mat V = Mat(height, width, CV_8UC1);

		// definire pointeri la matricele (8 biti/pixeli) folosite la afisarea componentelor individuale H,S,V
		uchar* lpH = H.data;
		uchar* lpS = S.data;
		uchar* lpV = V.data;

		Mat hsvImg;
		cvtColor(src, hsvImg, COLOR_BGR2HSV);

		// definire pointer la matricea (24 biti/pixeli) a imaginii HSV
		uchar* hsvDataPtr = hsvImg.data;

		for (int i = 0; i<height; i++)
		{
			for (int j = 0; j<width; j++)
			{
				int hi = i*width * 3 + j * 3;
				int gi = i*width + j;

				lpH[gi] = hsvDataPtr[hi] * 510 / 360;		// lpH = 0 .. 255
				lpS[gi] = hsvDataPtr[hi + 1];			// lpS = 0 .. 255
				lpV[gi] = hsvDataPtr[hi + 2];			// lpV = 0 .. 255
			}
		}

		imshow("input image", src);
		imshow("H", H);
		imshow("S", S);
		imshow("V", V);

		waitKey();
	}
}

void testResize()
{
	char fname[MAX_PATH];
	while(openFileDlg(fname))
	{
		Mat src;
		src = imread(fname);
		Mat dst1,dst2;
		//without interpolation
		resizeImg(src,dst1,320,false);
		//with interpolation
		resizeImg(src,dst2,320,true);
		imshow("input image",src);
		imshow("resized image (without interpolation)",dst1);
		imshow("resized image (with interpolation)",dst2);
		waitKey();
	}
}

void testCanny()
{
	char fname[MAX_PATH];
	while(openFileDlg(fname))
	{
		Mat src,dst,gauss;
		src = imread(fname,IMREAD_GRAYSCALE);
		double k = 0.4;
		int pH = 50;
		int pL = (int) k*pH;
		GaussianBlur(src, gauss, Size(5, 5), 0.8, 0.8);
		Canny(gauss,dst,pL,pH,3);
		imshow("input image",src);
		imshow("canny",dst);
		waitKey();
	}
}

void testVideoSequence()
{
	VideoCapture cap("Videos/rubic.avi"); // off-line video from file
	//VideoCapture cap(0);	// live video from web cam
	if (!cap.isOpened()) {
		printf("Cannot open video capture device.\n");
		waitKey(0);
		return;
	}
		
	Mat edges;
	Mat frame;
	char c;

	while (cap.read(frame))
	{
		Mat grayFrame;
		cvtColor(frame, grayFrame, COLOR_BGR2GRAY);
		Canny(grayFrame,edges,40,100,3);
		imshow("source", frame);
		imshow("gray", grayFrame);
		imshow("edges", edges);
		c = waitKey(0);  // waits a key press to advance to the next frame
		if (c == 27) {
			// press ESC to exit
			printf("ESC pressed - capture finished\n"); 
			break;  //ESC pressed
		};
	}
}


void testSnap()
{
	VideoCapture cap(0); // open the deafult camera (i.e. the built in web cam)
	if (!cap.isOpened()) // openenig the video device failed
	{
		printf("Cannot open video capture device.\n");
		return;
	}

	Mat frame;
	char numberStr[256];
	char fileName[256];
	
	// video resolution
	Size capS = Size((int)cap.get(CAP_PROP_FRAME_WIDTH),
		(int)cap.get(CAP_PROP_FRAME_HEIGHT));

	// Display window
	const char* WIN_SRC = "Src"; //window for the source frame
	namedWindow(WIN_SRC, WINDOW_AUTOSIZE);
	moveWindow(WIN_SRC, 0, 0);

	const char* WIN_DST = "Snapped"; //window for showing the snapped frame
	namedWindow(WIN_DST, WINDOW_AUTOSIZE);
	moveWindow(WIN_DST, capS.width + 10, 0);

	char c;
	int frameNum = -1;
	int frameCount = 0;

	for (;;)
	{
		cap >> frame; // get a new frame from camera
		if (frame.empty())
		{
			printf("End of the video file\n");
			break;
		}

		++frameNum;
		
		imshow(WIN_SRC, frame);

		c = waitKey(10);  // waits a key press to advance to the next frame
		if (c == 27) {
			// press ESC to exit
			printf("ESC pressed - capture finished");
			break;  //ESC pressed
		}
		if (c == 115){ //'s' pressed - snapp the image to a file
			frameCount++;
			fileName[0] = NULL;
			sprintf(numberStr, "%d", frameCount);
			strcat(fileName, "Images/A");
			strcat(fileName, numberStr);
			strcat(fileName, ".bmp");
			bool bSuccess = imwrite(fileName, frame);
			if (!bSuccess) 
			{
				printf("Error writing the snapped image\n");
			}
			else
				imshow(WIN_DST, frame);
		}
	}

}

void MyCallBackFunc(int event, int x, int y, int flags, void* param)
{
	//More examples: http://opencvexamples.blogspot.com/2014/01/detect-mouse-clicks-and-moves-on-image.html
	Mat* src = (Mat*)param;
	if (event == EVENT_LBUTTONDOWN)
		{
			printf("Pos(x,y): %d,%d  Color(RGB): %d,%d,%d\n",
				x, y,
				(int)(*src).at<Vec3b>(y, x)[2],
				(int)(*src).at<Vec3b>(y, x)[1],
				(int)(*src).at<Vec3b>(y, x)[0]);
		}
}

void testMouseClick()
{
	Mat src;
	// Read image from file 
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		src = imread(fname);
		//Create a window
		namedWindow("My Window", 1);

		//set the callback function for any mouse event
		setMouseCallback("My Window", MyCallBackFunc, &src);

		//show the image
		imshow("My Window", src);

		// Wait until user press some key
		waitKey(0);
	}
}

/* Histogram display function - display a histogram using bars (simlilar to L3 / PI)
Input:
name - destination (output) window name
hist - pointer to the vector containing the histogram values
hist_cols - no. of bins (elements) in the histogram = histogram image width
hist_height - height of the histogram image
Call example:
showHistogram ("MyHist", hist_dir, 255, 200);
*/
void showHistogram(const std::string& name, int* hist, const int  hist_cols, const int hist_height)
{
	Mat imgHist(hist_height, hist_cols, CV_8UC3, CV_RGB(255, 255, 255)); // constructs a white image

	//computes histogram maximum
	int max_hist = 0;
	for (int i = 0; i<hist_cols; i++)
	if (hist[i] > max_hist)
		max_hist = hist[i];
	double scale = 1.0;
	scale = (double)hist_height / max_hist;
	int baseline = hist_height - 1;

	for (int x = 0; x < hist_cols; x++) {
		Point p1 = Point(x, baseline);
		Point p2 = Point(x, baseline - cvRound(hist[x] * scale));
		line(imgHist, p1, p2, CV_RGB(255, 102, 0)); // histogram bins colored in orange
	}

	imshow(name, imgHist);
}


void test_factorAditiv(){
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				int aditiv = 100;
				int valoare = img.at<uchar>(i,j) + aditiv;
				if (valoare > 255)
					valoare = 255;
				else if (valoare < 0)
					valoare = 0;
				img.at<uchar>(i, j) = aditiv + img.at<uchar>(i, j);
			
			}
		}
		imshow("factor aditiv", img);
		waitKey(0);
	}

}

void test_factorMultiplicativ() {
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		char button;
		int factor;
		printf("factor de multiplicare: ");
		scanf(" %c", &button);
		switch (button)
		{
		case '1':
			factor = 1;
			break;
		case'2':
			factor = 2;
			break;
		case'3':
			factor = 3;
			break;
		case'4':
			factor = 4;
			break;
		default:
			factor = 1;
			break;
		}
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				int valoare = factor * img.at<uchar>(i, j);
				if (valoare > 255)
					valoare = 255;
				else if (valoare < 0)
					valoare = 0;
				img.at<uchar>(i, j) = valoare;
	
			}
		}
		imshow("multiplicare", img);
		imwrite("multiplicare.bmp", img);
		waitKey(0);
	}
}

void test_imagine4() {
	Mat img(256, 256, CV_8UC3);
	for (int i = 0; i < 255; i++) {
		for (int j = 0; j < 255; j++) {
			if (i < 128 && j < 128)
				img.at< Vec3b>(i, j) = Vec3b(255,255,255);
			if (i <= 128 && j >= 128)
				img.at< Vec3b>(i, j) = Vec3b(0, 0, 255);  //BGR 
			if (i > 128 && j < 128)
				img.at< Vec3b>(i, j) = Vec3b(0, 255, 0);
			if (i >= 128 && j >= 128)
				img.at< Vec3b>(i, j) = Vec3b(0, 255, 255);
		}
	}
	imshow("colorat", img);
	waitKey(0);
}

void test_matrice() {
	float valori[9] = {2,3,4,5,6,7,8,9,9};
	Mat matrice3x3(3 ,3 ,CV_32FC1, valori);
	std::cout << matrice3x3.inv() << std::endl;
	Sleep(10000000);
	

}

void rgbToColors(){
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_COLOR);
		Mat imgR(img.rows, img.cols, CV_8UC1);
		Mat imgG(img.rows, img.cols, CV_8UC1);
		Mat imgB(img.rows, img.cols, CV_8UC1);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				Vec3b var = img.at< Vec3b>(i, j);
				imgB.at<uchar>(i, j) = var[0];
				imgG.at<uchar>(i, j) = var[1];
				imgR.at<uchar>(i, j) = var[2];
			}
		}
		imshow("R1", imgR);
		imshow("G1", imgG);
		imshow("B1", imgB);
		waitKey(0);

	}

}

void convertToGrayscale() {
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_COLOR);
		Mat img2(img.rows, img.cols, CV_8UC1);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				Vec3b var = img.at< Vec3b>(i, j);
				uchar var2 = (var[0] + var[1] + var[2]) / 3;
				img2.at<uchar>(i, j) = var2;
			}
		}
		imshow("gray", img2);
		waitKey(0);
	}

}

void convertToBW() {
	char fname[MAX_PATH];
	int threshold;
	printf("Give me the threshold! ");
	scanf("%d", &threshold);
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		Mat img2(img.rows, img.cols, CV_8UC1);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				uchar var = img.at< uchar>(i, j);
				if (var < threshold)
					img2.at< uchar>(i, j) = 0;
				else
					img2.at< uchar>(i, j) = 255;
			}
		}
		imshow("BW", img2);
		waitKey(0);

	}


}

void convertToHSV() {
	char fname[MAX_PATH];
	float M, m, C, V, S, H, H_norm, S_norm, V_norm;
	uchar R, G, B;
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_COLOR);
		Mat imgH(img.rows, img.cols, CV_8UC1);
		Mat imgV(img.rows, img.cols, CV_8UC1);
		Mat imgS(img.rows, img.cols, CV_8UC1);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				Vec3b var = img.at< Vec3b>(i, j);
				B = var[0];
				G = var[1];
				R = var[2];
				float r = (float)R / 255;
				float g = (float)G / 255;
				float b = (float)B / 255;
				M = max(b, max(r, g));
				m = min(b, min(r, g));
				C = M - m;
				V = M;
				if (V != 0)
					S = C / V;
				else
					S = 0;

				if (C != 0) {
					if (M == r) H = 60 * (g - b) / C;
					if (M == g) H = 120 + 60 * (b - r) / C;
					if (M == b) H = 240 + 60 * (r - g) / C;
				}
				else
					H = 0;

				if (H < 0)
					H = H + 360;

				H_norm = (H * 255) / 360;
				S_norm = S * 255;
				V_norm = V * 255;

				imgH.at<uchar>(i, j) = (uchar) H_norm;
				imgS.at<uchar>(i, j) = S_norm;
				imgV.at<uchar>(i, j) = V_norm;

			}
		}
		imshow("H", imgH);
		imshow("S", imgS);
		imshow("V", imgV);
		waitKey(0);
	}
		
}

bool isInside(Mat img, int i, int j) {
	if ((i < img.rows) && (j < img.cols) && (i >= 0) && (j >= 0))
		return true;
	else
		return false;

}

void histogram() {
	int x[256] = {};
	int x2[256] = {};
	int W;
	scanf("%d", &W);
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {               //calculam histograma
			for (int j = 0; j < img.cols; j++) {
				x[img.at<uchar>(i, j)] ++;

			}
		}
		for (int i = 0; i < 256; i++) {
			printf("[%d]-> %d ",i, x[i]);

		}
		for (int k = W/2; k < (256 - W/2); k++) {
			for(int j = k-W/2; j<=k+W/2; j++){
				//inmultim valorile de la j cu valorile de la i, le adunam toate, si apoi le impartim la w
				//elementu respectiv il punem in alta histograma la pozitia i
				


		
		imshow("histogram", img);
		waitKey(0);

	}

}

void FDP() {
	int x[256] = {};
	float y[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				x[img.at<uchar>(i, j)] ++;

			}
		}
		for (int i = 0; i < 256; i++) {
			y[i] = (float) x[i] / (img.rows * img.cols);
			printf("[%d]-> %f ", i, y[i]);

		}

		imshow("FDP", img);
		waitKey(0);

	}
}

void printHistogram() {
	int x[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				x[img.at<uchar>(i, j)] ++;

			}
		}
		showHistogram("histogram", x, 256, 300);
		waitKey(0);

	}
	
}
void histogramLower() {
	int x[128] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				int var = 0.5 * img.at<uchar>(i, j);
				x[var] ++;

			}
		}
		for (int i = 0; i < 128; i++) {
			printf("[%d]-> %d ", i, x[i]);
			
		}

		showHistogram("histogram", x, 128, 300);
		waitKey(0);

	}

}

void praguri() {
	int WH = 5;
	int TH = 0.0003;
	float v;
	int val;
	int vec[255];
	int count = 1;
	int x[256] = {};
	float y[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				x[img.at<uchar>(i, j)] ++;

			}
		}
		for (int i = 0; i < 256; i++) {
			y[i] = (float)x[i] / (img.rows * img.cols);
		}

		for (int k = WH; k <= 255 - WH; k++) {
			v = 0;
			for (int i = k - WH; i <= k + WH; i++) {
				v += y[i];
				if (y[i] > y[k])
					v += 1000;
			}
			v = v / (2 * WH + 1);
			if (y[k] > v + TH) {
				vec[count] = k;
				count++;
			}
		}
		vec[0] = 0;
		vec[count] = 255;

		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				val = img.at<uchar>(i, j);
				int min = 255;
				int close;
				for (int z = 0; z < count + 1; z++) {
					if (abs(val - vec[z]) < min) {
						min = abs(val - vec[z]);
						close = vec[z];
					}
				}
				img.at<uchar>(i, j) = close;
			}
		}

		imshow("praguri", img);
		waitKey();
	}
			

}

void FloydSteinberg() {
	int WH = 5;
	float TH = 0.0003;
	float v;
	int val;
	int vec[255];
	int count = 1;
	int x[256] = {};
	float y[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				x[img.at<uchar>(i, j)] ++;

			}
		}
		for (int i = 0; i < 256; i++) {
			y[i] = (float)x[i] / (img.rows * img.cols);
		}

		for (int k = WH; k <= 255 - WH; k++) {
			v = 0;
			for (int i = k - WH; i <= k + WH; i++) {
				v += y[i];
				if (y[i] > y[k])
					v += 1000;
			}
			v = v / (2 * WH + 1);
			if (y[k] > v + TH) {
				vec[count] = k;
				count++;
			}
		}
		vec[0] = 0;
		vec[count] = 255;

		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				val = img.at<uchar>(i, j);
				int min = 256;
				int close;
				for (int z = 0; z < count + 1; z++) {
					if (abs(vec[z] - val) < min) {
						min = abs(vec[z] - val);
						close = vec[z];
					}
				}
				img.at<uchar>(i, j) = close;
				int eroare = val - close;
				if (isInside(img, i + 1, j) == true) {
					if ((img.at<uchar>(i + 1, j) + 7 * eroare / 16) < 0)
						img.at<uchar>(i + 1, j) = 0;
					else if ((img.at<uchar>(i + 1, j) + 7 * eroare / 16) > 255)
						img.at<uchar>(i + 1, j) = 255;
					else
						img.at<uchar>(i + 1, j) = img.at<uchar>(i + 1, j) + 7 * eroare / 16;
				}

				if (isInside(img, i - 1, j+1) == true) {
					if ((img.at<uchar>(i - 1, j+1) + 3 * eroare / 16) < 0)
						img.at<uchar>(i - 1, j+1) = 0;
					else if ((img.at<uchar>(i - 1, j+1) + 3 * eroare / 16) > 255)
						img.at<uchar>(i - 1, j+1) = 255;
					else
						img.at<uchar>(i - 1, j+1) = img.at<uchar>(i - 1, j+1) + 3 * eroare / 16;
				}

				if (isInside(img, i, j + 1) == true) {
					if ((img.at<uchar>(i, j + 1) + 5 * eroare / 16) < 0)
						img.at<uchar>(i, j + 1) = 0;
					else if ((img.at<uchar>(i, j + 1) + 5 * eroare / 16) > 255)
						img.at<uchar>(i, j + 1) = 255;
					else
						img.at<uchar>(i, j + 1) = img.at<uchar>(i, j + 1) + 5 * eroare / 16;
				}
				if (isInside(img, i + 1, j + 1) == true) {
					if ((img.at<uchar>(i + 1, j + 1) + eroare / 16) < 0)
						img.at<uchar>(i + 1, j + 1) = 0;
					else if ((img.at<uchar>(i + 1, j + 1) + eroare / 16) > 255)
						img.at<uchar>(i + 1, j + 1) = 255;
					else
						img.at<uchar>(i + 1, j + 1) = img.at<uchar>(i + 1, j + 1) +  eroare / 16;
				}

			}
		}

		imshow("Floyd Mayweather", img);
		waitKey();
	}


}



void MyCallBackFunction(int event, int x, int y, int flags, void* param)
{
	//More examples: http://opencvexamples.blogspot.com/2014/01/detect-mouse-clicks-and-moves-on-image.html
	Mat* src = (Mat*)param;
	Vec3b pixel;
	int arie = 0;
	int rand = 0 , col = 0;
	int rand2, col2;
	int axa = 0	, axa2 = 0;
	int phi;
	int perry = 0;
	float thickness = 0;
	float RRR;
	int imin = 999999, jmin = 999999, imax = -1	 , jmax = -1;
	if (event == EVENT_LBUTTONDOWN)
	{
		printf("Pos(x,y): %d,%d  Color(RGB): %d,%d,%d\n",
			x, y,
			(int)(*src).at<Vec3b>(y, x)[2],
			(int)(*src).at<Vec3b>(y, x)[1],
			(int)(*src).at<Vec3b>(y, x)[0]);
		pixel = Vec3b((*src).at<Vec3b>(y, x)[0], (*src).at<Vec3b>(y, x)[1], (*src).at<Vec3b>(y, x)[2]);
		for (int i = 0; i < src->rows; i++) {
			for (int j = 0; j < src->cols; j++) {
				if (pixel == src->at<Vec3b>(i, j)) {
					arie++;
					rand += i;
					col += j;
					if ((src->at<Vec3b>(i + 1, j) != pixel) || (src->at<Vec3b>(i, j + 1) != pixel) ||
						(src->at<Vec3b>(i - 1, j) != pixel) || (src->at<Vec3b>(i, j - 1) != pixel) ||
						(src->at<Vec3b>(i - 1, j - 1) != pixel) || (src->at<Vec3b>(i + 1, j + 1) != pixel) ||
						(src->at<Vec3b>(i - 1, j + 1) != pixel) || (src->at<Vec3b>(i + 1, j - 1) != pixel))
						perry++;
					if (i < imin)
						imin = i;
					if (i > imax)
						imax = i;
					if (j < jmin)
						jmin = j;
					if (j > jmax)
						jmax = j;
				}
			}
		}
		rand2 = rand / arie;
		col2 = col / arie;
		printf("Aria este: %d \n", arie);
		printf("Centrul de masa este (%d, %d)\n", rand2, col2);
		for (int i = 0; i < src->rows; i++) {
			for (int j = 0; j < src->cols; j++) {
				if (pixel == src->at<Vec3b>(i, j)) {
					axa += (i - rand2) * (j - col2);
					axa2 += pow((j - col2), 2) - pow((i - rand2), 2);
				}
			}
		}
		axa = axa * 2;
		float axa3 = atan2(axa, axa2);
		phi = axa3 * (180 / CV_PI);
		phi = phi / 2;
		if (phi < 0)
			phi += 180;
		printf("Axa de alungire este: %d\n", phi);
		perry = perry * (CV_PI / 4);
		printf("Perimetrul este: %d \n", perry);
		thickness = 4 * CV_PI * ((float)arie / pow(perry,2));
		printf("Factorul de subtiere este: %f\n", thickness);
		RRR = (float)(jmax - jmin + 1) / (imax - imin + 1);
		printf("Elongatia este: %f\n", RRR);

		

	}

}

void MouseClick()
{
	Mat src;
	// Read image from file 
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		src = imread(fname);
		//Create a window
		namedWindow("My Window", 1);

		//set the callback function for any mouse event
		setMouseCallback("My Window", MyCallBackFunction, &src);

		//show the image
		imshow("My Window", src);

		// Wait until user press some key
		waitKey(0);
	}
}

void etichetare() {
	uchar val, label = 0;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	Vec3b culoare;
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		Mat labels = Mat::zeros(img.rows, img.cols, CV_8UC1);
		Mat afis(img.rows, img.cols, CV_8UC3, Scalar(255,255,255));
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = img.at<uchar>(i, j);
				if ((val == 0) && (labels.at<uchar>(i, j) == 0)) {
					label++;
					std::queue<Point> Q;
					labels.at<uchar>(i, j) = label;
					Q.push({ i,j });
					while (!Q.empty()) {
						Point q = Q.front();
						Q.pop();
						for (int k = 0; k < 8; k++) {
							if ((img.at<uchar>(q.x + di[k], q.y + dj[k]) == 0) && (labels.at<uchar>(q.x + di[k], q.y + dj[k]) == 0)) {
								labels.at<uchar>(q.x + di[k], q.y + dj[k]) = label;
								Q.push({ q.x + di[k], q.y + dj[k] });
							}
						}
					}
				}
			}
		}
		imshow("labels", labels);


		std::default_random_engine gen;
		std::uniform_int_distribution<int> d(0, 255);
		for (int k = 1; k <= label; k++) {
			uchar red = d(gen);
			uchar blue = d(gen);
			uchar green = d(gen);
			Vec3b color = Vec3b(blue, green, red);
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) { 
					if (labels.at<uchar>(i, j) == k)
						afis.at<Vec3b>(i, j) = color;
				}
			}
		}
		imshow("coloured", afis);
		waitKey(0);
	}
}

void contur() {

	Mat image;
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		image = imread(fname, 0);

		Mat	conturImage(image.rows, image.cols, CV_8UC1, Scalar(255));

		int dj[8] = { 1, 1, 0,-1, -1, -1, 0, 1 };
		int di[8] = { 0, -1, -1, -1, 0, 1, 1, 1 };
		int dir = 7;
		int derivativeDirValue;

		Point p1, p2, p3, p4;
		bool stop = false;

		std::vector<Point> contur;

		for (int i = 1; i < image.rows; i++) {
			for (int j = 1; j < image.cols - 1; j++) {
				if (image.at<uchar>(i, j) == 0) {
					p1.x = i;
					p1.y = j;
					stop = true;
					break;
				}
			}
			if (stop == true)
				break;
		}

		for (int k = 0; k < 8; k++) {
			int x = p1.x + di[(dir + 6) % 8];
			int y = p1.y + dj[(dir + 6) % 8];
			if (image.at<uchar>(x, y) == 0) {
				p2.x = x;
				p2.y = y;
				break;
			}
			dir++;
		}
		dir = (dir + 6) % 8;

		contur.push_back(p1);
		contur.push_back(p2);

		p4 = p2;

		while (!((p3.x == p1.x) && (p3.y == p1.y) && (p4.x == p2.x) && (p4.y == p2.y))) {
			p3 = p4;
			if (dir % 2 != 1) {
				for (int k = 0; k < 8; k++) {
					int x = p3.x + di[(dir + 7) % 8];
					int y = p3.y + dj[(dir + 7) % 8];
					if (image.at<uchar>(x, y) == 0) {
						p4.x = x;
						p4.y = y;
						break;
					}
					dir++;
				}
				dir = (dir + 7) % 8;
			}
			else {
				for (int k = 0; k < 8; k++) {
					int x = p3.x + di[(dir + 6) % 8];
					int y = p3.y + dj[(dir + 6) % 8];
					if (image.at<uchar>(x, y) == 0) {
						p4.x = x;
						p4.y = y;
						break;
					}
					dir++;
				}
				dir = (dir + 6) % 8;
			}
			contur.push_back(p4);
		}

		for (int i = 0; i < contur.size(); i++) {
			conturImage.at<uchar>(contur[i].x, contur[i].y) = 0;
		}
		imshow("contur", conturImage);
		waitKey(0);
	}
}

void print_dir() {
	Mat image;
	char fname[MAX_PATH];
	while (openFileDlg(fname))
	{
		image = imread(fname, 0);

		int dj[8] = { 1, 1, 0,-1, -1, -1, 0, 1 };
		int di[8] = { 0, -1, -1, -1, 0, 1, 1, 1 };
		int dir = 7;

		Point p1, p2, p3, p4;
		bool stop = false;

		std::vector<int> dirs;

		for (int i = 1; i < image.rows; i++) {
			for (int j = 1; j < image.cols - 1; j++) {
				if (image.at<uchar>(i, j) == 0) {
					p1.x = i;
					p1.y = j;
					stop = true;
					break;
				}
			}
			if (stop == true)
				break;
		}

		for (int k = 0; k < 8; k++) {
			int x = p1.x + di[(dir + 6) % 8];
			int y = p1.y + dj[(dir + 6) % 8];
			if (image.at<uchar>(x, y) == 0) {
				p2.x = x;
				p2.y = y;
				break;
			}
			dir++;
		}

		dir = (dir + 6) % 8;

		dirs.push_back(dir);

		p4 = p2;

		while (!((p3.x == p1.x) && (p3.y == p1.y) && (p4.x == p2.x) && (p4.y == p2.y))) {
			p3 = p4;
			if (dir % 2 != 1) {
				for (int k = 0; k < 8; k++) {
					int x = p3.x + di[(dir + 7) % 8];
					int y = p3.y + dj[(dir + 7) % 8];
					if (image.at<uchar>(x, y) == 0) {
						p4.x = x;
						p4.y = y;
						break;
					}
					dir++;
				}
				dir = (dir + 7) % 8;
			}
			else {
				for (int k = 0; k < 8; k++) {
					int x = p3.x + di[(dir + 6) % 8];
					int y = p3.y + dj[(dir + 6) % 8];
					if (image.at<uchar>(x, y) == 0) {
						p4.x = x;
						p4.y = y;
						break;
					}
					dir++;
				}
				dir = (dir + 6) % 8;
			}
			dirs.push_back(dir);
		}
		printf("Dirs: ");
		for (int i = 0; i < dirs.size() - 2; i++) {
			printf("%d ", dirs[i]);
		}

		printf("\nDerivata: ");

		for (int i = 1; i < dirs.size() - 2; i++) {
			printf("%d ", (8 + dirs[i] - dirs[i - 1]) % 8);
		}

		printf("%d", (8 + dirs[0] - dirs[dirs.size() - 3]) % 8);

		waitKey(20000);
	}
}

void reconstructie() {
	Mat src;
	char fname[MAX_PATH];
	std::string filename("D:\\Facultate_an3\\Sem2\\PI\\Lab\\files_border_tracing\\reconstruct.txt");
	while (openFileDlg(fname))
	{
		src = imread(fname, 0);
		imshow("contur", src);

		int dj[8] = { 1, 1, 0,-1, -1, -1, 0, 1 };
		int di[8] = { 0, -1, -1, -1, 0, 1, 1, 1 };

		int x, y, nr;
		int dir;

		std::ifstream input_file(filename);

		input_file >> x >> y >> nr;
		src.at<uchar>(x, y) = 0;
	
		while (input_file >> dir) {
			x = x + di[dir];
			y = y + dj[dir];
			src.at<uchar>(x, y) = 0;
		}
		
		imshow("contur", src);
		waitKey(0);
		
	}
}

void dilatare() {
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		Mat afis(img.rows, img.cols, CV_8UC1, Scalar(255));
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = img.at<uchar>(i, j);
				if (val == 0) {
					for (int k = 0; k < 8; k++) {
						afis.at<uchar>(i+di[k], j+dj[k]) = 0;
					}
				}
			}
		}
		imshow("dilatare", afis);
		imshow("original", img);
		waitKey(0);
	}
}

void eroziune() {
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		Mat afis(img.rows, img.cols, CV_8UC1);
		afis = img.clone();
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = img.at<uchar>(i, j);
				if (val == 255) {
					for (int k = 0; k < 8; k++) {
						afis.at<uchar>(i + di[k], j + dj[k]) = 255;
					}
				}
			}
		}
		imshow("eroziune", afis);
		imshow("original", img);
		waitKey(0);
	}
}

void deschidere() {
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("original", img);
		Mat afis(img.rows, img.cols, CV_8UC1);
		Mat afis2(img.rows, img.cols, CV_8UC1);
		afis = img.clone();
		//eroziune();
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = img.at<uchar>(i, j);
				if (val == 255) {
					for (int k = 0; k < 8; k++) {
						afis.at<uchar>(i + di[k], j + dj[k]) = 255;
					}
				}
			}
		}
		afis2 = afis.clone();
		
		imshow("deschidere", afis);
		waitKey(2000);
		//dilatare();
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = afis.at<uchar>(i, j);
				if (val == 0) {
					for (int k = 0; k < 8; k++) {
						afis2.at<uchar>(i + di[k], j + dj[k]) = 0;
					}
				}
			}
		}
		imshow("deschidere", afis2);
		waitKey(0);
	}
}

void inchidere() {
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("original", img);
		Mat afis(img.rows, img.cols, CV_8UC1);
		Mat afis2(img.rows, img.cols, CV_8UC1);
		afis = img.clone();
		//dilatare();
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = img.at<uchar>(i, j);
				if (val == 0) {
					for (int k = 0; k < 8; k++) {
						afis.at<uchar>(i + di[k], j + dj[k]) = 0;
					}
				}
			}
		}
		afis2 = afis.clone();
		imshow("inchidere", afis);
		waitKey(2000);

		//eroziune();
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				val = afis.at<uchar>(i, j);
				if (val == 255) {
					for (int k = 0; k < 8; k++) {
						afis2.at<uchar>(i + di[k], j + dj[k]) = 255;
					}
				}
			}
		}
		
		imshow("inchidere", afis2);
		waitKey(0);
	}
}

void dilatare_n() {
	int n = 1;
	printf("Introduceti n de la tastatura: ");
	scanf("%d", &n);
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("dilatare", img);
		Mat afis(img.rows, img.cols, CV_8UC1, Scalar(255));
		Mat afis2(img.rows, img.cols, CV_8UC1, Scalar(255));
		afis2 = img.clone();
		afis = img.clone();
		for (int z = 0; z < n; z++) {
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 0) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 0;
						}
					}
				}
			}
			imshow("dilatare", afis);
			waitKey(200);
			afis2 = afis.clone();
		}
		imshow("dilatare", afis);
		
		waitKey(0);
	}
}

void eroziune_n() {
	int n = 1;
	printf("Introduceti n de la tastatura: ");
	scanf("%d", &n);
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("eroziune", img);
		Mat afis(img.rows, img.cols, CV_8UC1);
		Mat afis2(img.rows, img.cols, CV_8UC1);
		afis2 = img.clone();
		afis = img.clone();
		for (int z = 0; z < n; z++){
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 255) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 255;
						}
					}
				}
			}
			imshow("eroziune", afis);
			waitKey(200);
			afis2 = afis.clone();
		}
		waitKey(0);
	}
}


void deschidere_n() {
	int n = 1;
	printf("Introduceti n de la tastatura: ");
	scanf("%d", &n);
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("deschidere_n", img);
		Mat afis(img.rows, img.cols, CV_8UC1);
		Mat afis2(img.rows, img.cols, CV_8UC1);
		afis = img.clone();
		afis2 = img.clone();
		//eroziune();
		for (int z = 0; z < n; z++) {
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 255) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 255;
						}
					}
				}

			}
			afis2 = afis.clone();
			imshow("deschidere_n", afis);
			waitKey(200);
			//dilatare();
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 0) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 0;
						}
					}
				}

			}
			imshow("deschidere_n", afis);
			waitKey(200);
			afis2 = afis.clone();
		}
		imshow("deschidere_n", afis);
		waitKey(0);
	}
}

void inchidere_n() {
	int n = 1;
	printf("Introduceti n de la tastatura: ");
	scanf("%d", &n);
	uchar val;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		imshow("inchidere_n", img);
		Mat afis(img.rows, img.cols, CV_8UC1);
		Mat afis2(img.rows, img.cols, CV_8UC1);
		afis = img.clone();
		afis2 = img.clone();
		//dilatare();
		for (int z = 0; z < n; z++) {
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 0) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 0;
						}
					}
				}
			}
			afis2 = afis.clone();
			imshow("inchidere_n", afis);
			waitKey(200);

			//eroziune();
			for (int i = 1; i < img.rows - 1; i++) {
				for (int j = 1; j < img.cols - 1; j++) {
					val = afis2.at<uchar>(i, j);
					if (val == 255) {
						for (int k = 0; k < 8; k++) {
							afis.at<uchar>(i + di[k], j + dj[k]) = 255;
						}
					}
				}
			}
			afis2 = afis.clone();
			imshow("inchidere_n", afis);
			waitKey(200);
		}

		imshow("inchidere_n", afis);
		waitKey(0);
	}
}
void infoHistograma() {
	float deviatia = 0, media = 0, pixeli = 0, pixeli2 = 0;
	int hist[256] = {}, histCumul[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				pixeli += img.at<uchar>(i, j);
			}
		}
		media = pixeli / (img.rows * img.cols);
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				pixeli2 += pow(img.at<uchar>(i, j) - media, 2);
			}
		}
		printf("%f\n", media);
		media = pixeli2 / (img.rows * img.cols);
		deviatia = sqrt(media);
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				hist[img.at<uchar>(i, j)]++;
			}
		}
		printf("%f\n", deviatia);
		for (int i = 0; i <= 255; i++) {
			for (int j = 0; j <= i; j++) {
				histCumul[i] += hist[j];
			}
		}
		showHistogram("histograma", hist, 256, 256);
		showHistogram("histogramaCum", histCumul, 256, 256);
		waitKey();
	}
	
}
void Binarizare() {
	float deviatia = 0, media1 = 0, media2 = 0, pixeli = 0, pixeli2 = 0, T = 0, T2 = 0;
	int min = 256, max = 0, N1 = 0, N2 = 0;
	int hist[256] = {}, histCumul[256] = {};
	char fname[MAX_PATH];
	while (openFileDlg(fname)) {
		Mat img = imread(fname, IMREAD_GRAYSCALE);
		for (int i = 1; i < img.rows - 1; i++) {
			for (int j = 1; j < img.cols - 1; j++) {
				hist[img.at<uchar>(i, j)]++;
				if (img.at<uchar>(i, j) < min)
					min = img.at<uchar>(i, j);
				if (img.at<uchar>(i, j) > max)
					max = img.at<uchar>(i, j);
			}
		}
		T = (min + max) / 2;

		while (abs(T - T2) >= 0.1) {

			T2 = T;

			media1 = 0;
			media2 = 0;
			N1 = 0;
			N2 = 0;

			for (int i = min; i < T; i++) {
				media1 += i * hist[i];
				N1 += hist[i];
			}
			for (int i = T + 1; i <= max; i++) {
				media2 += i * hist[i];
				N2 += hist[i];
			}
			media1 /= N1;
			media2 /= N2;


			T = (media1 + media2) / 2;
		}
		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				if (img.at<uchar>(i, j) <= T)
					img.at<uchar>(i, j) = 0;
				else
					img.at<uchar>(i, j) = 255;
			}
		}

		imshow("Binarizare", img);
		waitKey();
	}
}

void EgalizareHistograma() {
	Mat img;
	char fname[MAX_PATH];
	int hist[256] = {};
	int pc[256] = {};
	while (openFileDlg(fname)) {

		img = imread(fname, 0);
		imshow("Imagine sursa", img);

		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				hist[img.at<uchar>(i, j)]++;
			}
		}

		int M = img.rows * img.cols;



		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				float index = 0;
				for (int k = 0; k <= img.at<uchar>(i, j); k++)
					index += hist[k] / (float)M;
				index = index * 255;

				img.at<uchar>(i, j) = (int)index;
			}
		}

		for (int i = 0; i < img.rows; i++) {
			for (int j = 0; j < img.cols; j++) {
				pc[img.at<uchar>(i, j)]++;
			}
		}

		showHistogram("Histograma", hist, 256, 256);
		showHistogram("Histograma egalizata", pc, 256, 256);

		imshow("Imagine destinatie", img);
	}
}

void histogram_transformations() {

	Mat src;
	char fname[MAX_PATH];
	int hist[256] = {};
	int negativeHist[256] = {};
	int intensityHist[256] = {};
	int contrastHist[256] = {};
	int gammaHist[256] = {};
	int offset;
	int imin = 255;
	int imax = 0;
	int gmin, gmax;
	float gamma;

	while (openFileDlg(fname))
	{
		src = imread(fname, 0);
		imshow("originalImage", src);

		for (int i = 0; i < src.rows; i++) {
			for (int j = 0; j < src.cols; j++) {
				uchar pixelColor = src.at<uchar>(i, j);
				if (imin > pixelColor)
					imin = pixelColor;
				if (imax < pixelColor)
					imax = pixelColor;

				hist[pixelColor]++;
			}
		}


		for (int i = 0; i < 256; i++) {
			negativeHist[i] = hist[255 - i];
		}


		printf("insert offset:");
		scanf("%d", &offset);

		for (int i = 0; i < 256; i++) {
			if ((i + offset > 255) || (i + offset < 0))
				intensityHist[i] = 0;
			else
				intensityHist[i] = hist[i + offset];
		}


		printf("insert new contrast interval: ");
		scanf("%d %d", &gmin, &gmax);

		for (int i = 0; i < 256; i++) {
			int index;
			index = gmin + (i - imin) * ((gmax - gmin) / (float)(imax - imin));
			//printf("%f\n", (i - imin) * ((gmax - gmin) / (float)(imax - imin)));
			if ((index >= 0) && (index < 256))
				contrastHist[index] = hist[i];
		}

		printf("insert gamma correction: ");
		scanf("%f", &gamma);


		for (int i = 0; i < 256; i++) {
			int index;
			index = 255 * pow((i / 255.0), gamma);

			if ((index >= 0) && (index < 256))
				gammaHist[index] = hist[i];
		}


		/*for (int i = 0; i < src.rows; i++) {
			for (int j = 0; j < src.cols; j++) {
				int val;
				val = 255 * pow((src.at<uchar>(i, j) / 255.0), gamma);
				if (val < 0)
					val = 0;

				if (val > 255)
					val = 255;
				src.at<uchar>(i, j) = val;
			}
		}

		for (int i = 0; i < src.rows; i++) {
			for (int j = 0; j < src.cols; j++) {
				uchar pixelColor = src.at<uchar>(i, j);
				gammaHist[pixelColor]++;
			}
		}*/

		showHistogram("OriginalHistogram", hist, 256, 256);
		showHistogram("NegativeHistogram", negativeHist, 256, 256);
		showHistogram("IntensityHistogram", intensityHist, 256, 256);
		showHistogram("ContrstHistogram", contrastHist, 256, 256);
		showHistogram("GammaCorrectionHistogram", gammaHist, 256, 256);

		//imshow("Gamma Image", src);
	}
}


void filtruAritmetic() {
	Mat src;
	int filter[3][3] = { 1,1,1,1,1,1,1,1,1 };
	char fname[MAX_PATH];
	float scalar = 9;
	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		imshow("originalImage", src);
		Mat rezultat = src.clone();

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				int pixelVal = 0;

				for (int u = 0; u < 3; u++) {
					for (int v = 0; v < 3; v++) {
						pixelVal += filter[u][v] * src.at<uchar>(i + u - 1, j + v - 1);
					}
				}
				rezultat.at<uchar>(i, j) = pixelVal / scalar;

			}
		}

		imshow("rezultatFiltrat", rezultat);
		waitKey(0);
	}
}

void filtruGaussian() {
	Mat src;
	int filter[3][3] = {1,2,1,2,4,2,1,2,1};
	char fname[MAX_PATH];
	float scalar = 16;
	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		imshow("originalImage", src);
		Mat rezultat = src.clone();

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				int pixelVal = 0;

				for (int u = 0; u < 3; u++) {
					for (int v = 0; v < 3; v++) {
						pixelVal += filter[u][v] * src.at<uchar>(i + u - 1, j + v - 1);
					}
				}
				rezultat.at<uchar>(i, j) = pixelVal / scalar;

			}
		}

		imshow("rezultatFiltrat", rezultat);
		waitKey(0);
	}
}



void filtruLaplace() {
	Mat src;
	int filter[3][3] = { 0,-1,0,-1,4,-1,0,-1,0 };
	char fname[MAX_PATH];
	int s1 = 0, s2 = 0;
	float scalar = 0;
	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		imshow("originalImage", src);
		Mat rezultat = src.clone();

		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				if (filter[i][j] < 0)
					s1 += abs(filter[i][j]);
				else
					s2 += filter[i][j];
			}
		}
		scalar = 2 * max(s1, s2);

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				int pixelVal = 0;

				for (int u = 0; u < 3; u++) {
					for (int v = 0; v < 3; v++) {
						pixelVal += filter[u][v] * src.at<uchar>(i + u - 1, j + v - 1);
					}
				}
				rezultat.at<uchar>(i, j) = pixelVal / scalar + 255 / 2;

			}
		}
		

		imshow("rezultatFiltrat", rezultat);
		waitKey(0);
	}
}

void filtruHighpass() {
	Mat src;
	int filter[3][3] = { 0,-1,0,-1,5,-1,0,-1,0 };
	char fname[MAX_PATH];
	int s1 = 0, s2 = 0;
	float scalar = 0;
	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		imshow("originalImage", src);
		Mat rezultat = src.clone();

		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				if (filter[i][j] < 0)
					s1 += abs(filter[i][j]);
				else
					s2 += filter[i][j];
			}
		}
		scalar = 2 * max(s1, s2);

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				int pixelVal = 0;

				for (int u = 0; u < 3; u++) {
					for (int v = 0; v < 3; v++) {
						pixelVal += filter[u][v] * src.at<uchar>(i + u - 1, j + v - 1);
					}
				}
				rezultat.at<uchar>(i, j) = pixelVal / scalar + 255 / 2;

			}
		}


		imshow("rezultatFiltrat", rezultat);
		waitKey(0);
	}
}

void centering_transform(Mat img) {
	for (int i = 0; i < img.rows; i++) {
		for (int j = 0; j < img.cols; j++) {
			img.at<float>(i, j) = ((i + j) & 1) ? -img.at<float>(i, j) : img.at<float>(i, j);
		}
	}
}

Mat sablon(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void Fourier() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon(src);
		waitKey(0);

	}
}

Mat sablon2(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	mag += Scalar::all(1);
	log(mag, mag);

	normalize(mag, mag, 0, 1, NORM_MINMAX);

	imshow("Magnitudine", mag);
	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void Magnitudine() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon2(src);
		waitKey(0);

	}
}

Mat sablon3(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	mag += Scalar::all(1);
	log(mag, mag);

	normalize(mag, mag, 0, 1, NORM_MINMAX);

	for (int i = 0; i < fourier.rows; i++) {
		for (int j = 0; j < fourier.cols; j++) {
			float val = 0;
			val = pow(fourier.rows / 2 - i, 2) + pow(fourier.cols / 2 - j, 2);
			if (val > pow(20, 2)) {
				channels[0].at<float>(i, j) = 0;
				channels[1].at<float>(i, j) = 0;
			}
		}
	}

	
	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void idealLowPass() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon3(src);
		waitKey(0);

	}
}

Mat sablon4(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	mag += Scalar::all(1);
	log(mag, mag);

	normalize(mag, mag, 0, 1, NORM_MINMAX);

	for (int i = 0; i < fourier.rows; i++) {
		for (int j = 0; j < fourier.cols; j++) {
			float val = 0;
			val = pow(fourier.rows / 2 - i, 2) + pow(fourier.cols / 2 - j, 2);
			if (val < pow(20, 2)) {
				channels[0].at<float>(i, j) = 0;
				channels[1].at<float>(i, j) = 0;
			}
		}
	}


	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void idealHighPass() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon4(src);
		waitKey(0);

	}
}

Mat sablon5(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	mag += Scalar::all(1);
	log(mag, mag);

	normalize(mag, mag, 0, 1, NORM_MINMAX);

	for (int i = 0; i < fourier.rows; i++) {
		for (int j = 0; j < fourier.cols; j++) {
			float val = 0;
			val = (pow(fourier.rows / 2 - i, 2) + pow(fourier.cols / 2 - j, 2)) / pow(20, 2);
			val = -val;
			channels[0].at<float>(i, j) *= exp(val);
			channels[1].at<float>(i, j) *= exp(val);
		}
	}


	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void GaussianLowPass() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon5(src);
		waitKey(0);

	}
}

Mat sablon6(Mat src) {
	Mat srcf(src.rows, src.cols, CV_32FC1); //stocam imaginea sursa ca float
	src.convertTo(srcf, CV_32FC1);

	centering_transform(srcf); //centram imaginea, pentru a o putea procesa in domeniul frecvential

	Mat fourier; //cream o matrice de numere complexe in care sa stocam transformata fourier directa
	dft(srcf, fourier, DFT_COMPLEX_OUTPUT); //aplicam transformata fourier directa pe imaginea sursa si rezultatul va fi stocat in matricea "fourier" de numere complexe

	//dorim sa desfacem numerele complexe din matricea "fourier" in doua matrici, una cu partile reale si una cu partile imaginare ale numerelor 
	Mat channels[] = { Mat::zeros(src.size(),CV_32F),Mat::zeros(src.size(),CV_32F) };
	split(fourier, channels);//separam partea reala de partea imaginara
	//in matricea channels[0] avem matricea care contine partile reale ale numerelor din "fourier"
	//in matricea channels[1] avem partea imaginara a numerelor

			//calculul magnitudinii
	Mat mag;
	magnitude(channels[0], channels[1], mag);
	mag += Scalar::all(1);
	log(mag, mag);

	normalize(mag, mag, 0, 1, NORM_MINMAX);

	for (int i = 0; i < fourier.rows; i++) {
		for (int j = 0; j < fourier.cols; j++) {
			float val = 0;
			val = (pow(fourier.rows / 2 - i, 2) + pow(fourier.cols / 2 - j, 2)) / pow(20, 2);
			val = -val;
			channels[0].at<float>(i, j) *= 1- exp(val);
			channels[1].at<float>(i, j) *= 1- exp(val);
		}
	}


	//parcurgem matricea "mag" si aplicam log(mag.at<float>(i, j) + 1) pe fiecare element
	//aplicam functia normalize pe matricea mag si o afisam

//aici aplicam filtre (R=20 sau A=20)
//parcurgem imaginea (0->H, 0->W) si aplicam modificarile pe channels[0] si channels[1]
//pentru gauss putem folosi functia exp(exponent)

	Mat dst, dstf;
	merge(channels, 2, fourier); //reunim cele doua canale (real si imaginar), pentru a pregati matricea de revenirea in domeniul spatial
	dft(fourier, dstf, DFT_INVERSE | DFT_REAL_OUTPUT | DFT_SCALE); //aplicam transformata fourier inversa pentru a reveni in domeniul spatial
	//in matricea dstf avem rezultatul transformatei fourier inverse

	centering_transform(dstf); //recentram imaginea, pentru a o vizualiza usor in domeniul spatial
	normalize(dstf, dst, 0, 255, NORM_MINMAX, CV_8UC1); //normalizam matricea, ca sa nu avem valori in afara intervalului 0-255; punem rezultatul in dst

	imshow("initial", src);
	imshow("final", dst);
	waitKey();

	return dst;
}

void GaussianHighPass() {
	Mat src;
	Mat result;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		result = sablon6(src);
		waitKey(0);

	}
}

void filtruMedian() {
	Mat src;
	Mat final;

	char fname[MAX_PATH];

	while (openFileDlg(fname)) {

		src = imread(fname, 0);
		imshow("imagina", src);

		int w;

		final = src.clone();

		printf("baga un lungime, boss:");
		scanf("%d", &w);
		double t = (double)getTickCount();

		for (int i = 0; i < src.rows - w; i++) {
			for (int j = 0; j < src.cols - w; j++) {
				std::vector<int> valori;
				for (int x = 0; x < w; x++) {
					for (int y = 0; y < w; y++) {
						valori.push_back(src.at<uchar>(i + x, j + y));
					}
				}
				sort(valori.begin(), valori.end());
				final.at<uchar>(i + w / 2, j + w / 2) = valori.at(pow(w,2) / 2);
			}
		}
		t = ((double) getTickCount() - t) / getTickFrequency();
		printf("Time = %.3f [ms] \n", t * 1000);
		imshow("finalImage", final);
		waitKey();
	}
}

void filtruGaussian2() {
	Mat src;
	Mat final;

	char fname[MAX_PATH];

	while (openFileDlg(fname)) {
		src = imread(fname, 0);
		imshow("originalImage", src);

		final = src.clone();

		int w = 0;
		printf("alt valore boss:");
		scanf("%d", &w);
		double t = (double)getTickCount();

		float nucleuConvolutie[200][200];
		float row = (float)w / 6;
		int mid = w / 2;

		for (int i = 0; i < w; i++) {
			for (int j = 0; j < w; j++) {

				nucleuConvolutie[i][j] = (1.0 / (2 * 3.14 * pow(row, 2))) * exp(-(float)(pow((i - mid), 2) + pow((j - mid), 2)) / (2.0 * pow(row, 2)));

			}
		}

		/*for (int i = 0; i < w; i++) {
			for (int j = 0; j < w; j++) {
				std::cout << nucleuConvolutie[i][j] << " ";
			}
			std::cout << std::endl;
		}*/

		for (int i = w / 2; i < src.rows - w / 2; i++) {
			for (int j = w / 2; j < src.cols - w / 2; j++) {

				float valoare = 0;

				for (int u = 0; u < w; u++) {
					for (int v = 0; v < w; v++) {
						valoare = valoare + nucleuConvolutie[u][v] * src.at<uchar>(i + u - w / 2, j + v - w / 2);
					}
				}
				final.at<uchar>(i, j) = (char)(valoare);

			}
		}
		t = ((double)getTickCount() - t) / getTickFrequency();
		printf("Time = %.3f [ms] \n", t * 1000);
		imshow("finalImg", final);
		waitKey();

	}

}


void gradient() {
	Mat src;

	char fname[MAX_PATH];

	while (openFileDlg(fname)) {
		src = imread(fname, 0);
		imshow("originalImage", src);

		GaussianBlur(src, src, Size(3, 3), 0.5, 0.5);

		Mat fx = Mat(src.rows, src.cols, CV_32SC1, Scalar(0));
		Mat fy = Mat(src.rows, src.cols, CV_32SC1, Scalar(0));
		Mat module = Mat(src.rows, src.cols, CV_8UC1, Scalar(0));
		Mat direction = Mat(src.rows, src.cols, CV_32F, Scalar(0.0));

		int filterx[3][3] = { -1, 0, 1,-2, 0, 2,-1, 0, 1 };
		int filtery[3][3] = { 1, 2, 1, 0, 0, 0, -1,-2, -1 };

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				int pixelValx = 0;
				int pixelValy = 0;

				for (int u = 0; u < 3; u++) {
					for (int v = 0; v < 3; v++) {
						pixelValx += filterx[u][v] * src.at<uchar>(i + u - 1, j + v - 1);
						pixelValy += filtery[u][v] * src.at<uchar>(i + u - 1, j + v - 1);

					}
				}
				fx.at<int>(i, j) = pixelValx;
				fy.at<int>(i, j) = pixelValy;

			}
		}

		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				module.at<uchar>(i, j) = sqrt(pow(fx.at<int>(i, j), 2) + pow(fy.at<int>(i, j), 2)) / (4.0 * sqrt(2));
				direction.at<float>(i, j) = (atan2(fy.at<int>(i, j), fx.at<int>(i, j)) + CV_PI);
			}
		}
		/*for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {
				printf("%d ", (int)direction.at<uchar>(i, j));
			}
		}*/

		Mat module_cln = module.clone();

		float ls11 = CV_PI / 8;
		float ld11 = 3 * CV_PI / 8;

		float ls12 = 9 * CV_PI / 8;
		float ld12 = 11 * CV_PI / 8;


		float ls01 = 3 * CV_PI / 8;
		float ld01 = 5 * CV_PI / 8;

		float ls02 = 11 * CV_PI / 8;
		float ld02 = 13 * CV_PI / 8;


		float ls31 = 5 * CV_PI / 8;
		float ld31 = 7 * CV_PI / 8;

		float ls32 = 13 * CV_PI / 8;
		float ld32 = 15 * CV_PI / 8;


		float ls21 = 7 * CV_PI / 8;
		float ld21 = 9 * CV_PI / 8;

		float ls22 = 15 * CV_PI / 8;
		float ld22 = 1 * CV_PI / 8;



		for (int i = 1; i < src.rows - 1; i++) {
			for (int j = 1; j < src.cols - 1; j++) {

				if (((direction.at<float>(i, j) > ls11) && (direction.at<float>(i, j) <= ld11)) ||
					((direction.at<float>(i, j) > ls12) && (direction.at<float>(i, j) <= ld12))) {

					if (module_cln.at<uchar>(i - 1, j + 1) >= module_cln.at<uchar>(i, j) ||
						module_cln.at<uchar>(i + 1, j - 1) >= module_cln.at<uchar>(i, j))
						module_cln.at<uchar>(i, j) = 0;
				}

				if (((direction.at<float>(i, j) > ls01) && (direction.at<float>(i, j) <= ld01)) ||
					((direction.at<float>(i, j) > ls02) && (direction.at<float>(i, j) <= ld02))) {

					if (module_cln.at<uchar>(i - 1, j) >= module_cln.at<uchar>(i, j) ||
						module_cln.at<uchar>(i + 1, j) >= module_cln.at<uchar>(i, j))
						module_cln.at<uchar>(i, j) = 0;
				}

				if (((direction.at<float>(i, j) > ls31) && (direction.at<float>(i, j) <= ld31)) ||
					((direction.at<float>(i, j) > ls32) && (direction.at<float>(i, j) <= ld32))) {

					if (module_cln.at<uchar>(i - 1, j - 1) >= module_cln.at<uchar>(i, j) ||
						module_cln.at<uchar>(i + 1, j + 1) >= module_cln.at<uchar>(i, j))
						module_cln.at<uchar>(i, j) = 0;
				}

				if (((direction.at<float>(i, j) > ls21) && (direction.at<float>(i, j) <= ld21)) ||
					((direction.at<float>(i, j) > ls22) && (direction.at<float>(i, j) <= ld22))) {

					if (module_cln.at<uchar>(i, j - 1) >= module_cln.at<uchar>(i, j) ||
						module_cln.at<uchar>(i, j + 1) >= module_cln.at<uchar>(i, j))
						module_cln.at<uchar>(i, j) = 0;
				}

			}
		}

		imshow("module", module);

		imshow("module_clone", module_cln);

		int zeroGradientModulePixels = 0;
		float p = 0.1;

		for (int i = 1; i < module.rows - 1; i++) {
			for (int j = 1; j < module.cols - 1; j++) {
				if (module_cln.at<uchar>(i, j) == 0) {
					zeroGradientModulePixels++;
				}
			}
		}

		int numberEdgePixels = p * ((module.rows - 2) * (module.cols - 2) - zeroGradientModulePixels);
		int numberNonEdgePixels = (1 - p) * ((module.rows - 2) * (module.cols - 2) - zeroGradientModulePixels);

		int histogram[256] = {};

		for (int i = 1; i < module.rows - 1; i++) {
			for (int j = 1; j < module.cols - 1; j++) {
				histogram[module_cln.at<uchar>(i, j)]++;
			}
		}
		int s = 0;
		int index;
		for (index = 1; index < 256; index++) {

			s += histogram[index];
			if (s > numberNonEdgePixels)
				break;
		}
		int thHigh = index;

		int thLow = 0.4 * thHigh;

		for (int i = 0; i < module.rows; i++) {
			for (int j = 0; j < module.cols; j++) {
				int value = module_cln.at<uchar>(i, j);

				if (value < thLow)
					module_cln.at<uchar>(i, j) = 0;
				else if (value > thHigh)
					module_cln.at<uchar>(i, j) = 255;
				else
					module_cln.at<uchar>(i, j) = 128;
			}
		}

		imshow("module_thresholded", module_cln);

		Mat	labels(src.rows, src.cols, CV_8UC1);
		labels = Mat::zeros(src.rows, src.cols, CV_8UC1);

		int di[8] = { -1,0,1,0,-1,1,-1,1 };
		int dj[8] = { 0,-1,0,1,-1,1,1,-1 };

		for (int i = 0; i < src.rows; i++) {
			for (int j = 0; j < src.cols; j++) {
				if ((module_cln.at<uchar>(i, j) == 255) && (labels.at<uchar>(i, j) == 0)) {
					std::queue<Point> Q;
					labels.at<uchar>(i, j) = 1;
					Q.push({ i,j });
					while (!Q.empty()) {
						Point q = Q.front();
						Q.pop();

						for (int k = 0; k < 8; k++)
							if ((module_cln.at<uchar>(q.x + di[k], q.y + dj[k]) == 128)
								&& (labels.at<uchar>(q.x + di[k], q.y + dj[k]) == 0)) {
								module_cln.at<uchar>(q.x + di[k], q.y + dj[k]) = 255;
								labels.at<uchar>(q.x + di[k], q.y + dj[k]) = 1;
								Q.push({ q.x + di[k], q.y + dj[k] });
							}
					}
				}
			}
		}

		for (int i = 0; i < src.rows; i++) {
			for (int j = 0; j < src.cols; j++) {
				if (module_cln.at<uchar>(i, j) == 128)
					module_cln.at<uchar>(i, j) = 0;
			}
		}

		imshow("edges", module_cln);
		waitKey(0);
	}
}

//---------------------------------------proiect------------------------------------------------------------------------------------//


Mat closingMorphological(Mat image)
{
	int morph_size = 2;
	Mat element = getStructuringElement(
		MORPH_RECT,
		Size(2 * morph_size + 1,
			2 * morph_size + 1),
		Point(morph_size, morph_size));
	Mat output;
	morphologyEx(image, output,
		MORPH_CLOSE, element,
		Point(-1, -1), 2);
	return output;
}

Mat testCanny(Mat img)
{
	Mat img2, dst, gauss, dst2;
	uchar val;
	Rect x;
	int di[8] = { -1,-1,-1, 0, 0, 1,1,1 };
	int dj[8] = { -1, 0, 1, -1, 1, -1, 0, 1 };
	double k = 0.4;
	int pH = 150;
	int pL = (int)k * pH;
	GaussianBlur(img, gauss, Size(5, 5), 0.8, 0.8);
	Canny(gauss, dst, pL, pH, 3, true);
	imshow("Canny", dst);

	dst = ~dst;
	imshow("Canny negative", dst);

	dst2 = dst.clone();
	for (int k = 0; k < 4; k++) {
		for (int i = 1; i< dst.rows - 1; i++) {
			for (int j = 1; j < dst.cols - 1; j++) {
				val = dst.at<uchar>(i, j);
				if (val == 0) {
					for (int k = 0; k < 8; k++) {
						dst2.at<uchar>(i + di[k], j + dj[k]) = 0;
					}
				}
			}
		}
		dst = dst2.clone();
	}
	imshow("Canny dilatat", dst2);

	for (int k = 0; k < 2; k++) {
		for (int i = 1; i < dst.rows - 1; i++) {
			for (int j = 1; j < dst.cols - 1; j++) {
				val = dst.at<uchar>(i, j);
				if (val == 255) {
					for (int k = 0; k < 8; k++) {
						dst2.at<uchar>(i + di[k], j + dj[k]) = 255;
					}
				}
			}
		}
		dst = dst2.clone();
	}

	std::vector<std::vector<Point> > contours;
	std::vector<Vec4i> hierarchy;
	findContours(dst2, contours, hierarchy, RETR_TREE, CHAIN_APPROX_SIMPLE);

	Mat placuta(dst2.size(), CV_8UC3, Scalar(0));

	for (size_t i = 0; i < contours.size(); i++)
	{
		std::vector<Point> contoursOUT;

		approxPolyDP(Mat(contours[i]), contoursOUT, 3, true);

		if ((contoursOUT.size() >= 4) && (contoursOUT.size() <= 5) && (contourArea(contours[i]) > 1000)) {  //1000 pixeli minim sa aiba dreptunghiu { 
			drawContours(placuta, contours, (int)i, Scalar(69, 69, 69), -1, LINE_8, hierarchy, 0);
		}
	}

	imshow("contour", placuta);
	return placuta;
}

void selectRectangular(Mat original, Mat placuta) {
	Mat rezultat(original.size(), CV_8UC3);

	for (int i = 1; i < placuta.rows - 1; i++) {
		for (int j = 1; j < placuta.cols - 1; j++) {
			if (placuta.at<Vec3b>(i, j) != Vec3b(0, 0, 0)) {
				rezultat.at<Vec3b>(i, j) = original.at<Vec3b>(i, j);
			}
		}
	}

	imshow("placuta_extrasa", rezultat);

}

void threshold1() {
	Mat original;
	char fname[MAX_PATH];

	while (openFileDlg(fname)) {
		original = imread(fname, 1);
		Mat img;
		imshow("poza originala", original);
		cvtColor(original, img, COLOR_BGR2GRAY);
		img = closingMorphological(img);
		Mat img2(img.rows, img.cols, CV_8UC1);
		//threshold(img, img2, 0, 255, THRESH_BINARY | THRESH_OTSU);
		//imshow("threshold", img2);
		Mat placuta = testCanny(img);
		selectRectangular(original, placuta);
		waitKey(0);
	}
}







int main()
{
	int op;
	do
	{
		system("cls");
		destroyAllWindows();
		printf("Menu:\n");
		printf(" 1 - Open image\n");
		printf(" 2 - Open BMP images from folder\n");
		printf(" 3 - Image negative - diblook style\n");
		printf(" 4 - BGR->HSV\n");
		printf(" 5 - Resize image\n");
		printf(" 6 - Canny edge detection\n");
		printf(" 7 - Edges in a video sequence\n");
		printf(" 8 - Snap frame from live video\n");
		printf(" 9 - Mouse callback demo\n");
		printf(" 10 - Factor aditiv greyscale\n");
		printf(" 11 - Factor multiplicativ greyscale\n");
		printf(" 12 - 4 cadrane colorate\n");
		printf(" 13 - inversa matrice\n");
		printf(" 14 - RGB to R,G & B\n");
		printf(" 15 - RGB to Grayscale\n");
		printf(" 16 - Grayscale to B&W\n");
		printf(" 17 - RGB to HSV\n");
		printf(" 18 - Histogram\n");
		printf(" 19 - FDP\n");
		printf(" 20 - Histogram Giosi (update culoare Sergiu)\n");
		printf(" 21 - Histograma redusa\n");
		printf(" 22 - Praguri multiple\n");
		printf(" 23 - Floyd-Steinberg\n");
		printf(" 24 - Arie obiecte\n");
		printf(" 25 - Etichetare\n");
		printf(" 26 - Contur obiect\n");
		printf(" 27 - Cod inlantuit si derivata\n");
		printf(" 28 - Reconstructie din fisier\n");
		printf(" 29 - Dilatare\n");
		printf(" 30 - Eroziune\n");
		printf(" 31 - Deschidere\n");
		printf(" 32 - Inchidere\n");
		printf(" 33 - Dilatare_n\n");
		printf(" 34 - Eroziune_n\n");
		printf(" 35 - Deschidere_n\n");
		printf(" 36 - Inchidere_n\n");
		printf(" 37 - Histograma\n");
		printf(" 38 - Binarizare\n");
		printf(" 39 - Histograma egalizata\n");
		printf(" 40 - Filtru aritmetic\n");
		printf(" 41 - Filtru Gaussian\n");
		printf(" 42 - Filtru Laplace\n");
		printf(" 43 - Filtru Highpass\n");
		printf(" 44 - Transformata Fourier\n");
		printf(" 45 - Magnitudine Fourier\n");
		printf(" 46 - Ideal LowPass\n");
		printf(" 47 - Ideal HighPass\n");
		printf(" 48 - Gaussian LowPass\n");
		printf(" 49 - Gaussian HighPass\n");
		printf(" 50 - Filtru median\n");
		printf(" 51 - Filtru Gaussian\n");
		printf(" 52 - Placuta inmatriculare\n");




		printf(" 0 - Exit\n\n");
		printf("Option: ");
		
		
		/*char fname[MAX_PATH];
		openFileDlg(fname);
		Mat img = imread(fname);
		std::cout << isInside(img, 124, 270) << std::endl;  //0 false, 1 true
		waitKey(9000);*/
		
		scanf("%d",&op);
		
		switch (op)
		{
			case 1:
				testOpenImage();
				break;
			case 2:
				testOpenImagesFld();
				break;
			case 3:
				testParcurgereSimplaDiblookStyle(); //diblook style
				break;
			case 4:
				//testColor2Gray();
				testBGR2HSV();
				break;
			case 5:
				testResize();
				break;
			case 6:
				testCanny();
				break;
			case 7:
				testVideoSequence();
				break;
			case 8:
				testSnap();
				break;
			case 9:
				testMouseClick();
				break;
			case 10:
				test_factorAditiv();
				break;
			case 11:
				test_factorMultiplicativ();
				break;
			case 12:
				test_imagine4();
				break;
			case 13: 
				test_matrice();
				break;
			case 14:
				rgbToColors();
				break;
			case 15:
				convertToGrayscale();
				break;
			case 16:
				convertToBW();
				break;
			case 17:
				convertToHSV();
				break;
			case 18:
				histogram();
				break;
			case 19:
				FDP();
				break;
			case 20:
				printHistogram();
				break;
			case 21:
				histogramLower();
				break;
			case 22:
				praguri();
				break;
			case 23:
				FloydSteinberg();
				break;
			case 24:
				MouseClick();
				break;
			case 25:
				etichetare();
				break;
			case 26:
				contur();
				break;
			case 27:
				print_dir();
				break;
			case 28:
				reconstructie();
				break;
			case 29:
				dilatare();
				break;
			case 30:
				eroziune();
				break;
			case 31:
				deschidere();
				break;
			case 32:
				inchidere();
				break;
			case 33:
				dilatare_n();
				break;
			case 34:
				eroziune_n();
				break;
			case 35:
				deschidere_n();
				break;
			case 36:
				inchidere_n();
				break;
			case 37:
				infoHistograma();
				break;
			case 38:	
				Binarizare();
				break;
			case 39:
				EgalizareHistograma();
				break;
			case 40:
				filtruAritmetic();
				break;
			case 41:
				filtruGaussian();
				break;
			case 42:
				filtruLaplace();
				break;
			case 43:
				filtruHighpass();
				break;
			case 44:
				Fourier();
				break;
			case 45:
				Magnitudine();
				break;
			case 46:
				idealLowPass();
				break;
			case 47:
				idealHighPass();
				break;
			case 48:
				GaussianLowPass();
				break;
			case 49:
				GaussianHighPass();
				break;
			case 50:
				filtruMedian();
				break;
			case 51:
				filtruGaussian2();
				break;
			case 52:
				threshold1();
				break;
			

		}
	}
	while (op!=0);
	return 0;
}