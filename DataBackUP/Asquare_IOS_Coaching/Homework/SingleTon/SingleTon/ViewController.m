//
//  ViewController.m
//  SingleTon
//
//  Created by MacBook Pro on 19/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "ShareManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    ShareManager *shareObj = [ShareManager sharedManager];
    shareObj.nameStr = @"Veeresh";
    shareObj.dataArr = [[NSArray alloc] initWithObjects:@"1", @"2", @"3", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    ShareManager *shareObject = [ShareManager sharedManager];
    NSLog(@"Name :%@",shareObject.nameStr);
    NSLog(@"Array :%@", shareObject.dataArr);
}

- (IBAction)nextBtnClicked:(id)sender {
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
@end
