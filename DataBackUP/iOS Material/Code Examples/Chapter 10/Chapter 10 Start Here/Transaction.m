//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Transaction.h"

@implementation Transaction

- (void) createTransaction: (double) theAmount ofType: (transactionType) aType {
  
  type = aType;
  amount = theAmount;
}

- (double) returnAmount {
  
  return amount;
}

- (transactionType) returnType {
  
  return type;
};

@end
