//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>
#import "Budget.h"

int main (int argc, const char * argv[]) {
  
  double numberEuros = 100;
  double numberDollarsInPoundland = 100;
  double numberPounds = 100; 
  
  NSNumber *europeDollarTransaction = [[NSNumber alloc] initWithDouble:100.00]; 
  NSNumber *europeDollarTransaction2 = [[NSNumber alloc] initWithDouble:200.00]; 
  
  NSMutableArray *europeTransactions = [[NSMutableArray alloc] initWithCapacity:1]; 
  [europeTransactions addObject:europeDollarTransaction];
  [europeTransactions addObject:europeDollarTransaction2]; 
  
  Budget *europeBudget = [Budget new];  
  [europeBudget  createBudget:1000.00 withExchangeRate:1.2500];  
  for (NSNumber *aTransaction in europeTransactions) { 
    [europeBudget spendDollars:[aTransaction doubleValue]];
  } 
  [europeBudget chargeForeignCurrency: numberEuros];
  
  Budget *englandBudget = [Budget new];
  [englandBudget createBudget:2000.00 withExchangeRate:1.5000];
  [englandBudget spendDollars:numberDollarsInPoundland];
  [englandBudget chargeForeignCurrency:numberPounds];
  
  return 0;
} 
