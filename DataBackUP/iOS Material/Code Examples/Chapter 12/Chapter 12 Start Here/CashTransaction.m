//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "CashTransaction.h"
#import "Budget.h"

@implementation CashTransaction

- (void) spend {
  
  [budget spendDollars:amount];
}

@end
