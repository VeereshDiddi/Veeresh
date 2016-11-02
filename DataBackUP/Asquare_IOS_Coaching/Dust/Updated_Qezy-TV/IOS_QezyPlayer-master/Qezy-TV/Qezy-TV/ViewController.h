//
//  ViewController.h
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property NSTimer *timer;
@property NSMutableDictionary *webParameters;
@property NSString *iosVersion;
@property NSString *ipAddress;

@property (retain, nonatomic) NSMutableData *sendData;
@property (retain, nonatomic) NSURLConnection *connection;

@end

