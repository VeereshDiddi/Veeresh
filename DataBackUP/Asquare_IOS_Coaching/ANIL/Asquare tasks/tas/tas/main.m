//
//  main.m
//  tas
//
//  Created by AsquareMobileTechnologies on 5/10/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSMutableDictionary *task = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"Panduranga", @"First Name",  @"Mallipudi", @"Last Name",  @"9014269642", @"Mobile:",  @"534101", @"pincode:",  @"5678", @"I.D.No.",  @"M.C.A", @"Course:",  @"A.N.U", @"Univ",  @"Guntur", @"Place:",  @"Guntur", @"Dist:", @"Computer Science", @"Dept:",  nil];
//        NSLog(@"%@", [task allValues]);
//        
//        NSMutableString *str =[NSMutableString string];
//        
//        
//        for (int i=0; i<[task allKeys].count; i++) {
//            
//            if (i==[task allKeys].count-1) {
//                [str appendFormat:@"%@ = %@.",[[task allKeys] objectAtIndex:i],[[task allValues] objectAtIndex:i]];
//            }else{
//            [str appendFormat:@"%@ = %@,",[[task allKeys] objectAtIndex:i],[[task allValues] objectAtIndex:i]];
//            }
//        }
//        
//        NSLog(@"Value is::%@",str);
        
        NSArray *arr =[NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"Anil",@"First Name", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"Kumar",@"Last Name", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"27",@"Age", nil], nil];
        
        NSLog(@"Arr Values::%@",arr);
        
        NSMutableString *str =[NSMutableString string];
        
        
                for (int i=0; i<arr.count; i++) {
        
                    if (i==arr.count-1) {
                        [str appendFormat:@"%@ = %@.",[[[arr objectAtIndex:i] allKeys] objectAtIndex:0],[[[arr objectAtIndex:i] allValues] objectAtIndex:0]];
                    }else{
                    [str appendFormat:@"%@ = %@,",[[[arr objectAtIndex:i] allKeys] objectAtIndex:0],[[[arr objectAtIndex:i] allValues] objectAtIndex:0]];
                    }
                }
                
                NSLog(@"Value is::%@",str);
        
    
    }
    return 0;
}
