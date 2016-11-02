//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>

typedef struct {
  float exchangeRate;
  double budget;
  double euroTransaction;
} budget;

budget vacationBudget;

void spendDollars (double dollars);
void chargeEuros (double euros);

int main (int argc, const char * argv[]) {
  
  vacationBudget.exchangeRate = 1.2500;
  vacationBudget.budget = 1000.00;
  double numberDollars = 100;
  double numberEuros = 100;
  
  spendDollars(numberDollars);
  NSLog(@"Converting %.2f US dollars into euros leaves $%.2f", numberDollars, vacationBudget.budget);
  chargeEuros(numberEuros);  
  NSLog(@"Charging  %.2f euros leaves $%.2f", numberEuros, vacationBudget.budget);
  
  return 0;
  
}
void spendDollars (double dollars) {
  
  vacationBudget.budget -= dollars;
}

void chargeEuros (double euros) {
  
  vacationBudget.euroTransaction = euros*vacationBudget.exchangeRate;
  vacationBudget.budget -= vacationBudget.euroTransaction;
}

