//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

#import "iVacationViewController.h"
#import "Destination.h"

@implementation iVacationViewController

- (IBAction)spendDollars:(id)sender{
  
  NSLog (@"Sending a %.2f cash transaction", [transactionField.text floatValue]);
  [europe spendCash:[transactionField.text floatValue]];
  balanceField.text = [[NSString alloc]initWithFormat :@"%.2f", [europe leftToSpend]];
}

- (IBAction)chargeCreditCard:(id)sender {
  
  NSLog (@"Sending a %.2f credit card transaction", [transactionField.text floatValue]);
  [europe chargeCreditCard:[transactionField.text floatValue]];
  balanceField.text = [[NSString alloc]initWithFormat :@"%.2f", [europe leftToSpend]];
}

/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
  
  [super viewDidLoad];
  NSString* europeText = [[NSString alloc] initWithFormat: @"%@", @"Europe"];
  europe = [[Destination alloc] initWithCountry:europeText andBudget:10000.00 withExchangeRate:1.25];
  [europeText release]; 
  NSString* balanceFieldText = [[NSString alloc] initWithFormat:@"%.2f", [europe leftToSpend]];
  balanceField.text = balanceFieldText;
  [balanceFieldText release];
}


/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */


- (void)didReceiveMemoryWarning {
  
  [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
  // Release anything that's not essential, such as cached data
}


- (void)dealloc {
  
  [europe release];
  [super dealloc];
}

@end
