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

@interface SignUp : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *txtUserName;


@property (strong, nonatomic) IBOutlet UITextField *txtEmailAddress;

@property (strong, nonatomic) IBOutlet UITextField *txtPhoneNumber;


- (IBAction)createAccount:(id)sender;

- (IBAction)backLogin:(id)sender;


@end
#endif /* SignUp_h */
