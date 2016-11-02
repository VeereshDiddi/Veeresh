//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>

struct budget {
  float exchangeRate;
  double budget;
  double euroTransaction;
};	

int main (int argc, const char * argv[]) {
  
  struct budget vacationBudget;
  vacationBudget.exchangeRate = 1.2500;
  vacationBudget.budget = 1000.00;
  
  vacationBudget.budget -= 100;
  NSLog(@"Converting 100 US dollars into euros leaves $%.2f", vacationBudget.budget);
  vacationBudget.euroTransaction = 100*vacationBudget.exchangeRate;
  vacationBudget.budget -= vacationBudget.euroTransaction;
  NSLog(@"Charging 100 euros leaves $%.2f", vacationBudget.budget);  
  
  return 0;
}
