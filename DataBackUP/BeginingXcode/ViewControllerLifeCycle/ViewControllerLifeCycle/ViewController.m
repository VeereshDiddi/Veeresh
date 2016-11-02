//
//  ViewController.m
//  ViewControllerLifeCycle
//
//  Created by MacBook Pro on 16/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"Home viewDidLoad");

}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Home viewWillAppear");
    
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Home viewDidAppear");
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Home viewWillDisappear");
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"Home viewDidDisappear");
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)firstButton:(id)sender {
    [self performSegueWithIdentifier:@"first" sender:nil];
}

- (IBAction)secondButton:(id)sender {
    [self performSegueWithIdentifier:@"second" sender:nil];
}

- (IBAction)thirdButton:(id)sender {
    [self performSegueWithIdentifier:@"third" sender:nil];
}
@end
