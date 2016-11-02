//
//  ForgetPassword.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef ForgetPassword_h
#define ForgetPassword_h

#import <UIKit/UIKit.h>

@interface ForgetPassword : UIViewController <UITextFieldDelegate>


@property (strong, nonatomic) IBOutlet UITextField *txtEmailAddress;


- (IBAction)requestPassword:(id)sender;


- (IBAction)backToLogin:(id)sender;

@end

#endif /* ForgetPassword_h */
