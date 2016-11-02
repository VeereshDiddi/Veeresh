//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "mVacationController.h"
#import "Destination.h"

@implementation mVacationController

- (void)awakeFromNib {
  
  [super awakeFromNib];
  NSString* europeText = [[NSString alloc] initWithFormat: @"%@", @"Europe"];
  europe = [[Destination alloc] initWithCountry:europeText andBudget:10000.00 withExchangeRate:1.25];
  [europeText release]; 
  [balanceField setStringValue:[[[NSString alloc] initWithFormat :@"%.2f", [europe leftToSpend]] autorelease]];
}

- (IBAction)spendDollars:(id)sender{
  
  NSLog (@"Sending a %.2f cash transaction", [transactionField.stringValue floatValue]);
  [europe spendCash:[transactionField.stringValue floatValue]];
  [balanceField setStringValue:[[[NSString alloc]initWithFormat:@"%.2f", [europe leftToSpend]] autorelease]];
}

- (IBAction)chargeCreditCard:(id)sender {
  
  NSLog (@"Sending a %.2f credit card transaction", [transactionField.stringValue floatValue]);
  [europe chargeCreditCard:[transactionField.stringValue floatValue]];
  [balanceField setStringValue:[[[NSString alloc]initWithFormat:@"%.2f", [europe leftToSpend]] autorelease]];  
}

- (void)dealloc {
  
  [europe release];
  [super dealloc];
}

@end
