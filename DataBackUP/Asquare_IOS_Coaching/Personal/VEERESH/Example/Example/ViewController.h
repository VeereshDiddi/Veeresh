//
//  ViewController.h
//  Example
//
//  Created by Asquare on 12/05/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>
@property(strong,nonatomic)

- (IBAction)getMyLocation:(id)sender;

@end

