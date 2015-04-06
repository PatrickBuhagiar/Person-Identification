GUIDE

1) To train, run the function TrainHog()

eg. TrainHOG('parameters.txt', 'data', 'weights.txt');

2) To predict one image run the function PredictHOG()
	
eg. PredictHOG('weghits.txt', 'data/test/neg_6370', 'parameters.txt');

3)Extra: to predict multiple images in a folder, run Predict

eg. Predict('weights.txt', 'data', 'parameters.txt');

IDEAL SET UP

1)positive images: \data\pos\

2)negative images: \data\neg\

3)testing images: \data\test\

PARAMETERS FILE

1	Image Resize Height
2	Image Resize Length
3	Cell Size 1
4	Cell Size 2
5	Number of Bins
6	Block Size 1
7	Block Size 2
8	Overlap 1
9	Overlap 2
10	Feature Vector Size (not used by default)
11	Learning Rate

must be comma separated values 

e.g.: 128, 64, 9, 9, 16, 5, 5, 3, 3, 10000, 0.04

result.txt format:

Negative score, Positive score
