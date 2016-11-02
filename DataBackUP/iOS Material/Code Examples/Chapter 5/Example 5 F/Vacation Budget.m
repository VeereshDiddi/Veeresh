//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com 

#import <Foundation/Foundation.h>

typedef struct {
  float exchangeRate;
  double budget;
  double exchangeTransaction; 
} budget;

budget vacationBudgetEurope;
budget vacationBudgetEngland;

void spendDollars(budget *theBudget, double dollars); 
void chargeForeignCurrency(budget *theBudget, double foreignCurrency); 

int main (int argc, const char * argv[]) {
  
  vacationBudgetEurope.exchangeRate = 1.2500;
  vacationBudgetEurope.budget = 1000.00;
  double numberDollarsInEuroland = 100;
  double numberEuros = 100;
  vacationBudgetEngland.exchangeRate = 1.5000;
  vacationBudgetEngland.budget = 2000.00;
  double numberDollarsInPoundland = 100;
  double numberPounds = 100;
  
  spendDollars(&vacationBudgetEurope, numberDollarsInEuroland);
  NSLog(@"Converting %.2f US dollars into euros leaves $%.2f", numberDollarsInEuroland, vacationBudgetEurope.budget);
  chargeForeignCurrency (&vacationBudgetEurope, numberEuros);
  NSLog(@"Charging %.2f euros leaves $%.2f", numberEuros, vacationBudgetEurope.budget);
  spendDollars(&vacationBudgetEngland, numberDollarsInPoundland);
  NSLog(@"Converting %.2f US dollars into pounds leaves $%.2f", numberDollarsInPoundland, vacationBudgetEngland.budget);
  chargeForeignCurrency(&vacationBudgetEngland, numberPounds);
  NSLog(@"Charging %.2f pounds leaves $%.2f", numberPounds, vacationBudgetEngland.budget);
  
  return 0;
}
void spendDollars(budget *theBudget, double dollars) {
  
  theBudget->budget -= dollars;
}


void chargeForeignCurrency(budget *theBudget, double foreignCurrency) {
  
  theBudget->exchangeTransaction = foreignCurrency*theBudget->exchangeRate;
  theBudget->budget -= theBudget->exchangeTransaction;
}