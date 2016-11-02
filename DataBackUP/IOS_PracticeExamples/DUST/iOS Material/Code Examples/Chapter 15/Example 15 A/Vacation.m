//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>
#import "Destination.h"

int main (int argc, const char * argv[]) {
  
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  NSString* appDataPath = @"/Users/neal/Desktop/Example 15 A/AppData.plist";
  NSMutableDictionary *appDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:appDataPath];
  NSString* europeSymbol = [[NSString alloc] initWithFormat: @"%@", [appDictionary valueForKey:@"Europe"]];
  NSString* englandSymbol = [[NSString alloc] initWithFormat: @"%@", [appDictionary valueForKey:@"England"]];
  
  NSString* europeText = [[NSString alloc] initWithFormat: @"%@", @"Europe"];
  Destination* europe = [[Destination alloc] initWithCountry:europeText andBudget:1000.00  withExchangeRate:1.25]; 
  [europeText release];
  NSString* englandText = [[NSString alloc] initWithFormat: @"%@", @"England"];
  Destination* england = [[Destination alloc] initWithCountry:englandText andBudget:2000.00 withExchangeRate:1.50]; 
  [englandText release];
  
  
  for (int n = 1; n < 2; n++) {
    double transaction = n*100.00;
    NSLog(@"Sending a $%.2f cash transaction",  transaction);
    [europe spendCash:transaction];
    NSLog(@"Remaining budget $%.2f", [europe leftToSpend]);
    NSLog(@"Sending a $%.2f cash transaction", transaction);   
    [england spendCash:transaction];
    NSLog(@"Remaining budget $%.2f", [england leftToSpend]); 
  }
  
  [europe setExchangeRate:1.30];
  [england setExchangeRate:1.40];
  
  int n = 1;
  while (n < 4) {
    double transaction = n*100.00;
    NSLog(@"Sending a %@%.2f credit card transaction", europeSymbol, transaction);
    [europe chargeCreditCard:transaction];
    NSLog(@"Remaining budget $%.2f", [europe leftToSpend]);
    NSLog(@"Sending a %@%.2f credit card transaction", englandSymbol, transaction);
    [england chargeCreditCard:transaction];
    NSLog(@"Remaining budget $%.2f", [england leftToSpend]); 
    n++;
  }  
  
  NSString *returnedCountry = [england country]; 
  NSLog (@"You have deleted the %@ part of your trip", returnedCountry);
  [returnedCountry release];
  [england release]; 
  
  [pool drain];
  return 0;
}
