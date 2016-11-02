//
//  ViewController.m
//  CustomizingKeyboard4
//
//  Created by MacBook Pro on 15/04/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize phoneNumber;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)screentouch:(id)sender {
    [phoneNumber resignFirstResponder];
   
}
@end
