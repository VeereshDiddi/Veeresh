//
//  ViewController.m
//  UIAlertViewDemo
//
//  Created by AsquareMobileTechnologies on 5/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showAlert:@"Asquare" andMsg:@"Testing alert message"andTag:1];
   
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (alertView.tag == 1) {
        if (buttonIndex == 0) {
            
        }
    }
    NSLog(@"Button Index : %ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        NSLog(@"Asquare");
    }else if (buttonIndex ==1){
        UITextField *usernametf = [alertView textFieldAtIndex:0];
        UITextField *pwdtf = [alertView textFieldAtIndex:1];
        NSLog(@"Username Value :%@",usernametf.text);
         NSLog(@"Password Value :%@",pwdtf.text);
    }else{
        NSLog(@"Do Something");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClicked:(id)sender {
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"Success" message:@"Hi this is a test alert" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Submit",nil];
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    UITextField *tf = [alert textFieldAtIndex:0];
//    tf.placeholder = @"Enter Tex";
    [alert show];
}

- (IBAction)actionSheetBtnClicked:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"Test Sheet" delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:@"Test22",@"Cancel", nil];
    [actionSheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSLog(@"Button Index : %ld",(long)buttonIndex);
    if (buttonIndex == 0) {
        
    }
}
-(void)showAlert:(NSString*)ttl andMsg:(NSString*)msg andTag:(int)tagValue{
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:ttl message:msg delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK",nil];
    alert.tag = tagValue;
    [alert show];
}
@end
