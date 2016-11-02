//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "CashTransaction.h"
#import "Budget.h"

@implementation CashTransaction

- (id) initWithAmount: (double) theAmount forBudget: (Budget*) aBudget  { 
  
  if (self = [super initWithAmount:theAmount forBudget:aBudget]) {
    name = @"Cash";
  }
  return self;
}

- (void) spend {
  
  [budget spendDollars:amount];
}

- (void) dealloc {
  
  [super dealloc];
}

@end
