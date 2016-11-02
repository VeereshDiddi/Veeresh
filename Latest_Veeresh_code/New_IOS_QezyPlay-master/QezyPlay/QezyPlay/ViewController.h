//
//  ViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;


@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) UIActivityIndicatorView *spinner;


- (IBAction)forgetPassword:(id)sender;


- (IBAction)logIn:(id)sender;

- (IBAction)signUp:(id)sender;

@end

