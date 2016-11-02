//
//  ViewController.m
//  ButtonAndLabel
//
//  Created by MacBook Pro on 20/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize colorLabel, colorButton1,colorButton2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundColorButton1:(id)sender {
    colorButton1.backgroundColor = [UIColor redColor];
//    self.view.backgroundColor = [UIColor redColor];
        colorLabel.text = @"Red";
    colorLabel.textColor = [UIColor greenColor];
    colorButton2.backgroundColor = [UIColor whiteColor];

}

- (IBAction)backgroundColorButton2:(id)sender {
    colorButton2.backgroundColor = [UIColor greenColor];
//    self.view.backgroundColor = [UIColor whiteColor];
    colorButton1.backgroundColor = [UIColor whiteColor];
    colorLabel.text = @"Green";
    colorLabel.textColor = [UIColor redColor];
    
}
@end
