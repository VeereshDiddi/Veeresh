//
//  BNRPortfolio.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import "BNRPortfolio.h"
#import "BNRStockHolding.h"

@interface BNRPortfolio ()
{
    NSMutableArray *_stockHoldings;
}

@property (nonatomic, copy) NSArray *stockHoldings;

@end

@implementation BNRPortfolio

- (void)setStockHoldings:(NSArray *)stockHoldings
{
    _stockHoldings = [stockHoldings mutableCopy];
}

- (NSArray *)stockHoldings
{
    return [_stockHoldings copy];
}

- (void)addStockHolding:(BNRStockHolding *)s
{
    if (!_stockHoldings) {
        _stockHoldings = [[NSMutableArray alloc] init];
    }
    [_stockHoldings addObject:s];
}

- (float)valueInDollars
{
    float value = 0;
    for (BNRStockHolding *s in _stockHoldings) {
        value += [s valueInDollars];
    }
    return value;
}

@end
