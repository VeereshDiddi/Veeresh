//
//  BNRLogger.h
//  Callbacks
//
//  Created by John Gallagher on 1/5/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate>
{
    NSMutableData *incomingData;
}

@property (nonatomic) NSDate *lastTime;
- (void)zoneChange:(NSNotification *)note;
- (NSString *)lastTimeString;
- (void)updateLastTime:(NSTimer *)t;

@end
