//
//  SampleProtocal.m
//  ProtocalAndDelegate
//
//  Created by MacBook Pro on 17/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "SampleProtocal.h"

@implementation SampleProtocal

- (void)startSampleProcess
{
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self.delegate selector:@selector(processCompleted) userInfo:nil repeats:NO];
}

@end
