//
//  main.m
//  ProblemArray
//
//  Created by Asquare on 05/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSArray *arr = [NSArray arrayWithObjects:@"Asquare",@"Mobile", @"Tech", @"abc", @"def", @"ghi",@"abc", nil];
        NSMutableString *str1 =[[NSMutableString alloc] init];
        NSMutableString *str2 = [[NSMutableString alloc] init];
        int count = 0;
        
        for (int i =0; i <arr.count; i++) {
            if ([[arr objectAtIndex:i] isEqualToString:@"abc"]) {
                count++;
            }
        }
        NSLog(@"Count repeated value is:%d ", count);
       //        NSLog(@"%@,%@&%@", arr[0], arr[1], arr[2]);
/*        for (int i=0; i<arr.count; i++) {
            if (i == arr.count-1) {
                [str appendFormat:@" & %@.",[arr objectAtIndex:i]];
            }
            else if (i == arr.count-2)
            {
            [str appendFormat:@" %@",[arr objectAtIndex:i]];
            }
            else
            {
                [str appendFormat:@"%@, ", [arr objectAtIndex:i]];
            }
        }
        
        NSLog(@"%@", str);
    }  */
        
/*        for (int i=0; i<arr.count; i++) {
            if (i % 2 == 0) {
                if (i == arr.count-2) {
                    [str1 appendFormat:@" & %@.",[arr objectAtIndex:i]];
                }
                else if (i == arr.count-3)
                {
                    [str1 appendFormat:@" %@",[arr objectAtIndex:i]];
                }
                else
                {
                    [str1 appendFormat:@"%@, ", [arr objectAtIndex:i]];
                }

            }
            else
            {
                if (i == arr.count-1) {
                    [str2 appendFormat:@" & %@.",[arr objectAtIndex:i]];
                }
                else if (i == arr.count-2)
                {
                    [str2 appendFormat:@" %@",[arr objectAtIndex:i]];
                }
                else
                {
                    [str2 appendFormat:@"%@, ", [arr objectAtIndex:i]];
                }

            }
            
            NSLog(@"%@", str1);
            NSLog(@"%@", str2);
            
        }*/
    }
        
        
    return 0;
}
