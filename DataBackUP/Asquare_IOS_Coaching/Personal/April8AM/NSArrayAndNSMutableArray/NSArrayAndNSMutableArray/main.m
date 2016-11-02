//
//  main.m
//  NSArrayAndNSMutableArray
//
//  Created by AsquareMobileTechnologies on 5/7/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSArray *arr =@[@"Hi",@"Hello"];
//        NSMutableArray *arr1 = [[NSMutableArray alloc]initWithObjects:@"Hello",@"test", nil];
//       // [arr1 removeAllObjects];
////        if (arr1) {
////            [arr1 addObject:@"World"];
////        }else{
////            arr1 = [NSMutableArray array];
////            [arr1 addObject:@"Hellooooooo"];
////        }
//       // arr1 =[NSMutableArray array];
//        
//        [arr1 addObject:@"Asquare"];
//        [arr1 removeLastObject];
//        if (arr1.count>0) {
//             [arr1 removeObjectAtIndex:0];
//        }
//         [arr1 addObject:@"tech"];
//        [arr1 removeObjectAtIndex:0];
//        [arr1 replaceObjectAtIndex:0 withObject:@"Hello One"];
//       // [arr1 replaceObjectAtIndex:1 withObject:@"Hello Two"];
//        [arr1 addObject:@"One"];
//        [arr1 insertObject:@"S r Nagar" atIndex:0];
//        
//        NSString *str34 = [[arr1 componentsJoinedByString:@"-"] stringByAppendingString:@"Anil"];
//        NSLog(@"Test::%@",str34);
//        NSLog(@"Arr1::%@",[str34 componentsSeparatedByString:@"-"] );
        
        NSArray *arr = [NSArray arrayWithObjects:@"Asquare",@"Mobile",@"tech", nil];
        
         NSArray *arr2 = [NSArray arrayWithObjects:@"Asquare1",@"Mobile1",@"tech1", nil];
        
        
        NSArray *arr3 = [NSArray arrayWithObjects:[NSArray arrayWithObjects:@"Hi",@"Hello", nil], nil];
        NSArray *arr1 =[NSArray arrayWithObjects:arr,arr2,arr3, nil];
        
        NSLog(@"Test::%@",[[[arr1 objectAtIndex:2] objectAtIndex:0] objectAtIndex:1]);
        
        
        
        
    }
    return 0;
}
