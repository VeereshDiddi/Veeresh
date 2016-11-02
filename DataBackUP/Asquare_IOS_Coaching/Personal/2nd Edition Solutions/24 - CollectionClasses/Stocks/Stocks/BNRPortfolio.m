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
    //return [_stockHoldings copy];
    NSSortDescriptor *st = [NSSortDescriptor sortDescriptorWithKey:@"stockTicker" ascending:YES];
    NSArray *holdings = [_stockHoldings sortedArrayUsingDescriptors:@[st]];
    return holdings;
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

- (NSArray *)mostValuableHoldings
{
    NSSortDescriptor *vid = [NSSortDescriptor sortDescriptorWithKey:@"valueInDollars" ascending:NO];
    NSArray *holdings = [_stockHoldings sortedArrayUsingDescriptors:@[vid]];

    // Chop down to at most 3 holdings
    NSRange firstThree = NSMakeRange(0, MIN(3, [holdings count]));

    return [holdings subarrayWithRange:firstThree];
}

@end
