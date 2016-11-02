//
//  main.m
//  Callbacks
//
//  Created by John Gallagher on 1/5/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"
#import "BNRObserver.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {

        BNRLogger *logger = [[BNRLogger alloc] init];

        [[NSNotificationCenter defaultCenter] addObserver:logger
                                                 selector:@selector(zoneChange:)
                                                     name:NSSystemTimeZoneDidChangeNotification
                                                   object:nil];

        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];

        NSURLRequest *request = [NSURLRequest requestWithURL:url];

        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
                                                                              delegate:logger
                                                                      startImmediately:YES];

        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
                                                                   target:logger
                                                                 selector:@selector(updateLastTime:)
                                                                 userInfo:nil
                                                                  repeats:YES];
		
		__unused BNRObserver *observer = [[BNRObserver alloc] init];
		
		// I want to know the new value and the old value whenever lastTime is changed
		[logger addObserver:observer
				 forKeyPath:@"lastTimeString"
					options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
					context:nil];
		
        [[NSRunLoop currentRunLoop] run];
        
    }
    return 0;
}

