//
//  FirstViewController.h
//  UITableView
//
//  Created by MacBook Pro on 01/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface FirstViewController : ViewController

@property (strong, nonatomic) NSString *firstLabel;
@property (strong, nonatomic) NSString *lastLabel;
@property (strong, nonatomic) UIImage *image;
@property (nonatomic) NSUInteger count1;
@property (nonatomic) NSUInteger count2;
@property (nonatomic) NSUInteger count3;
@property (nonatomic) NSUInteger count4;




@property (strong, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;



@end
