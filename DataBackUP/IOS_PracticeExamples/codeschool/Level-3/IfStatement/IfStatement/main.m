//
//  main.m
//  IfStatement
//
//  Created by MacBook Pro on 21/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        //A simple if
        BOOL *mrHigieIsMean = YES;
        if (mrHigieIsMean) {
            NSLog(@"Confirmed: he is super mean");
        }
        
        //if-else
        BOOL *mrHigiesIsMean1 = NO;
        if (mrHigiesIsMean1) {
            NSLog(@"Confirmed: he is super mean");
        }
        else
        {
            NSLog(@"No, actually he's really nice");
        }
        
        
        // if-else if-else
        NSNumber *meannessScale = @7;
        if ([meannessScale intValue] < 4) {
            NSLog(@"Mr. Higgie is on the nice side");
        }else if ([meannessScale intValue] >= 4 || [meannessScale intValue] < 8)
        {
            NSLog(@"Mr. Higgie is sorta nice but not really");
        }
        else {
            NSLog(@"Mr. Higgie is definitely mean");
        }
        
        //Equal String
        NSString *hat = @"AstronautHelmet";
        if ([hat isEqualToString:@"Sombrero"]) {
            NSLog(@"Ese es un muy buen sombrero");
        }
        else if ([hat isEqualToString:@"Fedora"])
        {
            NSLog(@"Mr. Higgie was an iPhone before there  was");
        }
        else if ([hat isEqualToString:@"AstronautHelmet"])
        {
            NSLog(@"Mr.Higgie is currently AstronautHelmet");
        }
        else
        {
            NSLog(@"Mr. Higgie is currently hatless");
        }
        
        
        
 /*     Switch ip up
        NSInteger day = getDayOfWeek();
        
        switch (day) {
            case 1:
            case 2:
            case 3:
            case 4: {
                [mrHiggie setCurrentHat:@"Fedora"];
                break;
            }
            case 5: {
                [mrHiggie setCurrentHat:@"Sombrero"];
                break;
            }
            case 6:
            case 7: {
                [mrHiggie setCurrentHat:@"AstronautHelmet"];
                break;
            }
        }
        
        NSLog(@"Mr. Higgie is wearing: %@", [mrHiggie currentHat]);
        

        */
        
    /*   Switch on enums
        DayOfWeek day = getDayOfWeek();
        
        switch (day) {
            case DayOfWeekMonday:
            case DayOfWeekTuesday:
            case DayOfWeekWednesday:
            case DayOfWeekThursday: {
                [mrHiggie setCurrentHat:@"Fedora"];
                break;
            }
            case DayOfWeekFriday: {
                [mrHiggie setCurrentHat:@"Sombrero"];
                break;
            }
            case DayOfWeekSaturday:
            case DayOfWeekSunday: {
                [mrHiggie setCurrentHat:@"AstronautHelmet"];
                break;
            }
        }
        
        NSLog(@"Mr. Higgie is wearing: %@", [mrHiggie currentHat]);
        

        */
        //Fast Enumeration
        NSArray *newHats = @[@"Cowboy", @"Conductor", @"Baseball"];
        for (NSString *hat in newHats) {
            NSLog(@"Trying on new %@ hat", hat);
        }
        
        //Enumerating an NSDictionary
        
        NSDictionary *funnyWords = @{@"one":@"One value", @"two":@"Two value", @"three":@"Three value"};
        for (NSString *word in funnyWords) {
            NSString *definition = funnyWords[word];
            NSLog(@"%@ is defined as %@", word, definition);
        }
        
     /*  Practice makes perfect
        
        NSDictionary *newHats = @{
                                  @"Cowboy": @"White",
                                  @"Conductor": @"Brown",
                                  @"Baseball": @"Red"
                                  };
        
        for (NSString *hat in newHats){
            
            NSString *color = newHats[hat];
            
            NSLog(@"Trying on new %@ %@ hat", color, hat);
            
            if([mrHiggie tryOnHat:hat withColor:color]) {
                NSLog(@"Mr. Higgie loves it");
            } else {
                NSLog(@"Mr. Higgie hates it");
            }
        }
        
            */
        
        void (^ myFirstBlock)(void) = ^{
            NSLog(@"Hello Veeresh");
        };
        myFirstBlock();
        myFirstBlock();
        myFirstBlock();
        
        //Blocks with arguments
        void (^ sumNumbers)(NSUInteger, NSUInteger) = ^(NSUInteger num1, NSUInteger num2)
        {
            NSLog(@"Sum of two Numbers:%lu", num1+num2);
        };
        
        sumNumbers(2,3);
        sumNumbers(4,5);
        
        //logCount
        void (^ logCount)(NSArray *) = ^(NSArray *array)
        {
            NSLog(@"Array count is:%lu", [array count]);
        };
        logCount(@[@"a", @"b", @"c"]);
        logCount(@[@"as", @"wedf", @"ref", @"fe"]);
        
        //string
        void (^myFirstBlock1)(NSString *) = ^(NSString *string){
            NSLog(@"Hello from inside the block:%@", string);
        };
        
        myFirstBlock1(@"Hello");
        myFirstBlock1(@"World");
        
        
        NSArray *newHats1 = @[@"Cowboy", @"Conductor", @"Baseball",
                             @"Beanie", @"Beret", @"Fez"];
        
        
        
        void (^enumeratingBlocks)(NSString *, NSUInteger, BOOL *) = ^(NSString *hat, NSUInteger index, BOOL *stop)
        {
            NSLog(@"Trying on hat %@", hat);
        };
        [newHats1 enumerateObjectsUsingBlock:enumeratingBlocks];
        
        
        NSArray *aaray1 = @[@"ss", @"dw", @"efed", @"egvef", @"feve"];
        void (^arrayVeeru)(NSString *, NSUInteger, BOOL *) = ^(NSString *name, NSUInteger index, BOOL *stop)
        {
            NSLog(@"Array objects are:%@", name);
        };
        
        [aaray1 enumerateObjectsUsingBlock:arrayVeeru];
    }
   
        return 0;
}
