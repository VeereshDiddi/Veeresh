//
//  ViewController.h
//  AssignTableViewController
//
//  Created by MacBook Pro on 27/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSString *strName;
@property (strong, nonatomic) NSString *strPlayerRole;

@property (strong, nonatomic) IBOutlet UITextField *NameTextField;
@property (strong, nonatomic) IBOutlet UITextField *PlayerRoleTextField;
- (IBAction)SubmitViewController:(id)sender;

@end