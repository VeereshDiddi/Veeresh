//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com

@class Destination;

@interface iVacationViewController : UIViewController {
  
  Destination           *europe;
  IBOutlet UITextField  *transactionField;
  IBOutlet UILabel      *balanceField; 
  
}

- (IBAction)spendDollars:(id)sender; 
- (IBAction)chargeCreditCard:(id)sender; 

@end
