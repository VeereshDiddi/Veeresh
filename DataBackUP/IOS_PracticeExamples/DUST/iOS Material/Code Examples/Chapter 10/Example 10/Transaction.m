//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Transaction.h"
#import "Budget.h"

@implementation Transaction

- (void) createTransaction: (double) theAmount forBudget: (Budget*) aBudget {
  
  budget = aBudget;
  amount = theAmount;
}

- (void) spend {
  
  // fill in the method in subclasses
}

- (void) trackSpending: (double) theAmount {
  
  NSLog(@"You are about to spend another %.2f", theAmount);
}

@end
