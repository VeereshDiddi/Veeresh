//
//  ViewController.m
//  UITextFieldSample
//
//  Created by AsquareMobileTechnologies on 5/21/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"
#define ACCEPTABLE_CHARECTERS @"0123456789."
#define ACCEPTABLE_CHARECTERS1 @"ABCD"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    float  val =self.view.frame.size.width/2;
    userFld = [[UITextField alloc]initWithFrame:CGRectMake(val-val/2, 20, val, 40)];
    userFld.borderStyle = UITextBorderStyleRoundedRect;
    userFld.textColor= [UIColor blackColor];
    userFld.backgroundColor = [UIColor grayColor];
    userFld.placeholder = @"Please enter username";
    userFld.delegate = self;
    [userFld becomeFirstResponder];
    self.passFld.delegate = self;
    userFld.tag =1;
    self.passFld.tag = 2;
   
    [self.view addSubview:userFld];
    //self.passFld.secureTextEntry = YES;
    self.passFld.frame= CGRectMake(userFld.frame.origin.x, userFld.frame.origin.y+userFld.frame.size.height+20, userFld.frame.size.width, userFld.frame.size.height);
    [self.passFld becomeFirstResponder];
    lbl = [[UILabel alloc]initWithFrame:CGRectMake(100, 300, 100, 40)];
    [self.view addSubview:lbl];
    
    
    btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(self.view.frame.size.width/2-50, self.passFld.frame.origin.y+self.passFld.frame.size.height+20, 100, 40);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"Submit" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = 1;
    [self.view addSubview:btn];
    
    
   UIButton *btn1 =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn1.frame = CGRectMake(self.view.frame.size.width/2-50, btn.frame.origin.y+btn.frame.size.height+20, 100, 40);
    btn1.tag = 2;
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"ANIL" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(submitAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
}
- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.passFld.frame= CGRectMake(userFld.frame.origin.x, userFld.frame.origin.y+userFld.frame.size.height+20, userFld.frame.size.width, userFld.frame.size.height);
    btn.frame = CGRectMake(self.view.frame.size.width/2-50, self.passFld.frame.origin.y+self.passFld.frame.size.height+20, 100, 40);
    
}
- (void)submitAction:(UIButton *)bbb{

    
    if (bbb.frame.origin.y==140) {
        if ([userFld.text length]>0) {
            
            //        for (id obj in self.view.subviews) {
            //            if ([obj isKindOfClass:[UILabel class]]) {
            //                [obj removeFromSuperview];
            //                NSLog(@"Testttttttttt");
            //            }
            //        }
            [btn setTitle:userFld.text forState:UIControlStateNormal];
            lbl.text = self.passFld.text;
            
            
        }else{
            
            NSLog(@"Please enter text");
        }
    }else{
    
        self.view.backgroundColor = [UIColor redColor];
    }
    

}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{


    if (textField.tag==1) {
        textField.backgroundColor = [UIColor greenColor];
    }else if(textField.tag == 2){
    textField.backgroundColor = [UIColor blueColor];
    }
    
    return YES;
}        // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField{

}           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{

    return YES;
}          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField{
   textField.backgroundColor = [UIColor redColor];
}             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

    if (textField.tag==1) {
        
        if (textField.text.length>9) {
            return NO;
        }
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
        
    }else if (textField.tag == 2){
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS1] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    
    return YES;
}   // return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField{

    return YES;
}              // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//    [textField resignFirstResponder];
//    [userFld resignFirstResponder];
//    [self.passFld resignFirstResponder];
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
