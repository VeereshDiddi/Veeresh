//
//  ViewController.m
//  HelloWorldT1
//
//  Created by MacBook Pro on 27/04/16.
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

- (IBAction)showMessage:(id)sender {
    UIAlertView *helloWorldAlert = [[UIAlertView alloc] initWithTitle:@"My First App" message:@"Hello Veeresh" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [helloWorldAlert show];
}

@end
