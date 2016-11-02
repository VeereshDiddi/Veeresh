//
//  MsitPhone.h
//  Level4Project
//
//  Created by MacBook Pro on 21/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MsitPhone : NSObject
{
    NSString *_firstName;
}
@property NSString *phoneName;
@property NSString *modelNumber;
//@property (readonly) NSString *firstName;
@property (readonly) NSString *lastName;



- (void)speak;
- (NSString *)speak1;
- (NSArray *)speak2;
- (NSString *)speak3:(NSString *)greeting;

- (void)reportBatteryLife:(NSNumber *)life;


- (void)changeLastName:(NSString *)newLastName;

@end
