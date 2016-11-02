//
//  main.m
//  NSArraySample
//
//  Created by AsquareMobileTechnologies on 5/4/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        NSString *str =@"Asquare";
//        
//        NSLog(@"Value is::%@",str);
//        
//        str=   [str stringByAppendingString:@" Mobile"];
//        NSLog(@"After changing value::%@",str);
        
//        NSMutableString *str =[[NSMutableString alloc] init];
//        
//      //   NSMutableString *str1 =[NSMutableString string];
//        [str appendString:@"asquare"];
//        [str deleteCharactersInRange:NSMakeRange(0, 2)];
//        [str insertString:@"hi hello hi hello how are you hi test mail hi" atIndex:0];
//        if (str.length>10) {
//            NSString *str1=    [str stringByReplacingOccurrencesOfString:@"hi" withString:@"Hi"];
//            // str =[NSMutableString string];
//            NSLog(@"Value of str::%@",str1);
//        }
    
        
        NSArray *arr =[[NSArray alloc]initWithObjects:@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare",@"Asquare", nil];
        
        NSLog(@"Arr Count::%lu",(unsigned long)arr.count);
        NSLog(@"%@",[arr objectAtIndex:0]);
        
        NSMutableString *str =[[NSMutableString alloc]init];
        
        for (int i=0; i<arr.count; i++) {
            [str appendFormat:@"%@,",[arr objectAtIndex:i]];
        }
        
        
        NSLog(@"Value::%@",str);
        
        
    }
    return 0;
}
