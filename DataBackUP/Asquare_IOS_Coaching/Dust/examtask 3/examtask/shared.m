//
//  shared.m
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import "shared.h"
static shared *sharedInstance=nil;
@implementation shared
+(shared *)sharedClass;
{
    if (sharedInstance==nil)
    {
        sharedInstance=[[shared alloc]init];
    }
    return sharedInstance;
}
@end
