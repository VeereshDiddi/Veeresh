//
//  ShareManager.h
//  SingleTon
//
//  Created by MacBook Pro on 19/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject
{
    
}

@property(strong, nonatomic)NSString *nameStr;
@property(strong, nonatomic)NSArray *dataArr;

+(id)sharedManager;

@end
