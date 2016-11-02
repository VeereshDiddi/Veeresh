//
//  Student.h
//  SampleObjectiveC
//
//  Created by AsquareMobileTechnologies on 4/29/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Student : NSObject
@property(nonatomic,strong)NSString *fname;
@property(nonatomic,strong)NSString *lname;
@property(nonatomic,assign)int maths;
@property(nonatomic,assign)int social;
- (void)calculateAvg;
@end
