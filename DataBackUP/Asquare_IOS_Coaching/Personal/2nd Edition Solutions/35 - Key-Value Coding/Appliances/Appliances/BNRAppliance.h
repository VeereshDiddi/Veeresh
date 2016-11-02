//
//  BNRAppliance.h
//  Appliances
//
//  Created by Michael L Ward on 2/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRAppliance : NSObject
{
	NSString *_productName;
}
// @property (nonatomic, copy) NSString *productName;
@property (nonatomic) int voltage;

// The designated initializer
- (instancetype)initWithProductName:(NSString *)pn;

@end
