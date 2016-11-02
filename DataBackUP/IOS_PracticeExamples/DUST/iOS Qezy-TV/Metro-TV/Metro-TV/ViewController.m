//
//  ViewController.m
//  Metro-TV
//
//  Created by IDEABYTES on 6/11/15.
//  Copyright (c) 2015 IDEABYTES. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
 
}
- (void)pingResult:(NSNumber*)success
{
    if (success.boolValue) {
        [self log:@"SUCCESS"];
       // NSLog(@"network available");
        
        [self octoshapeStreamCalled:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto"];
        [self LaunchView];
        
        self.timerLabel.backgroundColor=[UIColor clearColor];
        self.timerLabel.textColor=[UIColor blackColor];
        [self.launcherView addSubview:self.timerLabel];
        
        //............Activity Show..........
        
        self.activityIndicator.activityIndicatorViewStyle=UIActivityIndicatorViewStyleWhiteLarge;
        
        [self.view addSubview:self.activityIndicator];
        
        //............... Timer I plementation ........
        
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector     (countdownUpdateMethod:) userInfo:nil repeats:YES];
        startDate=[NSDate date];

    } else {
        [self log:@"FAILURE"];
       // NSLog(@"network not available");
        [self LaunchView];
        /// Create an alert if connection doesn't work
        UIAlertView *myAlert =  [[UIAlertView alloc]
                                 initWithTitle: NSLocalizedString(@"Network error", @"Network error")
                                 message: NSLocalizedString(@"No internet connection found, this application requires an internet connection to gather the data required.", @"Network error")
                                 delegate: self
                                 cancelButtonTitle: nil otherButtonTitles:NSLocalizedString(@"Close", @"Network error"), nil];
        [myAlert show];
        myAlert.tag=5;
    }
}
- (void)log:(NSString*)str {
    
    NSLog(@"network status: %@", str);
}

-(void)viewWillAppear:(BOOL)animated
{    num=0;
     countdownSeconds = 10;
    
    [SimplePingHelper ping:@"www.google.com" target:self sel:@selector(pingResult:)];

}
-(void)LaunchView
{
    
    
    CGSize result = [[UIScreen mainScreen] bounds].size;
    NSLog(@"not ipad, device width: %f ", result.width);
    NSLog(@"net work available");
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad running iOS 3.2 or later.
        self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768)];
        self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(360, 685, 400, 45)];
        self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_1024.png"]];
        self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:25];
        
        self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(440, 400, 100, 45)];
    }
    else
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        if(result.width == 480)
        {
            // @"IPhone 4 and 4s"
            NSLog(@"iPhone 4 and 4s");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,480, 320)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_480X320.png"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(130, 260, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2,self.view.frame.size.height/2, 100, 45)];
            
        }
        if(result.width == 568)
        {
            //  @"Iphone 5";
            NSLog(@"iPhone 5.....");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,568, 320)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_568X320.png"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 270, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(240,160, 100, 45)];
        }
        if(result.width == 667)
        {
            // @"IPhone 4 and 4s"
            NSLog(@"iPhone 6 and 4.7 inch");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,667,375)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_667x375"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 325, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2)-60,self.view.frame.size.height/2, 100, 45)];
            
        }
        if(result.width == 736)
        {
            // @"IPhone 4 and 4s"
            NSLog(@"iPhone 6+ and 5.5 inch");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,736, 414)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_736x414"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 367, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:16];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2-100,self.view.frame.size.height/2, 100, 45)];
            
        }
        // The device is an iPhone or iPod touch.
    }
    
    //......Launch View...............
    
    [self.view addSubview:self.launcherView];
}
//........timer target method....................

- (void)countdownUpdateMethod:(NSTimer*)theTimer
{
    NSDate *currentDate = [NSDate date];
    NSTimeInterval elaspedTime = [currentDate timeIntervalSinceDate:startDate];
    
    NSTimeInterval difference = countdownSeconds - elaspedTime;
    
    if (difference <= 0)
    {
        [theTimer invalidate];  // kill the timer
        // release the start time we don't need it anymore
        difference = 0;         // set to zero just in case iOS fired the timer late
        // play a sound asynchronously if you like
    }
    // update the label with the remainding seconds
    self.timerLabel.text = [NSString stringWithFormat:@"Please Wait %.0f secs....", difference];
    
    if (difference == 0)
    {
       // self.launcherView.hidden=YES;
        [self.activityIndicator startAnimating];
        [self.activityIndicator performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:15.0];
        self.timerLabel.text=@"";
    }
    //remove a second from the display
}
-(void)removeFromSuperview
{
    [self.activityIndicator stopAnimating];
    [self.activityIndicator removeFromSuperview];
}
-(void)octoshapeStreamCalled:(NSString *)octolink
{
    self.octoshapeSystem = [OCOctoStatic createOctoshapeSystem];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCProblemEvent object:self.octoshapeSystem queue:[NSOperationQueue mainQueue] usingBlock: ^(NSNotification *note)
     {
         OCProblemEvent *p = (OCProblemEvent *)[[note userInfo] objectForKey:kOCEventKey];
         if([p isNormal]) {
             return;
         }
         NSLog(@"error message is %@",p.message);
         
         UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An Error Occurred" message:p.message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
         [alert show];
     }];
    
    [self.octoshapeSystem addPlayerName:kOCMediaPlayerIosNative andVersion:[[UIDevice currentDevice] systemVersion] forKey:@"videoplayer"];
    [self.octoshapeSystem open];
    
    OCStreamPlayer *streamPlayer = [self.octoshapeSystem createStreamPlayer:octolink];
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCUrlEvent
                                                      object:streamPlayer
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                           
                                                      [[NSNotificationCenter defaultCenter] addObserverForName:kOCProblemEvent object:self.streamPlayer queue:[NSOperationQueue mainQueue] usingBlock: ^(NSNotification *note)
                                                       {
                                                           OCProblemEvent *p = (OCProblemEvent *)[[note userInfo] objectForKey:kOCEventKey];
                                                           if([p isNormal]) {
                                                               return;
                                                           }
                                                           NSLog(@"error message is %@",p.message);
                                                           
                                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An Error Occurred" message:p.message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                                                           [alert show];
                                                       }];
                                                      OCUrlEvent* event = (OCUrlEvent*)[[note userInfo] objectForKey:kOCEventKey];
                                                      // play with MPMoviePlayerController or MPMoviePlayerViewController.
                                                      self.mediaPlayer =[[MPMoviePlayerController alloc] init];
                                                      self.mediaPlayer.contentURL = [NSURL URLWithString: event.url];
                                                      self.mediaPlayer.view.frame =self.view.bounds;
                                                      [self.launcherView addSubview:self.mediaPlayer.view];
                                                      
                                                      self.mediaPlayer.movieSourceType=MPMovieSourceTypeStreaming;
                                                      
                                                      [self.mediaPlayer setAllowsAirPlay:YES];
                                                      [self.mediaPlayer setScalingMode:MPMovieScalingModeFill];
                                                      
                                                      [self.mediaPlayer setFullscreen:YES animated:YES];
                                                      
                                                      [self.mediaPlayer prepareToPlay];
                                                      [self.mediaPlayer play];
                                                      
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterFullscreen:) name:MPMoviePlayerWillEnterFullscreenNotification object:nil];
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitFullscreen:) name:MPMoviePlayerWillExitFullscreenNotification object:nil];
                                                      
                                                  }];
    
    [streamPlayer initialize:YES];
    [streamPlayer play];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCCurrentStreamInfoEvent
                                                      object:streamPlayer queue:[NSOperationQueue mainQueue]
                                                  usingBlock: ^(NSNotification *note)
     {
         OCCurrentStreamInfoEvent *csi = (OCCurrentStreamInfoEvent*)[[note userInfo] objectForKey:kOCEventKey];
         // NSLog(@"channel bit rate %lld kbps",csi.rateset/1000);
         
         NSNumber *bitrate=[NSNumber numberWithLongLong:csi.rateset / 1000];
         
         NSLog(@"orginal bitrate %@ kbps",bitrate);
        
         
         num++;
         
         if (csi.rateset/1000==0 && num==2)
         {
             UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error" message:@"Stream Not Available" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
             
             [alert show];
             
             alert.tag=5;
             alert.delegate=self;
             
             return;
         }
     }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCSeekTypeInfoEvent object:streamPlayer queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
     {
         OCSeekTypeInfoEvent *sti = (OCSeekTypeInfoEvent *)[[note userInfo] objectForKey:kOCEventKey];
         NSNumber *duration = [NSNumber numberWithLongLong:sti.duration];
         
         NSLog(@"duration is %@",duration);
         
         _streamType = sti.live ? Live : Vod;
         
         NSLog(@"stream type %u",sti.live ? Live : Vod);
         
         _seekType = sti.seekType;
         
         NSLog(@"seek type %u",sti.seekType);
         
     }];
    
}
- (void) playbackFinished:(NSNotification*) notification
{
    if(self.mediaPlayer.playbackState == MPMoviePlaybackStatePlaying)
    {
        [self.mediaPlayer pause];
    } else if(self.mediaPlayer.playbackState == MPMoviePlaybackStatePaused)
    {
        [self.mediaPlayer play];
    }
}
- (void)willEnterFullscreen: (NSNotification *) notify
{
    NSLog(@"Video view enters full screen");
    
    [self.mediaPlayer play];
    [self.streamPlayer play];
}
- (void) willExitFullscreen: (NSNotification *) notify
{
    [self.mediaPlayer stop];
    
    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    //exit app when app is in background
    exit(0);
    
}
- (void) resetControlPanelAndInvalidateChannel
{
    self.streamPlayer = nil;
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==5 &buttonIndex==0)
    {
        //home button press programmatically
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:2.0];
        
        //exit app when app is in background
        exit(0);
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

@end

