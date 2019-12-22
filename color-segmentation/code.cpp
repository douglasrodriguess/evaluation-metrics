#include "opencv2\opencv.hpp"


using namespace cv;
using namespace std;


int main()
{
	Mat image = imread("PH2-34.png", CV_LOAD_IMAGE_GRAYSCALE);
	Mat GT = imread("IMD034_Dermatologist.bmp", CV_LOAD_IMAGE_GRAYSCALE);

	threshold(GT, GT, 127, 255, CV_THRESH_BINARY);
	threshold(image, image, 127, 255, CV_THRESH_BINARY);


	float TP = 0;
	float TN = 0;
	float FP = 0;
	float FN = 0;

	Mat_<Vec3b> output(image.rows, image.cols, CV_8UC3);

	for(int x = 0; x < image.rows; x++){
			for(int y = 0; y < image.cols; y++){

				//cout << "A pixel: " << int(A.at<uchar>(x, y)) << endl;
				//cout << "B pixel: " << int(B.at<uchar>(x, y)) << endl;

				if( (int(GT.at<uchar>(x, y)) == 255) && (int(image.at<uchar>(x, y)) == 255)){
					//TP++;
					output.at<Vec3b>(x,y)[0] = 150;
					output.at<Vec3b>(x,y)[1] = 140;
					output.at<Vec3b>(x,y)[2] = 200;
				} else if((int(GT.at<uchar>(x, y)) == 255) && (int(image.at<uchar>(x, y)) == 0)){
					FN++;
					output.at<Vec3b>(x,y)[0] = 0;
					output.at<Vec3b>(x,y)[1] = 0;
					output.at<Vec3b>(x,y)[2] = 255;
					//cout << "M10" << endl;
				} else if((int(GT.at<uchar>(x, y)) == 0) && (int(image.at<uchar>(x, y)) == 255)){
					FP++;
					output.at<Vec3b>(x,y)[0] = 0;
					output.at<Vec3b>(x,y)[1] = 255;
					output.at<Vec3b>(x,y)[2] = 0;
					//cout << "M01" << endl;
				} else if((int(GT.at<uchar>(x, y)) == 0) && (int(image.at<uchar>(x, y)) == 0)){
					TN++;
					output.at<Vec3b>(x,y)[0] = 255;
					output.at<Vec3b>(x,y)[1] = 255;
					output.at<Vec3b>(x,y)[2] = 255;
					//cout << "M00" << endl;
				}
			}
		}


	imshow("Output", output);
	imwrite("MGAC.jpg", output);
	waitKey(0);
}