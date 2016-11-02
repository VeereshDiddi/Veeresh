//
//  shared.h
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface shared : NSObject
+(shared *)sharedClass;
@property(strong,nonatomic)NSMutableArray *receivearray;
@end
