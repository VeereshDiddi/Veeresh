//
//  ViewController.h
//  AssignSwitch
//
//  Created by MacBook Pro on 21/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UISwitch *onOffSwitch;
- (IBAction)SwitchMethod:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UITextField *textField;
- (IBAction)SubmitMethod:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *imageButton;
@property (strong, nonatomic) IBOutlet UILabel *label2;


@end

