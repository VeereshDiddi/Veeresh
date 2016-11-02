//
//  ViewController.m
//  NSUserDefaultsDemo
//
//  Created by AsquareMobileTechnologies on 6/14/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[NSUserDefaults standardUserDefaults]setObject:@"Asquare" forKey:@"name"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnCliked:(id)sender {
    [self performSegueWithIdentifier:@"firstView" sender:self];
}

- (IBAction)cancelBtnClicked:(id)sender {
}
@end
