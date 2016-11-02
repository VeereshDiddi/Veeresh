//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "DestinationCategory.h"
#import "Transaction.h" 
#import "ATMTransactionDelegate.h" 

// @implementation DestinationCategory

@implementation Destination (ATM)

-(void) useATM: (double)amount{ 
  
  ATMTransactionDelegate *aTransactionDelegate = [[ATMTransactionDelegate alloc] init]; 
  Transaction *aTransaction = [[Transaction alloc] initWithAmount: amount forBudget: theBudget]; 
  aTransaction.delegate = aTransactionDelegate;
  [transactions addObject:aTransaction];
  [aTransaction spend];
  [aTransaction release]; 
}


@end
