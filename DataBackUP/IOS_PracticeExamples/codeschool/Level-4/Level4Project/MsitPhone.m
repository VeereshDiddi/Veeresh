//
//  MsitPhone.m
//  Level4Project
//
//  Created by MacBook Pro on 21/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "MsitPhone.h"

@implementation MsitPhone

- (void)speak;
{
    NSLog(@"speak method in MsitPhone.m  object is:%@", self);
    NSLog(@"speak-->phoneName is:%@", self.phoneName);
    NSLog(@"speak-->modelNumber is:%@", _modelNumber);
}

- (NSString *)speak1;
{
    NSLog(@"speak1 method return type is NSString *");
    return [NSString stringWithFormat:@"%@ %@", self.phoneName, self.modelNumber];
}

- (NSArray *)speak2;
{
    NSLog(@"speak2 method return type is NSArray *");
    return @[self.phoneName, self.modelNumber];
}

- (NSString *)speak3:(NSString *)greeting;
{
    NSLog(@"speak3 called method argument is:%@", greeting);
    NSString *message = [NSString stringWithFormat:@"%@ %@",self.phoneName, greeting];
    return message;
}

- (void)reportBatteryLife:(NSNumber *)life;
{
//    NSUInteger *batteryLife = [life integerValue];
    NSLog(@"reportBatteryLife argument is:%@", life);

}

- (void)changeLastName:(NSString *)newLastName;
{
    _lastName = newLastName;
    NSLog(@"LastName is:%@", _lastName);
    NSLog(@"FirstName in changeLastName Method is:%@", _firstName);
}

- (MsitPhone *) init;
{
    NSLog(@"Cool, a new MsitPhone is being initialized");
    _firstName = @"Thulasi";
    NSLog(@"initially set the firstName is:%@", _firstName);
    return [super init];
}

@end
