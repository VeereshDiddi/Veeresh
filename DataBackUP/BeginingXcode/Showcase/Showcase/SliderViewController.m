//
//  SliderViewController.m
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "SliderViewController.h"

@interface SliderViewController ()
{
    CGFloat redColor;
    CGFloat greenColor;
    CGFloat blueColor;
}

@end

@implementation SliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    redColor = 1;
    greenColor = 1;
    blueColor = 1;
    
    self.redValue.delegate = self;
    self.greenValue.delegate = self;
    self.blueValue.delegate = self;
    
    [self updateColor];
}

- (void)updateColor
{
    [self.view setBackgroundColor:[UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:1.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeRed:(id)sender {
    redColor  = self.redSlider.value;
    [self.redValue setText:[NSString stringWithFormat:@"%.0f", (redColor*255.0)]];
    [self updateColor];
}

- (IBAction)changeGreen:(id)sender {
    greenColor = self.greenSlider.value;
    [self.greenValue setText:[NSString stringWithFormat:@"%0.f", (greenColor*255.0)]];
    [self updateColor];
}

- (IBAction)changeBlue:(id)sender {
    blueColor = self.blueSlider.value;
    [self.blueValue setText:[NSString stringWithFormat:@"%0.f", (blueColor*255.0)]];
    [self updateColor];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
