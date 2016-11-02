//
//  main.m
//  prac
//
//  Created by AsquareMobileTechnologies on 5/9/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
//        NSDictionary *dic = [NSDictionary dictionaryWithObject:@"asquare" forKey:@"name"];
//        NSDictionary *dicMultiple = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"test",@"123434546",@"as@a.in", nil] forKeys:[NSArray arrayWithObjects:@"name",@"mobile",@"email", nil]];
//        NSLog("")
//        NSLog(@"Dic :%@",dicMultiple);
        NSDictionary *multiple1= [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"panduranga",@"9014269642",@"email", nil] forKeys: [NSArray arrayWithObjects:@"Name", @"Mobile No.", @"xyz@gmail.com", nil]];
        
         NSDictionary *multiple2= [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Anil",@"9014269642",@"dfl@gmail.com", nil] forKeys: [NSArray arrayWithObjects:@"Name", @"Mobile No.", @"Email", nil]];
        NSArray *arr =[NSArray arrayWithObjects:multiple1,multiple2, nil];
        
        NSLog(@"total dict::%@", arr);
        NSLog(@"Arr Data::%@",[multiple2 valueForKey:@"Name"]);
        
            return 0;
        }
}

