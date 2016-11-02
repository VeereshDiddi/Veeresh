//
//  ViewController.h
//  SegmentControl
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//@property (weak, nonatomic) IBOutlet UILabel *dataLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSMutableArray *imageArray;
@property (strong, nonatomic) NSMutableArray *labelArray;


- (IBAction)LabelOnOFfSwitchAction:(id)sender;

- (IBAction)segmentValueChanged:(id)sender;

- (IBAction)sliderAction:(id)sender;



@property (weak, nonatomic) IBOutlet UISwitch *switchVariable;

@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;

@property (weak, nonatomic) IBOutlet UILabel *labelValue;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;


@end

