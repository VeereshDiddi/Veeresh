//
//  main.m
//  CompileTimeAndRuntime
//
//  Created by AsquareMobileTechnologies on 5/7/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSString *str = @"Test";
        NSString *str1 = @"Test";
        NSMutableString *str3 = [str mutableCopy];
        
        //ShallowCopy
        NSMutableString *str4 =str3;
        
      //  Deep Copy
      //  NSMutableString *str4 =[[NSMutableString alloc]initWithString:str3];
        [str4 appendString:@" Hello"];
        NSLog(@"Test::Str3:%@ Str4:%@",str3,str4);
        
        NSString *str123 =@"Test";
        NSString *str1234 =@"Value";
        NSMutableArray *arr =[NSMutableArray array];
        [arr addObject:str123];
        [arr addObject:str1234];
        
         NSArray *f = [NSArray arrayWithObjects:@"Asquare",@"Mobile", nil];
         NSArray *f1 = [NSArray arrayWithObjects:@"Tech",@"Mobile", nil];
        NSMutableArray *arr1 =[NSMutableArray array];
        
       
        [arr1 addObject:f];
       
        [arr1 addObject:f1];
        
        
        
    }
    return 0;
}
