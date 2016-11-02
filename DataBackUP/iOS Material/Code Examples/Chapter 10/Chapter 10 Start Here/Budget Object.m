//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>
#import "Budget.h"
#import "Transaction.h"

int main (int argc, const char * argv[]) {
  
  double numberDollarsInPoundland = 100;
  double numberPounds = 100; 
   
  NSMutableArray *transactions = 
  [[NSMutableArray alloc] initWithCapacity:10]; 
  Transaction *aTransaction ;
  for (int n = 1; n <  2; n++) {
    aTransaction = [Transaction new];
    [aTransaction createTransaction: n*100 ofType:cash];
    [transactions addObject:aTransaction];
  }
  
  int n =1;
  while (n < 3) {
    aTransaction = [Transaction new];
    [aTransaction createTransaction: n*100 ofType:charge];
    [transactions addObject:aTransaction];
    n++;
  }
  
  do {
    aTransaction = [Transaction new];
    [aTransaction createTransaction: n*100 ofType:charge];
    [transactions addObject:aTransaction];
    n++;    
  } while (n <= 3);
  
  Budget *europeBudget = [Budget new];  
  [europeBudget createBudget:1000.00 withExchangeRate:1.2500]; 
  for (Transaction * aTransaction in transactions) {
     switch ([aTransaction returnType]) {
      case cash:
        [europeBudget spendDollars:[aTransaction returnAmount]];
        break;
      case charge:
        [europeBudget chargeForeignCurrency:[aTransaction returnAmount]];
        break;
      default:
        break;
      }
  }

  Budget *englandBudget = [Budget new];
  [englandBudget createBudget:2000.00 withExchangeRate:1.5000];
  [englandBudget spendDollars:numberDollarsInPoundland];
  [englandBudget chargeForeignCurrency:numberPounds];
  
  return 0;
}
