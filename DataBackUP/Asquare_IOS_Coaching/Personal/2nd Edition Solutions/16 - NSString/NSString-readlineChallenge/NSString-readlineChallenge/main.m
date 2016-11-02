//
//  main.m
//  NSString-readlineChallenge
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <readline/readline.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        const char *response = readline("Where should I start counting? ");
        NSString *startString = [NSString stringWithUTF8String:response];
        NSInteger startValue = [startString integerValue];

        for (NSInteger i = startValue; i >= 0; i--) {
            NSLog(@"%ld", (long)i);
            if ((i % 5) == 0) {
                NSLog(@"Found one!");
            }
        }
    }
    return 0;
}

