//
//  main.m
//  NSArray-groceryChallenge
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create and populate our grocery list
        NSMutableArray *groceries = [NSMutableArray array];
        [groceries addObject:@"Loaf of bread"];
        [groceries addObject:@"Container of milk"];
        [groceries addObject:@"Stick of butter"];

        // Print it out
        NSLog(@"My grocery list is:");
        for (NSString *grocery in groceries) {
            NSLog(@"%@", grocery);
        }
    }

    return 0;
}

