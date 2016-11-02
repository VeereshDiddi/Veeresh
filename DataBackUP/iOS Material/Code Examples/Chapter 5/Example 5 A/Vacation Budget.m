//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>

int main (int argc, const char * argv[]) {
  
  float exchangeRate = 1.2500;
  double budget = 1000.00;
  double euroTransaction;
  
  budget -= 100;
  NSLog(@"Converting 100 US dollars into euros leaves $%.2f", budget);
  euroTransaction = 100*exchangeRate;
  budget -= euroTransaction;
  NSLog(@"Charging 100 euros leaves $%.2f", budget);
  
  return 0;
}
