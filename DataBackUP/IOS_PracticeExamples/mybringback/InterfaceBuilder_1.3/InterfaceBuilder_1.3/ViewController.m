//
//  ViewController.m
//  InterfaceBuilder_1.3
//
//  Created by MacBook Pro on 13/04/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    float x = ([valueOne.text floatValue]);
    float c = x + ([valueTwo.text floatValue]);
    total.text = [[NSString alloc] initWithFormat:@"%.2f",c];
}

- (IBAction)clear:(id)sender {
    valueOne.text = @"";
    valueTwo.text = @"";
    total.text = @"";
}
@synthesize alertText;

- (IBAction)btnClicked:(id)sender {
    NSString *str = [[NSString alloc] initWithFormat:@"Alert, %@" ,alertText.text];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Alert!" message:str delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles:@"Send to Facebook", @"Send to Twitter", nil ];
    [alert show];
    
}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog([NSString stringWithFormat:@"%d",buttonIndex]);
}
@end
