//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Transaction.h"
#import "Budget.h"

@implementation Transaction

- (void) spend {
  
  // fill in the method in subclasses
}

- (id) initWithAmount: (double) theAmount forBudget: (Budget*) aBudget {
  if (self = [super init]) {
    budget = aBudget;
    [budget retain];
    amount = theAmount;
  }
  return self;
}

- (void) dealloc {
  
  [budget release];
  [super dealloc];
}

@end
