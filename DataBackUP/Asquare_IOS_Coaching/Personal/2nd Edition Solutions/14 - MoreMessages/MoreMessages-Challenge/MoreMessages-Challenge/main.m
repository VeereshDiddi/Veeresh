//
//  main.m
//  MoreMessages-Challenge
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Create date components for my birthday.
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear:1982];
        [comps setMonth:12];
        [comps setDay:10];
        [comps setHour:21];
        [comps setMinute:3];
        [comps setSecond:32];

        // Convert components into an NSDate via the Gregorian calendar.
        NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [gregorian dateFromComponents:comps];

        // Figure out how many seconds I've been alive.
        NSDate *now = [[NSDate alloc] init];
        double secondsSinceBirth = [now timeIntervalSinceDate:dateOfBirth];

        NSLog(@"I have been alive for %f seconds.", secondsSinceBirth);
    }
    return 0;
}

