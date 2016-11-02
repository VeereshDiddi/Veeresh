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
    self.firstNameLabel.text = self.firstLabel;
    self.lastNameLabel.text = self.lastLabel;
    self.imageView.image = self.image;
    if (self.count1 >3) {
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(150, 300, 150, 30)];
        lbl.backgroundColor = [UIColor redColor];
        lbl.text = [NSString stringWithFormat:@"%lu", (unsigned long)self.count1];
        [self.view addSubview:lbl];
    }
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
/*
- (IBAction)addSubmitAction:(id)sender {
    self.nameLabel = self.firstNameLabel.text;
    self.addressLabel = self.firstAddressLabel.text;
    self.phoneLabel = self.firstPhoneLabel.text;
    self.image = self.imageView.image;
    [self.nameArray insertObject:self.nameLabel atIndex:[self.nameArray count]];
    [self.addressArray insertObject:self.addressLabel atIndex:[self.addressArray count]];
    [self.phoneNumberArray insertObject:self.phoneLabel atIndex:[self.phoneNumberArray count]];
    [self.imageArray insertObject:self.image atIndex:[self.imageArray count]];
}    */    
 @end
