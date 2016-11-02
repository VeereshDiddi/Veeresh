//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Budget.h"
#import "Destination.h"

@implementation Budget

- (id) initWithAmount: (double) aBudget forDestination: (Destination*) aDestination {
  
  if (self = [super init]) {
    destination = aDestination;
    [destination retain];
    budget = aBudget;
  }
  return self;
}

- (void) spendDollars: (double) dollars {
  
  budget -= dollars;
}

- (void) chargeForeignCurrency: (double) foreignCurrency {

  transaction = foreignCurrency*[destination exchangeRate];
  budget -= transaction;
}

- (double) returnBalance {
  
  return budget;
}

- (void) dealloc {
  [destination release]; 
  [super dealloc];
}

@end
