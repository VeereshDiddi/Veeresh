//
//  FirstViewController.m
//  NotificationCenter
//
//  Created by MacBook Pro on 24/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

- (IBAction)addButtonForLabel:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"createLabelNotification" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)addButtonForButton:(id)sender {
    
    [[NSNotificationCenter defaultCenter]postNotificationName:@"createButtonNotification" object:self];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
