//
//  main.m
//  dictionary
//
//  Created by ASquare Mobile Technologies on 13/05/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
   
        NSDictionary *dict1=[[NSDictionary alloc]initWithObjectsAndKeys:@"swathi",@"fname",@"25",@"age",@"hyd",@"city",@"india",@"country", nil];
        NSDictionary *dict2=[[NSDictionary alloc]initWithObjectsAndKeys:@"sai",@"fname",@"24",@"age",@"guntur",@"city",@"DENMARK",@"country", nil];
        NSDictionary *dict3=[[NSDictionary alloc]initWithObjectsAndKeys:@"ramu",@"fname",@"23",@"age",@"kammam",@"city",@"AUSTRALIA",@"country", nil];
        NSDictionary *dict4=[[NSDictionary alloc]initWithObjectsAndKeys:@"anu",@"fname",@"26",@"age",@"medak",@"city",@"UK",@"country", nil];
        NSDictionary *dict5=[[NSDictionary alloc]initWithObjectsAndKeys:@"nancy",@"fname",@"25",@"age",@"calfornia",@"city",[NSArray arrayWithObjects:@"india",@"uk",@"australia", nil],@"countries", nil];
        NSArray *arr=[NSArray arrayWithObjects:dict1,dict2,dict3,dict4,dict5, nil];
        
        NSLog(@"%@",[[arr objectAtIndex:0 ] allKeys]);
        
        NSArray *cities = [NSArray arrayWithObjects:@"Hyd",@"Chennai",@"Bng", nil];
        NSDictionary *dict =[NSDictionary dictionaryWithObjectsAndKeys:cities,@"cities",[NSArray arrayWithObjects:@"AP",@"UP",@"MP", nil],@"states", nil];
        
        NSLog(@"My Dict::%@",[[dict valueForKey:@"states"] objectAtIndex:0]);
        
    }
    return 0;
}
