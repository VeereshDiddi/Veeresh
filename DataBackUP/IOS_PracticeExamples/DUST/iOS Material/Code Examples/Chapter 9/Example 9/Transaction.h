//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import <Cocoa/Cocoa.h>

typedef enum {cash, charge} transactionType;

@interface Transaction : NSObject {
  
  transactionType type;
  double          amount;
}

- (void) createTransaction: (double) theAmount ofType: (transactionType) aType;
- (double) returnAmount;
- (transactionType) returnType;

@end
