//
//  FirstViewController.m
//  ViewControllerLifeCycle
//
//  Created by MacBook Pro on 16/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"First viewDidLoad");
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"First viewWillAppear");

}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"First viewDidAppear");

}
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"First viewWillDisappear");

}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"First viewDidDisappear");

}

@end
