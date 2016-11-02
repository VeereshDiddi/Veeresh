//
//  BNRPortfolio.h
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRStockHolding;

@interface BNRPortfolio : NSObject

- (void)addStockHolding:(BNRStockHolding *)s;
- (float)valueInDollars;

// Return the three currently most valuable holdings.
- (NSArray *)mostValuableHoldings;

// Return list of all stock holdings sorted by ticker.
- (NSArray *)stockHoldings;

@end
