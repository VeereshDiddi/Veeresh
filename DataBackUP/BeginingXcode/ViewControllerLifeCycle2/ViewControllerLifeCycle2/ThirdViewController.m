//
//  ThirdViewController.m
//  ViewControllerLifeCycle2
//
//  Created by MacBook Pro on 16/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Third viewDidLoad");

}
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"Third viewWillAppear");
    
}
- (void)viewDidAppear:(BOOL)animated
{
    NSLog(@"Third viewDidAppear");
    
}
- (void)viewWillDisappear:(BOOL)animated
{
    NSLog(@"Third viewWillDisappear");
    
}
- (void)viewDidDisappear:(BOOL)animated
{
    NSLog(@"Third viewDidDisappear");
    
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

@end
