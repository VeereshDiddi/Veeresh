//
//  main.m
//  Objects-Challenge
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSHost *currentHost = [NSHost currentHost];
        NSString *name = [currentHost localizedName];
        NSLog(@"The current host is named %@.", name);
    }
    return 0;
}

