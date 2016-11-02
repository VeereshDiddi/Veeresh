//
//  main.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"
#import "BNRPortfolio.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        BNRPortfolio *portfolio = [[BNRPortfolio alloc] init];

        BNRStockHolding *stock1 = [[BNRStockHolding alloc] init];
        [stock1 setPurchasedSharePrice:2.30];
        [stock1 setCurrentSharePrice:4.50];
        [stock1 setNumberOfShares:40];
        stock1.stockTicker = @"Foo";
        [portfolio addStockHolding:stock1];

        BNRStockHolding *stock2 = [[BNRStockHolding alloc] init];
        [stock2 setPurchasedSharePrice:2.30];
        [stock2 setCurrentSharePrice:4.50];
        [stock2 setNumberOfShares:40];
        stock2.stockTicker = @"Bar";
        [portfolio addStockHolding:stock2];

        BNRForeignStockHolding *stock3 = [[BNRForeignStockHolding alloc] init];
        [stock3 setPurchasedSharePrice:2.30];
        [stock3 setCurrentSharePrice:4.50];
        [stock3 setNumberOfShares:40];
        [stock3 setConversionRate:0.94];
        stock3.stockTicker = @"Fizz";
        [portfolio addStockHolding:stock3];

        BNRStockHolding *stock4 = [[BNRStockHolding alloc] init];
        stock4.purchasedSharePrice = 40.50;
        stock4.currentSharePrice = 44.25;
        stock4.numberOfShares = 30;
        stock4.stockTicker = @"Fuzz";
        [portfolio addStockHolding:stock4];

        NSLog(@"Value of portfolio: $%.02f", [portfolio valueInDollars]);
        NSLog(@"Most valuable stocks: %@", [portfolio mostValuableHoldings]);
        NSLog(@"All stocks: %@", [portfolio stockHoldings]);
    }
    return 0;
}

