//
//  ViewController.h
//  Metro-TV
//
//  Created by IDEABYTES on 6/11/15.
//  Copyright (c) 2015 IDEABYTES. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "include/OCAPI.h"
#import "AppDelegate.h"
#import <MobileCoreServices/MobileCoreServices.h>
#import  <CoreLocation/CoreLocation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "include/OCAPI.h"
typedef enum
{
    Live,
    Vod,
    Not_Available
} StreamTypes;
@class Reachability;
@interface ViewController : UIViewController<CLLocationManagerDelegate>

{
    BOOL network;
    float countdownSeconds;
    NSDate *startDate;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    UIImageView *imgview;
    Reachability *internetReachable;
    Reachability *hostReachable;
    int num;
}
@property (strong, nonatomic) MPMoviePlayerController *mediaPlayer;
@property UIView *launcherView;
@property UILabel *timerLabel;

@property (nonatomic) SeekType seekType;

@property (nonatomic) StreamTypes streamType;

@property (strong, nonatomic) OCOctoshapeSystem *octoshapeSystem;
@property (strong, nonatomic) OCStreamPlayer *streamPlayer;

@property UIActivityIndicatorView *activityIndicator;

@property NSString *streamUrl;

@end

