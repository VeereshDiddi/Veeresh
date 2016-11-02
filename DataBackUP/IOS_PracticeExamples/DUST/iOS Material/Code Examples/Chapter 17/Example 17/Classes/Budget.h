//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

@class Destination;

@interface Budget : NSObject {
  
  double       budget;
  double       transaction;
  Destination *destination;
} 

- (id) initWithAmount: (double) aBudget forDestination: (Destination*) aDestination ;
- (void) spendDollars: (double) dollars ; 
- (void) chargeForeignCurrency: (double) euros;
- (double) returnBalance;

@end
