//
//  main.m
//  VowelCounter
//
//  Created by Michael L Ward on 2/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+BNRVowelCounting.h"

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    NSString *string = @"Hello, World!";
        NSLog(@"%@ has %d vowels", string, [string bnr_vowelCount]);
	    
	}
    return 0;
}

