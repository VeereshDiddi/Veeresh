//
//  detailsViewController.h
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *detailsname;
@property (weak, nonatomic) IBOutlet UITextField *detailsstate;
@property (weak, nonatomic) IBOutlet UITextField *detailscity;
@property (weak, nonatomic) IBOutlet UITextField *deatilsemp;
@property (weak, nonatomic) IBOutlet UIButton *deatilsbtn;
@property(strong,nonatomic)NSDictionary *detailsarray;
- (IBAction)deletebutton:(id)sender;
@end
