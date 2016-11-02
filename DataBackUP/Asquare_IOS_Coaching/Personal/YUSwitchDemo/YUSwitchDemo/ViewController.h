//
//  ViewController.h
//  YUSwitchDemo
//
//  Created by AsquareMobileTechnologies on 5/26/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISwitch *switchObj;
- (IBAction)switchStateChanged:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet UISlider *slider;


@end

