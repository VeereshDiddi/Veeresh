//
//  TrackViewController.h
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface TrackViewController : UIViewController<CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *locationText;
@property (weak, nonatomic) IBOutlet UISwitch *toggleSwitch;
- (IBAction)changeToggle:(id)sender;


@end

