//
//  main.m
//  NSArrayProblem2
//
//  Created by MacBook Pro on 25/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    
        NSArray *unsorted = [NSArray arrayWithObjects:@"John", @"Bob", @"Avril", nil];
        NSArray *names = [unsorted sortedArrayUsingFunction:formName(id, id, void*) context:nil];
        
        for (NSString *item  in names) {
            NSLog(@"%@", item);
        }
    }
    return 0;
}
NSInteger formName(id id1, id id2, void *context)
{
    //sort Function
    NSString *name1 = (NSString*)id1;
    NSString *name2 = (NSString*)id2;
    
    return ([name1 compare:name2]);
    
}