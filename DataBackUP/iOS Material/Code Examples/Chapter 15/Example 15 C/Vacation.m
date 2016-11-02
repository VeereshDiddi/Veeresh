//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Foundation/Foundation.h>
#import "Destination.h"

int main (int argc, const char * argv[]) {
  
  NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
  
  NSString* appDataPath  =@"/Users/neal/Desktop/Example 15 C/AppData.plist";
  NSMutableDictionary* appDataDictionary=[[NSMutableDictionary alloc]initWithContentsOfFile:appDataPath];
  NSDictionary* europeDictionary = [appDataDictionary valueForKey:@"Europe"] ; 
  NSDictionary* englandDictionary = [appDataDictionary valueForKey:@"England"] ;
  NSString* europeSymbol = [[NSString alloc] initWithFormat:@"%@", [europeDictionary valueForKey:@"Symbol"]];
  NSString* englandSymbol = [[NSString alloc] initWithFormat:@"%@", [englandDictionary valueForKey:@"Symbol"]]; 
  
  float europeBudget = 1000;
  float englandBudget = 2000;
  NSMutableDictionary* budgetsDictionary = [appDataDictionary valueForKey:@"Budgets"] ;
  if (budgetsDictionary) {
    europeBudget = [[budgetsDictionary valueForKey:@"Europe"] floatValue];
    englandBudget = [[budgetsDictionary valueForKey:@"England"] floatValue];
  }
  else {
    NSNumber* europeBalance = [[NSNumber alloc] initWithFloat:europeBudget];
    NSNumber* englandBalance = [[NSNumber alloc] initWithFloat:englandBudget];
    budgetsDictionary = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                         europeBalance, @"Europe",  
                         englandBalance, @"England", nil];
    [appDataDictionary setObject:budgetsDictionary forKey:@"Budgets"];
  }
  NSLog(@"You have $%.2f to spend in Europe", europeBudget ); 
  NSLog(@"You have $%.2f to spend in England", englandBudget ); 
  
  
  NSString* europeText = [[NSString alloc] initWithFormat: @"%@", @"Europe"];
  Destination* europe = [[Destination alloc] initWithCountry: europeText andBudget:europeBudget withExchangeRate: 1.25]; 
  [europeText release];
  NSString* englandText = [[NSString alloc] initWithFormat: @"%@", @"England"];
  Destination* england = [[Destination alloc] initWithCountry: englandText andBudget:englandBudget withExchangeRate: 1.50]; 
  [englandText release];
  
  for (int n = 1; n <  2; n++) {
    double transaction = n*100.00;
    NSLog (@"Sending a $%.2f cash transaction", transaction);
    [europe spendCash:transaction];
    NSLog(@"Remaining budget $%.2f", [europe leftToSpend]);
    NSLog(@"Sending a $%.2f cash transaction", transaction);   
    [england spendCash:transaction];
    NSLog(@"Remaining budget $%.2f", [england leftToSpend]); 
  }
  
  [europe setExchangeRate:1.30];
  [england setExchangeRate:1.40];
  
  int n =1;
  while (n < 4) {
  double transaction = n*100.00;
  NSLog (@"Sending a %@%.2f credit card transaction", europeSymbol, transaction);
  [europe chargeCreditCard:transaction];
  NSLog(@"Remaining budget $%.2f", [europe leftToSpend]);
  NSLog (@"Sending a %@%.2f credit card transaction", englandSymbol, transaction);
  [england chargeCreditCard:transaction];
  NSLog(@"Remaining budget $%.2f", [england leftToSpend]); 
  n++;
  }  
  
  NSNumber* europeBalance = [[NSNumber alloc] initWithFloat:[europe leftToSpend]];
  NSNumber* englandBalance = [[NSNumber alloc] initWithFloat:[england leftToSpend]];
  [budgetsDictionary setObject:europeBalance forKey:@"Europe"];
  [budgetsDictionary setObject:englandBalance forKey:@"England"];
  [appDataDictionary writeToFile:appDataPath atomically:YES];
  
  NSString *returnedCountry = [england country]; 
  NSLog (@"You have deleted the %@ part of your trip", returnedCountry);
  [returnedCountry release];
  [england release]; 
  
  [pool drain];
  return 0;
  }
