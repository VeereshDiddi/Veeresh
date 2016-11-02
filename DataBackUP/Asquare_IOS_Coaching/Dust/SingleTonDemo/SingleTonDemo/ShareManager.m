//
//  ShareManager.m
//  SingleTonDemo
//
//  Created by AsquareMobileTechnologies on 6/18/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ShareManager.h"

@implementation ShareManager

/*+(id)sharedManager{
    static ShareManager *shareManager =  nil;
    @synchronized(self) {
        if (shareManager == nil) {
            shareManager = [self alloc];
        }
    }
    return shareManager;
}*/
+(id)sharedManager{
    static ShareManager *shareManager =  nil;
    dispatch_once_t oncet;
    dispatch_once(&oncet, ^{
        if (shareManager == nil) {
            shareManager = [self alloc];
        }
    });
    return shareManager;
}
@end
