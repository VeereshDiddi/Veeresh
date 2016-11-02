//
//  FirstViewController.h
//  UITableView
//
//  Created by MacBook Pro on 01/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface FirstViewController : ViewController

@property (strong, nonatomic) NSString *nameLabel;
@property (strong, nonatomic) NSString *addressLabel;
@property (strong, nonatomic) NSString *phoneLabel;
@property (strong, nonatomic) UIImage *image;



@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;

@property (strong, nonatomic) IBOutlet UILabel *firstAddressLabel;
@property (strong, nonatomic) IBOutlet UILabel *firstPhoneLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


- (IBAction)addSubmitAction:(id)sender;

@end
