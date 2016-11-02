//
//  BNRStockHolding.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import "BNRStockHolding.h"

@implementation BNRStockHolding

- (float)purchasedSharePrice
{
    return _purchasedSharePrice;
}

- (void)setPurchasedSharePrice:(float)price
{
    _purchasedSharePrice = price;
}

- (float)currentSharePrice
{
    return _currentSharePrice;
}

- (void)setCurrentSharePrice:(float)price
{
    _currentSharePrice = price;
}

- (int)numberOfShares
{
    return _numberOfShares;
}

- (void)setNumberOfShares:(int)number
{
    _numberOfShares = number;
}

- (float)costInDollars
{
    return [self purchasedSharePrice] * [self numberOfShares];
}

- (float)valueInDollars
{
    return [self currentSharePrice] * [self numberOfShares];
}

@end
