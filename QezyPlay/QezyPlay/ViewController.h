//
//  ViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Database.h"
#import <FacebookSDK/FacebookSDK.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController <UITextFieldDelegate, FBLoginViewDelegate>{
    NSMutableArray *favoriteList;
    NSMutableArray *profileList;
}

@property (strong, nonatomic) IBOutlet UITextField *txtUsername;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;
@property (strong, nonatomic) IBOutlet UIButton *btnSignIn;
@property (weak, nonatomic) IBOutlet FBLoginView *btnFacebook;


@property (strong, nonatomic) IBOutlet UIButton *btnCheckbox;
@property (nonatomic,assign) BOOL isChecked;

@property (strong, nonatomic) UIActivityIndicatorView *spinner;
- (IBAction)checkboxSelected:(id)sender;


- (IBAction)forgetPassword:(id)sender;

- (IBAction)logIn:(id)sender;

- (IBAction)signUp:(id)sender;

- (IBAction)termsOfServiceForSignIn:(id)sender;

- (IBAction)privacyPolicyForSignIn:(id)sender;

- (IBAction)termsOfServiceForFacebook:(id)sender;

- (IBAction)privacyPolicyForFacebook:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *loginView;

@end

