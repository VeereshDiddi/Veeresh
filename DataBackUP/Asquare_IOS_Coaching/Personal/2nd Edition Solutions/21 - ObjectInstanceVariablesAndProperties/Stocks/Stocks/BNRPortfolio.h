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
{
    NSMutableArray *_stockHoldings;
}

@property (nonatomic, copy) NSArray *stockHoldings;

- (void)addStockHolding:(BNRStockHolding *)s;
- (float)valueInDollars;

@end