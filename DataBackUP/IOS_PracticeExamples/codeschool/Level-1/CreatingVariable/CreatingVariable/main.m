//
//  main.m
//  CreatingVariable
//
//  Created by MacBook Pro on 19/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //Creating output
        NSLog(@"Call me Ishmael.");
        //Creating a variable
        NSString *firstName = @"Diddi Veeresh";
        NSLog(firstName);
        //Logging Placeholders
        NSLog(@"Hello there, %@", firstName);
        NSLog(@"%@ %@", firstName, firstName);
        //Creating another variable
        NSString *lastName = @"Thulasi";
        //Logging two variables
        NSLog(@"%@ %@", firstName, lastName);
        //Creating a Number object
        NSNumber *age = @24;
        NSLog(@"%@",age);
        //Log a number object
        NSLog(@"%@  %@", firstName, age);
        //Creating an Array variable
        NSArray *apps = @[@"AngryFowl", @"Lettertouch", @"Tweetrobot"];
        NSLog(@"%@", apps[1]);
        //Changing an array
        apps = @[@"AngryFowl", @"Lettertouch", @"Tweetrobot", @"Instacanvas"];
        NSLog(@"%@", apps[3]);
        //Creating a dictionary
        NSDictionary *appRatings = @{@"AngryFowl":@3, @"Lettertouch":@5};
        NSLog(@"Lettertouch has ratings of %@ ", appRatings[@"Lettertouch"]);
        NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:@"A",@"B", @"C", @"D", nil];
        NSLog(@"Dictionary Value is:%@", dict[@"B"]);
        
        //[tryobj  messageThisChallenge];
        
        
    }
    
    return 0;
}
