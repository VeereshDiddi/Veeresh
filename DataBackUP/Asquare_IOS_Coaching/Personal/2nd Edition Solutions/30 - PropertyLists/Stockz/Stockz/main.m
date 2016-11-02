//
//  main.m
//  Stockz
//
//  Created by John Gallagher on 1/5/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSMutableArray *stocks = [[NSMutableArray alloc] init];
        NSMutableDictionary *stock;

        stock = [NSMutableDictionary dictionary];
        stock[@"symbol"] = @"AAPL";
        stock[@"shares"] = @200;
        [stocks addObject:stock];

        stock = [NSMutableDictionary dictionary];
        stock[@"symbol"] = @"GOOG";
        stock[@"shares"] = @160;
        [stocks addObject:stock];

        [stocks writeToFile:@"/tmp/stocks.plist" atomically:YES];

        NSArray *stockList = [NSArray arrayWithContentsOfFile:@"/tmp/stocks.plist"];
        for (NSDictionary *d in stockList) {
            NSLog(@"I have %@ shares of %@", d[@"shares"], d[@"symbol"]);
        }
    }
    return 0;
}

