//
//  ActionViewController.m
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ActionViewController.h"

@interface ActionViewController ()

@end

@implementation ActionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.actionButton.backgroundColor = [UIColor colorWithRed:9/255.0 green:95/255.0 blue:134/255.0 alpha:1.0];
    [self.actionButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.actionButton.layer.cornerRadius = 4.0f;
//    self.locationText.layer.cornerRadius = 5.0f;

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

- (IBAction)performAction:(id)sender {
    
}
@end
