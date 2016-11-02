//
//  ShareManager.m
//  SingleTon
//
//  Created by MacBook Pro on 19/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ShareManager.h"

@implementation ShareManager

+(id)sharedManager
{
    static ShareManager *shareManager = nil;
    @synchronized (self) {
        if (shareManager == nil) {
            shareManager = [self alloc];
        }
    }
    return shareManager;
}

@end
