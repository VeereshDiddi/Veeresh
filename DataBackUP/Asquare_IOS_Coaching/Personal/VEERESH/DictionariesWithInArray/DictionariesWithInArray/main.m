//
//  main.m
//  DictionariesWithInArray
//
//  Created by Asquare on 11/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        NSMutableDictionary *dict1 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Veer", @"fname", @"D", @"lname", @"Hyderabad", @"city", nil];
         NSMutableDictionary *dict2 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Veeresh", @"fname", @"Diddi", @"lname", @"Hyderabad", @"city", nil];
         NSMutableDictionary *dict3 = [[NSMutableDictionary alloc] initWithObjectsAndKeys:@"Veer", @"fname", @"Diddi", @"lname", @"Banglore", @"city", nil];
        NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:dict1, dict2, dict3, nil];
        NSMutableArray *arr1 = [[NSMutableArray alloc] init];
        NSMutableArray *arr2 = [[NSMutableArray alloc] init];
        
        for (int i=0; i<arr.count; i++) {
            if ([[[arr objectAtIndex:i] valueForKey:@"city"] isEqualToString:@"Hyderabad"]) {
//                NSLog(@"%@  %@", [[arr objectAtIndex:i] valueForKey:@"fname"], [[arr objectAtIndex:i] valueForKey:@"lname"]);
                
                [arr1 addObject:[NSString stringWithFormat:@"%@  %@",[[arr objectAtIndex:i] valueForKey:@"fname"],[[arr objectAtIndex:i] valueForKey:@"lname"]]];
//                [arr2 insertObject:[[arr objectAtIndex:i] valueForKey:@"fname"] atIndex:i];
                
                
                arr2 = arr;
            }
        }
        
        
//        NSLog(@"Output is::%@",arr1);
        
        for (int i=0; i<arr2.count; i++) {
            NSLog(@"%d index value:%@", i, [arr2 objectAtIndex:i]);
        }
    }
    return 0;
}
