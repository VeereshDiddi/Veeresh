//
//  main.c
//  space count
//
//  Created by Mark Fenoglio on 10/19/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include "stdlib.h"
#include "string.h"

// Define prototype (warning generator otherwise)
int spaceCount(const char *text);

// Write function
int spaceCount(const char *text) {
	
	int numSpaces = 0;
	for (int i = 0; i < strlen(text); i++) {
		if (text[i] == 32) {
			numSpaces++;
		}
	}
	
	return numSpaces;
}

int main (int argc, const char * argv[])
{
	const char *sentence = "He was not in the cab at the time.";
	
	printf("\"%s\" has %d spaces\n", sentence, spaceCount(sentence));
	
	return 0; 
}

