//
//  FirstViewController.m
//  TableViewPractice
//
//  Created by MacBook Pro on 22/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end
//firstView
@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataLabel.text = [NSString stringWithFormat:@"%ld", self.row];
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

- (IBAction)submitButtonClicked:(id)sender {
    self.nameArr = self.dataTextField.text;
}
@end
