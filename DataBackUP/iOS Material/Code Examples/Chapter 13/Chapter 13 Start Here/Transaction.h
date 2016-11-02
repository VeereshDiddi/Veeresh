//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com



#import <Cocoa/Cocoa.h>
@class Budget;

@interface Transaction : NSObject {
  
  Budget   *budget;  
  double    amount;
  NSString *name;
}

- (id) initWithAmount: (double) theAmount forBudget: (Budget*) aBudget;
- (void) spend;

@end
