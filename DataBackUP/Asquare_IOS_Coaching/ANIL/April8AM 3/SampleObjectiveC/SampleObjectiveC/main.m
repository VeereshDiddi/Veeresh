//
//  main.m
//  SampleObjectiveC
//
//  Created by AsquareMobileTechnologies on 4/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ClassA.h"
#import "Student.h"
#import "Student123.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
//        [ClassA addA];
//        ClassA *obj = [[ClassA alloc]init];
//        
//        obj.value  = 10;
//        obj.value1 = 20;
//        [obj multiplicationOfTwoNumbers];
//        
//        ClassA *obj1 =[[ClassA alloc]init];
//        //obj1.value = 100;
//        obj1.value1 = 200;
//        [obj1 multiplicationOfTwoNumbers];
        
        Student *std =[[Student alloc]init];
        std.fname = @"Anil";
        std.lname = @"Kumar";
        std.maths =70;
        std.social = 80;
        [std calculateAvg];
        
        Student *std1 =[[Student alloc]init];
        std1.fname = @"Ravi";
        std1.lname = @"Kumar";
        std1.maths =80;
        std1.social = 80;
        
        [std1 calculateAvg];
        
        Student *std2 =[[Student alloc]init];
        std2.fname = @"Kiran";
        std2.lname = @"Kumar";
        std2.maths =90;
        std2.social = 80;
        [std2 calculateAvg];
        
        
        Student *std3 =[[Student alloc]init];
        std3.fname = @"test";
        std3.lname = @"Kumar";
        std3.maths =80;
        std3.social = 280;
        [std3 calculateAvg];
        
        
        Student *std4 =[[Student alloc]init];
        std4.fname = @"Hi";
        std4.lname = @"Kumar";
        std4.maths =180;
        std4.social = 80;
        [std4 calculateAvg];
        
        
        Student123 *std123 =[[Student123 alloc]init];
        std123.fname = @"Hello";
        std123.maths = 20;
        std123.social = 40;
        std123.english = 50;
        [std123 myProperties];
        [Student123 myMethod];
        
        
        
    }
    return 0;
}
