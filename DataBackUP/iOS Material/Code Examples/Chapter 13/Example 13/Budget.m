//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Budget.h"

@implementation Budget

- (id) initWithAmount: (double) aBudget withExchangeRate: (double) anExchangeRate {
  
  if (self = [super init]) {
    exchangeRate = anExchangeRate;
    budget = aBudget;
  }
  return self;
}

- (void) spendDollars: (double) dollars {
  
  budget -= dollars;
}

- (void) chargeForeignCurrency: (double) foreignCurrency {
  transaction = foreignCurrency*exchangeRate;
  budget -= transaction;
}

- (double) returnBalance {
  
  return budget;
}

- (void) dealloc {
  
  [super dealloc];
}

@end
