//
//  main.m
//  NSStringClassSample
//
//  Created by AsquareMobileTechnologies on 4/30/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
//        NSString *str = @"Hello";
//        NSLog(@"Str Length::%d",str.length);
//        NSString *str1 = @"Asquare_Mobile";
//        int n =40;
//        if (n<str1.length) {
//             NSLog(@"Char ::%c",[str1 characterAtIndex:n]);
//        }else{
//            NSLog(@"Please enter valid number");
//        }
//        NSString *mySub=[str1 substringFromIndex:8];
//        NSLog(@"Sub String::%@",mySub);
//        
//        NSLog(@"Equal Or Not::%d",[mySub isEqualToString:@"Mobile"]);
//        
//        NSString *anotherString = @"MoBiLE";
//        NSString *lower1 =[mySub capitalizedString];
//        NSString *lower2 =[anotherString capitalizedString];
//        if ([lower1 isEqualToString:lower2]) {
//            NSLog(@"Strings are equal");
//        }else{
//        NSLog(@"Strings are Not equal");
//        }
        
      //  MyClass *obj =[[MyClass alloc]init];
      int c=  [MyClass myFuncWithparameterA:10 Bparam:20];
        
        NSLog(@"Value::%d",c);
        
        
    }
    return 0;
}
