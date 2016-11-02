//
//  main.m
//  NSStringAndMutableString
//
//  Created by AsquareMobileTechnologies on 5/2/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        
//        NSString *str = @"Hello World Hello Hello Anil Asquare";
//        
//        NSLog(@"%hhd",[str hasSuffix:@"Horld"]);
//        
//        
//        NSString *str123 = [str stringByReplacingOccurrencesOfString:@"Hello" withString:@"Test"];
//        NSMutableString *str12 = [[NSMutableString alloc]initWithString:@"Hello"];
//        
//        [str12 appendString:@"Test"];
//        [str12 appendString:@"Asquare"];
//        
//        [str12 deleteCharactersInRange:NSMakeRange(1, 5)];
//        [str12 insertString:@" Anil " atIndex:1];
//        
//        int n =10;
//        float f =34.6;
//        [str12 appendFormat:@"%d %f",n,round(f)];
//        NSLog(@"Test::%@",str12);
//
        
//        NSString *fname = @"Anil";
//        NSString *lname = @"Kumar";
//        
//        int n =23;
//        float m =34.86;
//        
//        NSString *final =[NSString stringWithFormat:@"%@ %@ having %d with Avg %0.1f",fname,lname,n,m];
//        
//        NSLog(@"Final Str ::%@",final);
//        
//        NSString *str12 = @"23.90";
//        
//        NSString *str23 = @"t66767";
//        float n1 =[str12 floatValue];
//        int n2 =[str23 intValue];
//        
//        
//        NSLog(@"Sum is::%f",n1+n2);
        
        NSMutableString *str =[[NSMutableString alloc]init];
     //   [str appendString:@"HELLO"];
      //  str = nil;
        if (str) {
           [str appendString:@"Asquare"];
        }else{
        str =[[NSMutableString alloc]init];
        [str appendString:@"Hello"];
        }
        
        
        
        NSLog(@"Test::%@",str);
        
        
        
    }
    return 0;
}
