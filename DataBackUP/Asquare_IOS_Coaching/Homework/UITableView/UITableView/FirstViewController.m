//
//  FirstViewController.m
//  UITableView
//
//  Created by MacBook Pro on 01/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.firstNameLabel.text = self.nameLabel;
    self.firstAddressLabel.text = self.addressLabel;
    self.firstPhoneLabel.text = self.phoneLabel;
    self.imageView.image = self.image;
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

- (IBAction)addSubmitAction:(id)sender {
    self.nameLabel = self.firstNameLabel.text;
    self.addressLabel = self.firstAddressLabel.text;
    self.phoneLabel = self.firstPhoneLabel.text;
    self.image = self.imageView.image;
    [self.nameArray insertObject:self.nameLabel atIndex:[self.nameArray count]];
    [self.addressArray insertObject:self.addressLabel atIndex:[self.addressArray count]];
    [self.phoneNumberArray insertObject:self.phoneLabel atIndex:[self.phoneNumberArray count]];
    [self.imageArray insertObject:self.image atIndex:[self.imageArray count]];
}
@end
