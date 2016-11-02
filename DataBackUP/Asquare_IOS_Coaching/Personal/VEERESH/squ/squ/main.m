//
//  main.m
//  squ
//
//  Created by Asquare on 11/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
       // NSLog(@"Hello, World!");
//        NSMutableDictionary * dict =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"naresh", @"fname", @"kumar", @"lname", @"hyderabad", @"city", nil];
//        
//        NSMutableDictionary * dict1 =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"suresh", @"fname", @"reddy", @"lname", @"vishakapatnam", @"city", nil];
//        NSMutableDictionary * dict2 =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"ramesh", @"fname", @"chowdary", @"lname", @"hyderabad", @"city", nil];
//        NSMutableDictionary * dict3 =[NSMutableDictionary dictionaryWithObjectsAndKeys:@"srikanth", @"fname", @"pandey", @"lname", @"hyderabad", @"city", nil];
//        NSMutableArray *arr=[NSMutableArray arrayWithObjects:dict, dict1, dict2, dict3, nil];
//        NSMutableArray *arr1=[NSMutableArray array];
//        for (int i=0; i<arr.count; i++) {
//           //NSLog(@"objects in dictionary ::%@", [arr objectAtIndex:i]);
//            if ([[[arr objectAtIndex:i] valueForKey:@"city"] isEqualToString:@"hyderabad"]) {
//                [arr1 addObject: [NSString stringWithFormat:@"%@ = %@", [[arr objectAtIndex:i] valueForKey:@"fname"], [[arr objectAtIndex:i ] valueForKey:@"lname"]]];
//            }
//        }
//        NSLog(@"output::%@", arr1);
        
//        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"sai",@"fname", @"kumar", @"lname", @"hyderabad", @"city", nil];
//        NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"srikanth", @"fname", @"kadoori", @"lname", @"Tenali", @"city", nil];
//        NSDictionary *dict2 = [NSDictionary dictionaryWithObjectsAndKeys:@"pavan", @"fname", @"kumar", @"lname", @"hyderabad", @"city", nil];
//        NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"sharan", @"fname", @"deshadi", @"lname", @"bangalore", @"city", nil];
//        NSMutableArray *arr = [NSMutableArray arrayWithObjects:dict, dict1, dict2, dict3, nil];
//        NSMutableArray *arr1= [NSMutableArray array];
//        for (int i=0; i<arr.count; i++) {
//    
//            if([[[arr objectAtIndex:i] valueForKey:@"city"] isEqualToString:@"hyderabad"])
//                
//                [arr1 addObject:[NSString stringWithFormat:@"%@---%@", [[arr objectAtIndex:i] valueForKey:@"fname"], [[arr objectAtIndex:i] valueForKey:@"lname"]]];
//        }
//        NSLog(@"output=%@", arr1);
        
        NSDictionary *dict=[NSDictionary dictionaryWithObjectsAndKeys:@"sharan", @"fname", @"kumar", @"lname", @"bangalore", @"city", nil];
        NSDictionary *dict1=[NSDictionary dictionaryWithObjectsAndKeys:@"pavan", @"fname", @"kumar", @"lname", @"hyderabad", @"city", nil];
        NSDictionary *dict2= [NSDictionary dictionaryWithObjectsAndKeys:@"vamsi", @"fname", @"kumar", @"lname", @"vijayawada", @"city", nil];
        NSDictionary *dict3 = [NSDictionary dictionaryWithObjectsAndKeys:@"siva", @"fname", @"kumar", @"lname",  @"visakhapatnam",nil];
        NSMutableArray *arr =[NSMutableArray arrayWithObjects:dict, dict1, dict2, dict3, nil];
        NSMutableArray *arr1= [NSMutableArray array];
        
        for (int i=0; i<arr.count; i++) {
            if ([[[arr objectAtIndex:i] valueForKey:@"city"] isEqualToString:@"hyderabad"]) {
                [arr1 addObject:[NSString stringWithFormat:@"%@=%@", []]
            }
        }
        
        
        }
    return 0;
             
}
