//
//  main.m
//  NSArrayOnline
//
//  Created by MacBook Pro on 17/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSArray *newHats = @[@"abc", @"def"];
        for (NSString *hat in newHats) {
            NSLog(@"%@", hat);
        }
        NSDictionary *newFruits = @{@"a":@"apple", @"b":@"banana", @"c":@"coffee"};
        for (NSString *fruit in newFruits) {
            NSString *definition = newFruits[fruit];
            NSLog(@"%@", definition);
        }
        void(^myBlock)(void) = ^{
            NSLog(@"Hello Veeresh");
        };
        myBlock();
        myBlock();
        void (^sumNumbers)(NSUInteger, NSUInteger) = ^(NSUInteger num1, NSUInteger num2){
            NSLog(@"%lu", num1 + num2);
        };
        sumNumbers(4,3);
        void (^myArray)(NSArray*)= ^(NSArray *aArray)
        {
            NSLog(@"%lu", [aArray count]);
        };
        myArray(@[@"abc", @"deee", @"efrf"]);
        NSLog(@"-------------------------------------");
        NSArray *arr = @[@"aaa", @"bbb", @"ccc", @"ddd"];
        [arr enumerateObjectsUsingBlock:^(NSString *word, NSUInteger index, BOOL *stop){
            NSLog(@"%lu index of value:%@", index+1, word);}];
        NSArray *newVeer = @[@"abc", @"def", @"ghi"];
        [newVeer enumerateObjectsUsingBlock:^(NSString *veer, NSUInteger index, BOOL *stop){ NSLog(@"%lu of value:%@", index+1, veer);}];
    }
    return 0;
}
