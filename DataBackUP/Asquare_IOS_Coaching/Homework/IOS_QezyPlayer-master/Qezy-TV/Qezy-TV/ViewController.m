//
//  ViewController.m
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ViewController.h"
#import "VideoPlayer.h"
#import "ChannelView.h"
#import "VarGlobal.h"
#import "Player.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"ViewController: enter viewDidLoad.....");
    //[self startPlayer];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appplicationIsActive:)
                                                 name:UIApplicationDidBecomeActiveNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationEnteredForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)viewWillAppear:(BOOL)animated
{
    [self startPlayer];
}   */



- (void)appplicationIsActive:(NSNotification *)notification {
    NSLog(@"ViewController: Application Did Become Active...");
    [self startPlayer];
}

- (void)applicationEnteredForeground:(NSNotification *)notification {
    NSLog(@"ViewController: Application Entered Foreground");
}


-(void) startTimer{
    
    [self setChannelInfo];
    self.timer = [NSTimer scheduledTimerWithTimeInterval: 30
                                             target: self
                                           selector: @selector(updateTimer)
                                           userInfo: nil
                                            repeats: YES];
    
}

-(void)updateTimer{
    NSLog(@"Timer Called");
    [self updateServerStatus];
}

-(void)setChannelInfo{
    NSLog(@"ViewController: setChannelInfo");
    
    //NSLog(@"URL query: %@", webInfo);
    
    if (webInfo.length > 0) {
        NSArray *components = [webInfo componentsSeparatedByString:@"&"];
        self.webParameters = [[NSMutableDictionary alloc] init];
        for (NSString *component in components) {
            NSArray *subcomponents = [component componentsSeparatedByString:@"="];
            [self.webParameters setObject:[[subcomponents objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]
                           forKey:[[subcomponents objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        }
        
        //NSLog(@"webParameters: %@", self.webParameters);
    }
    
    if(self.iosVersion == nil)
        self.iosVersion = [[NSString alloc] init];
    
    self.iosVersion = [[UIDevice currentDevice] systemVersion];
    
    NSLog(@"iosVersion %@", self.iosVersion);
    
    if(self.ipAddress == nil)
        self.ipAddress = [[NSString alloc] init];
    
    //get public IP address
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *theURL = [[NSURL alloc] initWithString:@"http://ip-api.com/line/?fields=query"];
        NSString *myIP = [[NSString alloc] initWithData:[NSData dataWithContentsOfURL:theURL] encoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            // Manipulate the ip on the main queue
            NSLog(@"IP: %@", myIP);
            self.ipAddress = myIP;
        });
    });
    

}

-(void)startPlayer{
    NSLog(@"ViewController: startPlayer....");
    
    Reachability *reachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [reachability currentReachabilityStatus];
    
    if(networkStatus != NotReachable){
        if (urlLink != nil){
       
            NSLog(@"From webpage, Play Channel %@",  urlLink);
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
            VideoPlayer *videoPlayer = (VideoPlayer *)
            [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
        
            player->isPlaying = true;
            player->isPresented = true;
            player->isFromWeb = true;
    
            videoPlayer.streamUrl = urlLink;
        
        
            [self startTimer];
            //[self dismissViewControllerAnimated:YES completion:Nil];
            //[self.navigationController pushViewController:player animated:YES];
            [self presentViewController:videoPlayer animated:YES completion:nil];
   
        
        }
        else{
            NSLog(@"Not calling from webpage");
        
        
            //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.qezyplay.com"]];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://ideabytestraining.com/demoqezyplay/"]];
        
        }
    }
    else{
        NSLog(@"ViewController: network not available");
    }
}

-(void) updateServerStatus
{
    NSLog(@"ViewController: updateServerStatus");
    NSLog(@"webParameters: %@ %@ %@", self.webParameters, self.iosVersion, self.ipAddress);
    
    
    //if there is a connection going on just cancel it.
    [self.connection cancel];
    
    
    //initialize url that is going to be fetched.
    NSURL *url = [NSURL URLWithString:@"http://ideabytestraining.com/demoqezyplay/mobile_detect/updatesessionbyapp.php?action=addanalytics"];
    
    //initialize a request from url
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[url standardizedURL]];
    
    //set http method
    [request setHTTPMethod:@"POST"];
    
    //initialize a post data
    NSString *postData = [NSString stringWithFormat:@"page_id=%@&page_title=%@&page_name=%@&user_id=%@&user_name=%@&page_referer=%@&browser_name=%@&browser_version=%@&session_id=%@&ip_address=%@&os_name=%@&os_version=%@&device=%@&play=%@",[self.webParameters objectForKey:@"page_id"], [self.webParameters objectForKey:@"post_title"], [self.webParameters objectForKey:@"post_name"], [self.webParameters objectForKey:@"user_id"], [self.webParameters objectForKey:@"user_name"], [self.webParameters objectForKey:@"page_referer"], [self.webParameters objectForKey:@"browser_name"], [self.webParameters objectForKey:@"browser_version"], [self.webParameters objectForKey:@"session_id"], self.ipAddress, @"IOS", self.iosVersion, @"mobile", @"1"];
    
    //set request content type we MUST set this value.
    [request setValue:@"application/x-www-form-urlencoded; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    //set post data of request
    [request setHTTPBody:[postData dataUsingEncoding:NSUTF8StringEncoding]];
    
    //initialize a connection from request
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    self.connection = connection;
    
    //start the connection
    [connection start];
    
    if(connection) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection could not be made");
    }

}

@end
