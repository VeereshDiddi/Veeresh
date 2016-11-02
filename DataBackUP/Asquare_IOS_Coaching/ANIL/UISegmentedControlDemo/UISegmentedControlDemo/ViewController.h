//
//  ViewController.h
//  UISegmentedControlDemo
//
//  Created by AsquareMobileTechnologies on 5/26/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

- (IBAction)segementValueChanged:(id)sender;

@end

