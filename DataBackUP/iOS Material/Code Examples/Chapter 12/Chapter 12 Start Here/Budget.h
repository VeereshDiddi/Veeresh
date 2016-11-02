//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Cocoa/Cocoa.h>

@interface Budget : NSObject {
  
  float  exchangeRate;
  double budget;
  double transaction;
} 

- (void) createBudget: (double) aBudget withExchangeRate: (float) anExchangeRate;
- (void) spendDollars: (double) dollars; 
- (void) chargeForeignCurrency: (double) euros;
- (double) returnBalance;

@end
