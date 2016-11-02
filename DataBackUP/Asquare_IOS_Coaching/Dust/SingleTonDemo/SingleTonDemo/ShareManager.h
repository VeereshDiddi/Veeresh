//
//  ShareManager.h
//  SingleTonDemo
//
//  Created by AsquareMobileTechnologies on 6/18/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShareManager : NSObject{
    
    
}

@property(strong,nonatomic)NSString *nameStr;
@property(strong,nonatomic)NSArray *dataArr;

+(id)sharedManager;
@end
