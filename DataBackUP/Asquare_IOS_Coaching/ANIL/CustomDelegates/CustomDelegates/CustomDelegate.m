//
//  CustomDelegate.m
//  CustomDelegates
//
//  Created by AsquareMobileTechnologies on 6/23/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "CustomDelegate.h"

@implementation CustomDelegate

-(id)init{
    
    return self;
}
-(void)processMyDelegate{
    NSArray *arr = [NSArray arrayWithObjects:@"one",@"two", nil];
    [self.delegate doSomething:@"Asquare" andData:arr];
}
-(void)testMethod:(NSDictionary*)dic{
    NSLog(@"dic :%@",dic);
    NSArray *arr = [NSArray arrayWithObjects:@"one",@"two", nil];
    [self.delegate doSomething:@"Asquare" andData:arr];
}
@end
