//
//  ViewController.h
//  LoginForm
//
//  Created by MacBook Pro on 09/08/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    NSMutableArray *arr;
}

@property (weak, nonatomic) IBOutlet UITextField *userNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)loginActionButton:(id)sender;

@end

