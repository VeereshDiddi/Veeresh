//
//  VideoPlayer.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>


#import <MobileCoreServices/MobileCoreServices.h>
#import  <CoreLocation/CoreLocation.h>
#import <MediaPlayer/MediaPlayer.h>
#import <SystemConfiguration/SystemConfiguration.h>

#import "include/OCAPI.h"
#import "AppDelegate.h"
#import "Reachability.h"
#import "include/OCAPI.h"
//#import "SimplePingHelper.h"

typedef enum
{
    Live,
    Vod,
    Not_Available
} StreamTypes;

@interface VideoPlayer : UIViewController<CLLocationManagerDelegate>
{
    BOOL network;
    float countdownSeconds;
    NSDate *startDate;
    CLLocationManager *locationManager;
    CLLocation *currentLocation;
    UIImageView *imgview;
    
    int num;
    BOOL isDone;
    
    
}

@property NSString *streamUrl;

@property NSString *webpageUrl;

// Create a object of MPMoviePlayerController
@property (strong, nonatomic) MPMoviePlayerController *mediaPlayer;
@property UIView *launcherView;
@property UILabel *timerLabel;

@property (nonatomic) SeekType seekType;

@property (nonatomic) StreamTypes streamType;

//@property (strong, nonatomic) OCOctoshapeSystem *octoshapeSystem;
@property (strong, nonatomic) OCStreamPlayer *streamPlayer;

@property UIActivityIndicatorView *activityIndicator;

@end
