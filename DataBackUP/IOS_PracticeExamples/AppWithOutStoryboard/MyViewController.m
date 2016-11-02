//
//  MyViewController.m
//  AppWithOutStoryboard
//
//  Created by MacBook Pro on 22/04/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad
{
    
}

- (void)loadView
{
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 40, 100, 40)];
    label.text = @"Hello";
    
    [self.view addSubview:label];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 100, 40)];
    [btn setTitle:@"Click Me" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor blueColor]];
    
    [self.view addSubview:btn];
    
}


@end
