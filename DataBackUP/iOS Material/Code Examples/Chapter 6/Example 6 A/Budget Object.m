//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>

@interface Budget : NSObject {
  
  float  exchangeRate;
  double budget;
  double exchangeTransaction;
} 

- (void) createBudget: (double) aBudget withExchangeRate: (float) anExchangeRate;
- (void) spendDollars: (double) dollars ;
- (void) chargeForeignCurrency: (double) foreignCurrency;

@end

@implementation Budget

- (void) createBudget: (double) aBudget withExchangeRate: (float) anExchangeRate{
  
  exchangeRate = anExchangeRate;
  budget = aBudget;
}

- (void) spendDollars: (double) dollars {
  
  budget -= dollars;
  NSLog(@"Converting %.2f US dollars into foreign currency leaves $%.2f", dollars, budget);
}

- (void) chargeForeignCurrency: (double) foreignCurrency {
  
  exchangeTransaction = foreignCurrency*exchangeRate;
  budget -= exchangeTransaction;
  NSLog(@"Charging %.2f in foreign currency leaves $%.2f", foreignCurrency, budget);
}

@end

int main (int argc, const char * argv[]) {
  
  double numberDollarsInEuroland = 100;
  double numberEuros = 100;
  double numberDollarsInPoundland = 100;
  double numberPounds = 100;
  
  Budget *europeBudget = [Budget new];
  [europeBudget createBudget:1000.00 withExchangeRate:1.2500];
  [europeBudget spendDollars:numberDollarsInEuroland];
  [europeBudget chargeForeignCurrency:numberEuros];
  
  Budget *englandBudget = [Budget new];
  [englandBudget createBudget:2000.00 withExchangeRate:1.5000];
  [englandBudget spendDollars:numberDollarsInPoundland];
  [englandBudget chargeForeignCurrency:numberPounds];
  
  return 0;
}
