//
//  ViewController.m
//  AssignSwitch
//
//  Created by MacBook Pro on 21/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize onOffSwitch;
@synthesize label;
@synthesize imageView;
@synthesize textField;
@synthesize imageButton;
@synthesize label2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SwitchMethod:(id)sender {
    if (onOffSwitch.on) {
        [self.label setText:@"ON"];
        [imageView setHidden:NO];
        [imageButton setHidden:NO];
        
    }
    else
    {
        [self.label setText:@"OFF"];
        [imageView setHidden:YES];
        [imageButton setHidden:YES];
    }
}
- (IBAction)SubmitMethod:(id)sender {
    self.label2.text = textField.text;
}
@end
