//
//  main.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRForeignStockHolding.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSMutableArray *stocks = [NSMutableArray array];

        BNRStockHolding *stock1 = [[BNRStockHolding alloc] init];
        [stock1 setPurchasedSharePrice:2.30];
        [stock1 setCurrentSharePrice:4.50];
        [stock1 setNumberOfShares:40];
        [stocks addObject:stock1];

        BNRStockHolding *stock2 = [[BNRStockHolding alloc] init];
        [stock2 setPurchasedSharePrice:2.30];
        [stock2 setCurrentSharePrice:4.50];
        [stock2 setNumberOfShares:40];
        [stocks addObject:stock2];

        BNRForeignStockHolding *stock3 = [[BNRForeignStockHolding alloc] init];
        [stock3 setPurchasedSharePrice:2.30];
        [stock3 setCurrentSharePrice:4.50];
        [stock3 setNumberOfShares:40];
        [stock3 setConversionRate:0.94];
        [stocks addObject:stock3];

        for (BNRStockHolding *stock in stocks) {
            NSLog(@"Value of stock: $%.02f", [stock valueInDollars]);
        }
    }
    return 0;
}

