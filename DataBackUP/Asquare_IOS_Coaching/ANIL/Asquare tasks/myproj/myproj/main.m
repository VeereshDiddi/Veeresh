//
//  main.m
//  myproj
//
//  Created by Asquare on 11/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        //creation of dictionaries
        NSDictionary *dict=[[NSDictionary alloc] initWithObjectsAndKeys:@"Anil", @"FirstName", @"Kumar", @"LastName", @"Hyderabad", @"City", nil];
        NSDictionary *dict1=[[NSDictionary alloc] initWithObjectsAndKeys:@"Srikanth", @"FirstName", @"Pandey", @"LastName", @"Mumbai", @"City", nil];
        NSDictionary *dict2=[[NSDictionary alloc] initWithObjectsAndKeys:@"Naresh", @"FirstName", @"Smart", @"LastName", @"Hyderabad", @"City", nil];
        NSDictionary *dict3=[[NSDictionary alloc] initWithObjectsAndKeys:@"Sai", @"FirstName", @"Teja", @"LastName", @"Visakhapatnam", @"City",nil];
        //assigning the dictionaries to the array variable arr
        
        NSMutableArray * arr= [NSMutableArray arrayWithObjects:dict, dict1, dict2, dict3, nil];
        
        //printing of arr
        NSLog(@"%@", arr);
        NSMutableArray *arr1= [NSMutableArray array];

       // NSMutableString *str = [NSMutableString string];
        for (int i=0; i<arr.count; i++) {
            
            NSLog(@"Test My Objects ::%@ ",[arr objectAtIndex:i]);
            
            if ([[[arr objectAtIndex:i] valueForKey:@"City"] isEqualToString:@"Hyderabad"]) {
                
  //              NSLog(@"My Actual Objects::%@",[arr objectAtIndex:i]);
                [arr1 addObject:[NSString stringWithFormat:@"%@ %@", [[arr objectAtIndex:i] valueForKey:@"FirstName"],[[arr objectAtIndex:i] valueForKey:@"LastName"]]];
            }
            
        }
        NSLog(@"%@", arr1);
        
}
        return 0;
}
