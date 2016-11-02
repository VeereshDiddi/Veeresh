//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com


#import <Cocoa/Cocoa.h>
@class Budget;

@interface Destination : NSObject {
  
  NSString       *country;
  double          exchangeRate;
  NSMutableArray *transactions;
  Budget         *theBudget;
  
}

- (id) initWithCountry: (NSString*) theCountry andBudget: (double) budgetAmount withExchangeRate: (double) theExchangeRate;
- (void) spendCash: (double) aTransaction;
- (void) chargeCreditCard: (double) aTransaction;
- (double) leftToSpend;

@end
