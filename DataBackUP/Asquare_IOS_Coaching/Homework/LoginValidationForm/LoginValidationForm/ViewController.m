//
//  ViewController.m
//  LoginValidationForm
//
//  Created by MacBook Pro on 23/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#define ACCEPTABLE_CHARECTERS @"abc"
#define ACCEPTABLE_CHARECTERS1 @"123"

@interface ViewController ()

@end

@implementation ViewController
@synthesize userNameTextField, passwordTextField, textLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    userNameTextField.delegate = self;
    passwordTextField.delegate = self;
    
    userNameTextField.tag =1;
    passwordTextField.tag = 2;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButton:(id)sender {
    
    if (!([userNameTextField.text length] > 0)) {
        textLabel.text = @"Enter valid User Name";
    }
    
    if (!([passwordTextField.text length] > 0)) {
        textLabel.text = @"Enter valid Password";
    }
    
    if ([userNameTextField.text isEqualToString:@"abc"]  &&  [passwordTextField.text isEqualToString:@"123"]) {
        userNameTextField.text = @"Valid User Name";
        passwordTextField.text = @"Valid Password";
        textLabel.text = @"Success";
    } else {
        NSLog(@"Enter valid UserName and Password");
        textLabel.text = @"Enter valid UserName and Password";
    }
    
    
}




- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField.tag==1) {
        
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
        
    }else if (textField.tag == 2){
        
       

        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS1] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    
    return YES;
}   







@end
