//
//  BNRForeignStockHolding.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import "BNRForeignStockHolding.h"

@implementation BNRForeignStockHolding

- (float)costInDollars
{
    float normalCost = [super costInDollars];
    return normalCost * self.conversionRate;
}

- (float)valueInDollars
{
    float normalValue = [super valueInDollars];
    return normalValue * self.conversionRate;
}

@end
