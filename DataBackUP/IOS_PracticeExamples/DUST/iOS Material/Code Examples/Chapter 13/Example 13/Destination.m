//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "Destination.h"
#import "CashTransaction.h"
#import "CreditCardTransaction.h"
#import "Budget.h"
#import "Transaction.h"

@implementation Destination

- (id) initWithCountry: (NSString*) theCountry andBudget: (double) budgetAmount withExchangeRate: (double) theExchangeRate{
  if (self = [super init]) {
    transactions = [[NSMutableArray alloc] initWithCapacity:10]; 
    theBudget = [[Budget alloc]  initWithAmount: budgetAmount withExchangeRate: theExchangeRate]; 
    exchangeRate = theExchangeRate;
    country = theCountry;
    [country retain];
    NSLog(@"I'm off to %@", theCountry);
  }
  return self;
}

- (void) updateExchangeRate: (double) newExchangeRate {

exchangeRate = newExchangeRate;
}

- (void) spendCash: (double)amount {

Transaction *aTransaction = [[CashTransaction alloc] initWithAmount:amount forBudget:theBudget ]; 
[transactions addObject:aTransaction];
[aTransaction spend];
[aTransaction release];

}

- (void) chargeCreditCard: (double) amount {

Transaction *aTransaction = [[CreditCardTransaction alloc] initWithAmount:amount forBudget:theBudget ]; 
[transactions addObject:aTransaction];
[aTransaction spend];
[aTransaction release];
}


- (double ) leftToSpend {

return  [theBudget returnBalance];
}

- (void) dealloc {

[transactions release];
[theBudget release];
[country release];
[super dealloc];
}

@end
