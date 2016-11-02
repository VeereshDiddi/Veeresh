//
//  SampleProtocal.h
//  ProtocalAndDelegate
//
//  Created by MacBook Pro on 17/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SampleProtocolDelegate <NSObject>

@required
- (void) processCompleted;

@end

@interface SampleProtocal : NSObject
{
    id <SampleProtocolDelegate> _delegate;
}
@property (nonatomic, strong) id delegate;

- (void)startSampleProcess;

@end
