//
//  main.c
//  gradeInTheShade
//
//  Created by Mark Fenoglio on 10/20/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h> // malloc(), free()

float averageFloats(float data[], int dataCount);

float averageFloats(float data[], int dataCount)
{
	float sum = 0.0;
	for (int i = 0; i < dataCount; i++) {
		sum += data[i];
	}
	return sum / dataCount;
}

int main (int argc, const char * argv[])
{
	// Create an array of floats (initial approach)
	//float *gradeBook = malloc(3 * sizeof(float));
	//gradeBook[0] = 60.2;
	//gradeBook[1] = 94.5;
	//gradeBook[2] = 81.1;
	
	// Free the array (unnecessary once you declare as an array)
	//free(gradeBook);
	//gradeBook = NULL;
	
	// Create an array of floats
	float gradeBook[3] = {60.2, 94.5, 81.1};
	
	// Calculate the average
	float average = averageFloats(gradeBook, 3);
	
	printf("Average = %.2f\n", average);
	
    return 0;
}

