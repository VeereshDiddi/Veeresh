//
//  SignUp.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef SignUp_h
#define SignUp_h

#import <UIKit/UIKit.h>
#import <FacebookSDK/FacebookSDK.h>
#import <QuartzCore/QuartzCore.h>

@interface SignUp : UIViewController <UITextFieldDelegate, FBLoginViewDelegate>


@property (strong, nonatomic) IBOutlet UITextField *txtUserName;

@property (strong, nonatomic) IBOutlet UITextField *txtEmailAddress;

@property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;

@property (strong, nonatomic) IBOutlet UITextField *txtPassword;

@property (strong, nonatomic) IBOutlet UITextField *txtConfirmPassword;
@property (nonatomic,assign) BOOL isChecked;

- (IBAction)backToLogin:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *btnCheckbox;

@property (strong, nonatomic) IBOutlet UIButton *btnRegister;

//@property (strong, nonatomic) IBOutlet UIButton *btnRegisterFacebook;

@property (weak, nonatomic) IBOutlet FBLoginView *btnRegisterFacebook;

- (IBAction)checkboxSelected:(id)sender;


- (IBAction)createAccount:(id)sender;

//- (IBAction)backLogin:(id)sender;

-(BOOL)validateUserName:(NSString *)userName;
-(BOOL)validateEmail:(NSString*)email;
-(BOOL)validatePhoneNumber:(NSString *)phoneNumber;
-(BOOL)validatePassword:(NSString *)password;
-(BOOL)validateConfirmPassword:(NSString *)password;

- (IBAction)termsOfServiceForRegister:(id)sender;

- (IBAction)privacyPolicyForRegister:(id)sender;
- (IBAction)termsOfServiceForFacebook:(id)sender;
- (IBAction)privacyPolicyForFacebook:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *signUpView;


@end
#endif /* SignUp_h */
