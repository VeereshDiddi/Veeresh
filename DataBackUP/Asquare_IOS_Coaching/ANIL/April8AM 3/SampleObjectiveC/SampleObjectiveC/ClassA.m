//
//  ClassA.m
//  SampleObjectiveC
//
//  Created by AsquareMobileTechnologies on 4/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ClassA.h"

@implementation ClassA
+ (void)addA{

    NSLog(@"Class Method::");
}
- (void)addB{
   NSLog(@"Instance Method::%d",self.value);
}

- (void)multiplicationOfTwoNumbers{

    NSLog(@"Value*value1 is::%d",self.value*self.value1);
}
@end
