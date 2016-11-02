//
//  main.c
//  33 - Bitwise Operations
//
//  Created by Mark Fenoglio on 10/19/11.
//  Copyright (c) 2011 Big Nerd Ranch. All rights reserved.
//

#include <stdio.h>

int main (int argc, const char * argv[])
{
	// Bitwise OR operation (bit in a or b or both is 1)
	
	unsigned char a = 0x3c;
	unsigned char b = 0xa9;
	unsigned char c = a | b;
	
	printf("Hex: %x | %x = %x\n", a, b, c);
	printf("Decimal: %d | %d = %d\n", a, b, c);
	
	// Bitwise AND operation (bit in a and b are 1)
	
	unsigned char d = a & b;
	
	printf("Hex: %x & %x = %x\n", a, b, d);
	printf("Decimal: %d & %d = %d\n", a, b, d);
	
	// Bitwise XOR operation (bit in a or b but not both)
	
	unsigned char e = a ^ b;
	
	printf("Hex: %x ^ %x = %x\n", a, b, e);
	printf("Decimal: %d ^ %d = %d\n", a, b, e);
	
	// Complement operation (0 becomes 1 and vice-versa)
	
	unsigned char f = ~b;
	
	printf("Hex: The complement of %x is %x\n", b, f);
	printf("Decimal: The complement of %d is %d\n", b, f); // Notice that b + f = 255 (ff)
	
	// Left-shift
	
	unsigned char g = a << 2;
	printf("Hex: %x shifted left two places is %x\n", a, g);
    printf("Decimal: %d shifted left two places is %d\n", a, g);
	
	// Right-shift
	
	unsigned char h = a >> 1;
	printf("Hex: %x shifted right one place is %x\n", a, h);
    printf("Decimal: %d shifted right one place is %d\n", a, h);	
	
	// CHALLENGE
	
	unsigned long long challenge = 0;		// uint64_t not available in standard C (it's a typedef from Apple)
	for (int i = 0; i <= 63; i = i + 2) {
		challenge |= (unsigned long long) 1 << i;
	}
	
	printf("Hex: %llx\n", challenge);
	printf("Decimal: %llu\n", challenge);
	
	fflush(NULL);	// Ensures that output does not get truncated in the console (otherwise, program can exit before all output displayed)
	
    return 0;
}

