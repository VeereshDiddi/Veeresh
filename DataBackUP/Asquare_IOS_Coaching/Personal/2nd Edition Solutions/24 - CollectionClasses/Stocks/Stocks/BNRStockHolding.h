//
//  BNRStockHolding.h
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRStockHolding : NSObject

// Properties
@property (nonatomic) float purchasedSharePrice;
@property (nonatomic) float currentSharePrice;
@property (nonatomic) int numberOfShares;
@property (nonatomic, copy) NSString *stockTicker;

// Extra methods
- (float)costInDollars;
- (float)valueInDollars;

@end
