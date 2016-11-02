//
//  BNRAppliance.m
//  Appliances
//
//  Created by Michael L Ward on 2/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRAppliance.h"

@implementation BNRAppliance

- (instancetype)initWithProductName:(NSString *)pn
{
    if (self = [super init]) {
		_productName = [pn copy];
		_voltage = 120;
	}
	
    // Return a pointer to the new object
    return self;
}

- (instancetype)init
{
    return [self initWithProductName:@"Unknown"];
}

- (void)setVoltage:(int)x
{
    NSLog(@"setting voltage to %d", x);
    _voltage = x;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: %d volts>", _productName, self.voltage];
}

@end
