//
//  main.m
//  Stocks
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRStockHolding.h"

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
        [stock2 setPurchasedSharePrice:12.19];
        [stock2 setCurrentSharePrice:10.56];
        [stock2 setNumberOfShares:90];
        [stocks addObject:stock2];

        BNRStockHolding *stock3 = [[BNRStockHolding alloc] init];
        [stock3 setPurchasedSharePrice:45.10];
        [stock3 setCurrentSharePrice:49.51];
        [stock3 setNumberOfShares:210];
        [stocks addObject:stock3];

        for (BNRStockHolding *stock in stocks) {
            NSLog(@"Value of stock: $%.02f", [stock valueInDollars]);
        }
    }
    return 0;
}

