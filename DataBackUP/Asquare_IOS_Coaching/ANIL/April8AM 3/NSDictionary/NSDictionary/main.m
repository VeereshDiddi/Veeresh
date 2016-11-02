//
//  main.m
//  NSDictionary
//
//  Created by AsquareMobileTechnologies on 5/7/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        
//        NSDictionary *dict =[[NSDictionary alloc]initWithObjectsAndKeys:@"Anil",@"name",@"P",@"lname",@"iOS",@"Course", nil];
//        
//        NSDictionary *dict1 =[[NSDictionary alloc]initWithObjectsAndKeys:@"Ravi",@"name",@"P",@"lname",@"iOS",@"Course", nil];
//        
//        NSMutableArray *arr =[NSMutableArray arrayWithObjects:dict,dict1, nil];
//        
//        NSLog(@"Dict::%@",[[arr objectAtIndex:1] valueForKey:@"name"]);
        
        
        
        NSArray *arr =[NSArray arrayWithObjects:@"A",@"B",@"C",@"A",@"C",@"B",@"A", nil];
        
        NSLog(@"Arr::%@",arr);
        
        
        NSSet *set =[NSSet setWithArray:arr];
        
        NSLog(@"Set ::%@",set);
        
        
    }
    return 0;
}
