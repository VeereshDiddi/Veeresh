//
//  main.m
//  SendingMessage
//
//  Created by MacBook Pro on 20/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //Sending a message
        //[tryobj  completeThisChallenge];
        
        NSArray *foods = @[@"tacos", @"burgers"];
        //Sending the description message
        NSLog(@"%@", [foods description]);
        //Storing the result of a message
        NSString *result = [foods description];
        NSLog(@"Description of foods:%@", result);
        //Trying to log an NSUInteger
        NSString *city = @"Ice World";
        NSUInteger cityLength = [city length];
        NSLog(@"City has %lu characters", (unsigned long)cityLength);
        //Operating on NSNumbers
        NSNumber *higgiesAge = @6;
        NSNumber *phoneLives = @3;
        NSUInteger higgiesAgeInt = [higgiesAge unsignedIntegerValue];
        NSUInteger phoneLivesInt = [phoneLives unsignedIntegerValue];
        NSUInteger higgiesRealAge = higgiesAgeInt * phoneLivesInt;
        NSLog(@"Higgie is actually %lu years old.", higgiesRealAge);
        //Appending 2 strings
        NSString *firstName = @"Diddi Veeresh";
        NSString *lastName = @"Thulasi";
        NSString *fullName = [firstName stringByAppendingString:lastName];
        NSLog(@"%@", fullName);
        
        NSString *firstNamePlus = [firstName stringByAppendingString:@" "];
//        NSString *fullName1 = [firstNamePlus stringByAppendingString:lastName];
        NSString *fullName1 = [[firstName stringByAppendingString:@" "]stringByAppendingString:lastName];
        NSLog(@"%@", fullName1);
        //Working with long message names
        NSString *replaced = [fullName1 stringByReplacingOccurrencesOfString:firstName withString:lastName];
        NSLog(@"%@", replaced);
        //Empty String
        NSString *emptyString = [NSString string];
        NSLog(@"Empty String is:%@, ended", emptyString);
        //Createing an NSString with a message
        NSString *copy = [NSString stringWithString:firstName];
        NSLog(@"%@ is a copy of %@", copy, firstName);
        
        //Creating an NSString with alloc/init
        NSString *string = [NSString alloc];
        //NSLog(string);
        NSString *copy1 = [[NSString alloc] initWithString:firstName];
        NSLog(@"%@ is a second copy of %@", copy1, firstName);
        //Refactoring string combination
        NSString *fullName2 = [NSString stringWithFormat:@"%@ %@", firstName, lastName];
        NSLog(@"%@", fullName2);
    }
    return 0;
}
