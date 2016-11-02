//
//  BNRStockHolding.h
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

// Instance variables
{
    float _purchasedSharePrice;
    float _currentSharePrice;
    int _numberOfShares;
}

// Property methods
- (float)purchasedSharePrice;
- (void)setPurchasedSharePrice:(float)price;
- (float)currentSharePrice;
- (void)setCurrentSharePrice:(float)price;
- (int)numberOfShares;
- (void)setNumberOfShares:(int)number;

// Extra methods
- (float)costInDollars;
- (float)valueInDollars;

@end
