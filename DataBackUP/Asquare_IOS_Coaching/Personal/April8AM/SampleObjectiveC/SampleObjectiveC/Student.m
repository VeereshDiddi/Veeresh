//
//  Student.m
//  SampleObjectiveC
//
//  Created by AsquareMobileTechnologies on 4/29/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "Student.h"

@implementation Student
- (void)calculateAvg{

    NSLog(@"%@ %@ Avg is %d",self.fname,self.lname,(self.maths+self.social)/2);
}
@end
