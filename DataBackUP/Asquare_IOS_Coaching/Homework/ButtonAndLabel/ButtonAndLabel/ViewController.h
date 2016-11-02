//
//  ViewController.h
//  ButtonAndLabel
//
//  Created by MacBook Pro on 20/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UIButton *colorButton1;
@property (weak, nonatomic) IBOutlet UIButton *colorButton2;



- (IBAction)backgroundColorButton1:(id)sender;
- (IBAction)backgroundColorButton2:(id)sender;

@end

