//
//  main.c
//  34 - C Strings
//
//  Created by Mark Fenoglio on 10/19/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>
#include "stdlib.h"
#include "string.h"

int main (int argc, const char * argv[])
{
	char x = 0x21; 	// The character '!'
	
	// Display up to the character '~'
	while (x <= 0x7e) {
		printf("%x is %c\n", x, x);
		x++;
	}
	
	// Refer to the character directly
	while (x <= '~') {
		printf("%x is %c\n", x, x);
		x++;
	}
	
	// Get a pointer to 5 bytes of memory on the heap
	char *start = malloc(5);
	
	// Build the string using pointer math
	*start = 'L';
	*(start + 1) = 'o';
	*(start + 2) = 'v';
	*(start + 3) = 'e';
	*(start + 4) = '\0';
	
	// Alternate way of defining the characters of the string
	start[0] = 'L';
	start[1] = 'o';
	start[2] = 'v';
	start[3] = 'e';
	start[4] = '\0';
	
	// Print out the string and its length
	printf("%s has %zu characters\n", start, strlen(start));
	
	// Print out the 3rd letter
	printf("The third letter is %c\n", *(start + 2));
	printf("The third letter is %c\n", start[2]);
	
	// Free the memory so that it can be reused
	free(start);
	start = NULL;
	
	// Working with a string literal (no malloc needed)
	char *love = "Love";
	printf("%s has %zu characters\n", love, strlen(love));
    printf("The third letter is %c\n", love[2]);
	
	// Claim a chunk of memory big enough to hold three floats
    float *favorites = malloc(3 * sizeof(float));
	
    // Push values into the locations in that buffer
    favorites[0] = 3.14158;
    favorites[1] = 2.71828;
    favorites[2] = 1.41421;
	
    // Print out each number on the list
    for (int i = 0; i < 3; i++) {
        printf("%.4f is favorite %d\n", favorites[i], i);
    }
	
    // Free the memory so that it can be reused
	free(favorites);
    favorites = NULL;
	
	const char *phrase = "A backslash after two newlines and a tab:\n\n\t\\";
	printf("%s has %zu characters\n", phrase, strlen(phrase));
	printf("The third letter is \'%c\'\n", phrase[2]);
	
    return 0;
}

