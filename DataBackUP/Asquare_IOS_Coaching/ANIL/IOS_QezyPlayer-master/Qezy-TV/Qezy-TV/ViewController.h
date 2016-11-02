//
//  ViewController.h
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>
@import SafariServices;

@interface ViewController : UIViewController <SFSafariViewControllerDelegate>

@property NSTimer *timer;
@property NSMutableDictionary *webParameters;
@property NSString *iosVersion;
@property NSString *ipAddress;

@property SFSafariViewController *sfvc;

@property (retain, nonatomic) NSMutableData *sendData;
@property (retain, nonatomic) NSURLConnection *connection;

@end

