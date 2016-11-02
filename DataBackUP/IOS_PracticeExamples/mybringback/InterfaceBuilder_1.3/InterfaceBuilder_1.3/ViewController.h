//
//  ViewController.h
//  InterfaceBuilder_1.3
//
//  Created by MacBook Pro on 13/04/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIAlertViewDelegate>
{
    IBOutlet UITextField *valueOne;
    IBOutlet UITextField *valueTwo;
    IBOutlet UILabel *total;
    IBOutlet UITextField *alertText;
}

- (IBAction)calculate:(id)sender;
- (IBAction)clear:(id)sender;
//- (IBAction) clear;
@property(nonatomic,retain) UITextField* alertText;
- (IBAction)btnClicked:(id)sender;

@end

