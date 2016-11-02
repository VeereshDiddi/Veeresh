//
//  main.m
//  TimesTwo
//
//  Created by Michael L Ward on 2/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

	@autoreleasepool {
	    
	    NSDate *currentTime = [NSDate date];
		NSLog(@"currentTime's value is %p", currentTime);
		
		NSDate *startTime = currentTime;
		
		sleep(2);
		
		currentTime = [NSDate date];
		NSLog(@"currentTime's value is now %p", currentTime);
		NSLog(@"The original object lives at %p", startTime);
		
		currentTime = nil;
		NSLog(@"currentTime's value is %p", currentTime);
	    
	}
    return 0;
}

