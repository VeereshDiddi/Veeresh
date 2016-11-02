//
//  main.c
//  gradeInTheShade
//
//  Created by Mark Fenoglio on 10/20/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>

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
	if (argc != 3) {
        fprintf(stderr, "Usage: Affirmation <adjective> <number>\n");
		return 1;
	}
	
	int count = atoi(argv[2]);
	
    for (int j = 0; j < count; j++) {
        printf("You are %s!\n", argv[1]);
    }
	
    return 0;
}

