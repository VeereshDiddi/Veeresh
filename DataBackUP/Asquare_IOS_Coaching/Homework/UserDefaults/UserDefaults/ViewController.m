//
//  ViewController.m
//  UserDefaults
//
//  Created by MacBook Pro on 15/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [[NSUserDefaults standardUserDefaults] setObject:@"Veeru" forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)doneButtonClicked:(id)sender {
    [self performSegueWithIdentifier:@"firstView" sender:self];
}

- (IBAction)cancelButtonClicked:(id)sender {
}
@end
