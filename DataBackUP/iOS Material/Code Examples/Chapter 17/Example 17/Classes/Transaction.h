//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

@class Budget;

@interface Transaction : NSObject {
  
  Budget   *budget;  
  double    amount;
  NSString *name;
  id        delegate;
}

- (id) initWithAmount: (double) theAmount forBudget: (Budget*) aBudget;
- (void) spend;

@property (nonatomic, retain) Budget *budget; 
@property (nonatomic, retain) id delegate;
@property (readwrite) double amount;

@end

@protocol TransactionDelegate

@required

- (void) spend: (Transaction *) aTransaction;

@optional

- (void) transaction: (Transaction*) transaction spend: (double) amount;

@end

