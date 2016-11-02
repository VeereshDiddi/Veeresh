//
//  CustomDelegate.h
//  CustomDelegates
//
//  Created by AsquareMobileTechnologies on 6/23/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataDelegate <NSObject>

@required
-(void)doSomething:(NSString*)str andData:(NSArray*)dataArr;

@optional
-(void)testMethod;

@end

@interface CustomDelegate : NSObject

@property(nonatomic,weak)id delegate;
-(void)processMyDelegate;
-(void)testMethod:(NSDictionary*)dic;
@end
