//
//  ActionViewController.h
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActionViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *actionControl;
@property (weak, nonatomic) IBOutlet UIButton *actionButton;

- (IBAction)performAction:(id)sender;

@end
