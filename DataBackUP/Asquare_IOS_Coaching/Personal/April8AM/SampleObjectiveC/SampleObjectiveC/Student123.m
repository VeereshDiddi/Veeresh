//
//  Student123.m
//  SampleObjectiveC
//
//  Created by AsquareMobileTechnologies on 4/29/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "Student123.h"

@implementation Student123
- (void)myProperties{

    NSLog(@"my avg::%d",(self.social+self.maths+self.english)/3);
}

+(void)myMethod{
    NSLog(@"myMethod");
}
@end
