//
//  TrackViewController.m
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "TrackViewController.h"

@interface TrackViewController ()
{
    CLLocationManager *locationManager;
}

@end

@implementation TrackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeToggle:(id)sender {
    if (self.toggleSwitch.on) {
        if ([CLLocationManager locationServicesEnabled] == NO) {
            self.toggleSwitch.on = NO;
        }
        
        if (locationManager == nil) {
            locationManager = [[CLLocationManager alloc] init];
            locationManager.delegate = self;
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
            locationManager.distanceFilter = 10.0f;
        }
        [locationManager startUpdatingLocation];
    }
    else
    {
        if (locationManager != nil) {
            [locationManager stopUpdatingLocation];
        }
    }
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    self.locationText.text = location.description;
}
@end
