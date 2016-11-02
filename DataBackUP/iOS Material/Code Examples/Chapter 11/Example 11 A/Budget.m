//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Budget.h"

@implementation Budget

- (void) createBudget: (double) aBudget withExchangeRate: (float) anExchangeRate {
  
  exchangeRate = anExchangeRate;
  budget = aBudget;
}

- (void) spendDollars: (double) dollars {

  budget -= dollars;
  NSLog(@"Converting %.2f US dollars into foreign currency leaves $%.2f", dollars, budget);
}

- (void) chargeForeignCurrency: (double) foreignCurrency {
  
  transaction = foreignCurrency*exchangeRate;
  budget -= transaction;
  NSLog(@"Charging %.2f in foreign currency leaves $%.2f", foreignCurrency, budget);
}

@end


