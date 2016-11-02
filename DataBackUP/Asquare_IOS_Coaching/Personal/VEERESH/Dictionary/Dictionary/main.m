//
//  main.m
//  Dictionary
//
//  Created by Asquare on 09/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"veeresh1",@"fname", @"Diddi1", @"lname", @"veer@gmail1", @"id", @"96032490881", @"mobile", nil];
        NSMutableDictionary *dict2 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"veeresh2",@"fname", @"Diddi2", @"lname", @"veer@gmail2", @"id", @"96032490882", @"mobile", nil];
        NSMutableDictionary *dict3 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"veeresh3",@"fname", @"Diddi3", @"lname", @"veer@gmail3", @"id", @"96032490883", @"mobile", nil];
        NSMutableDictionary *dict4 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"veeresh4",@"fname", @"Diddi4", @"lname", @"veer@gmail4", @"id", @"96032490884", @"mobile", nil];
         NSMutableDictionary *dict5 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"veeresh5",@"fname", @"Diddi5", @"lname", @"veer@gmail5", @"id", @"96032490885", @"mobile", nil];
        NSMutableDictionary *dict6 = [[NSMutableDictionary alloc] initWithDictionary:dict5];
        
        
        
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:dict1, dict2, dict3,dict5, dict6, nil];
            
        for (int i = 0; i < arr.count; i++) {
            if (i == arr.count-1) {
                NSLog(@"%d index of values: %@", i, [[arr objectAtIndex:i] valueForKey:@"mobile"]);
                
            }


//        for (int i = 0; i < arr.count; i++) {
//            NSLog(@"%d index of values: %@", i, [[arr objectAtIndex:i] valueForKey:@"mobile"]);
//        }
//        
//         [arr replaceObjectAtIndex:1 withObject:dict4];
//        
//        for (int i = 0; i < arr.count; i++) {
//            if (i == 1) {
//                NSLog(@"%d index of values: %@", i, [[arr objectAtIndex:i] valueForKey:@"mobile"]);
//
//            }
//        }
        
    }
    }

    return 0;
}
