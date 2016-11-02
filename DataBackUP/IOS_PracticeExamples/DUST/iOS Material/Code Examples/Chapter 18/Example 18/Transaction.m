//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Transaction.h"
#import "Budget.h"

@implementation Transaction

@synthesize budget, delegate , amount; 

- (void) spend {
  
  if ([delegate respondsToSelector:@selector(spend:)])
    [delegate spend:self]; 
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
