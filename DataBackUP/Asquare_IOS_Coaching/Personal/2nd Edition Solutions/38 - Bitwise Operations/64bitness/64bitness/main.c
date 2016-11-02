//
//  main.c
//  64bitness
//
//  Created by Mark Fenoglio on 10/19/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	unsigned long long challenge = 0;		// uint64_t not available in standard C (it's a typedef from Apple)
	for (int i = 0; i <= 63; i = i + 2) {
		challenge |= (unsigned long long) 1 << i;
	}
	
	printf("Hex: %llx\n", challenge);
	printf("Decimal: %llu\n", challenge);
	
	fflush(NULL);	// Ensures that output does not get truncated in the console (otherwise, program can exit before all output displayed)
	
    return 0;
}

