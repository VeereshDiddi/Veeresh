//
//  BNRAsset.m
//  BMITime
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import "BNRAsset.h"

@implementation BNRAsset

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: $%d>", self.label, self.resaleValue];
}

- (void)dealloc
{
    NSLog(@"deallocating %@", self);
}

@end
