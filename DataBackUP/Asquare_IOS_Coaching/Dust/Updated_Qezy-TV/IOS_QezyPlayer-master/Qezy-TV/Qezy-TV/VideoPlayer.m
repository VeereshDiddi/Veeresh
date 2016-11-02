//
//  VideoPlayer.m
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "VideoPlayer.h"
#import "ViewController.h"
#import "ChannelView.h"
#import "VarGlobal.h"
#import "Player.h"

@interface VideoPlayer(){
    
}

@end

@implementation VideoPlayer

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"VideoPlayer: enter viewDidLoad.....");
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(appplicationEnteredBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationEnteredForeground:)
                                                 name:UIApplicationWillEnterForegroundNotification
                                               object:nil];
}

- (void)appplicationEnteredBackground:(NSNotification *)notification {
    NSLog(@"VideoPlayer: Application Did Enter Background...");

    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    //exit app when app is in background
    exit(0);

}

- (void)applicationEnteredForeground:(NSNotification *)notification {
    NSLog(@"VideoPlayer: Application Entered Foreground");
    
    //if(self.mediaPlayer!=nil)
    //    [self.mediaPlayer play];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pingResult:(NSNumber*)success
{
    if (success.boolValue) {
        [self log:@"SUCCESS"];
        // NSLog(@"network available");
        
        [self octoshapeStreamCalled:self.streamUrl];
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
{
    NSLog(@"VideoPlayer: enter viewWillAppear: %d", player->isPlaying);
    
    if(player->isPlaying){
        num=0;
        countdownSeconds = 15;
    
        [SimplePingHelper ping:@"www.google.com" target:self sel:@selector(pingResult:)];
    }
    
    
}


-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"VideoPlayer: enter viewDidAppear: %d", player->isPlaying);
    
    //wait 2 seconds while current view is dismiss
    //[NSThread sleepForTimeInterval:2.0];

#ifdef CHANNEL_LIST
    if(!player->isPlaying)
    {
        NSLog(@"Back to Channel page");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
        ChannelView *controller = (ChannelView *)
        [storyboard instantiateViewControllerWithIdentifier:@"ChannelView"];
        
        [self presentViewController:controller animated:YES completion:nil];
    }
#endif
    
}

-(void)LaunchView
{
    NSLog(@"net work available");
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        // The device is an iPad running iOS 3.2 or later.
        NSLog(@"iPad runing ios 3.2 or later");
        
        //CGSize result1 = [[UIScreen mainScreen] bounds].size;
        //NSLog(@"ipad, device width: %f  height: %f", result1.width, result1.height);
        
        self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 1024, 768)];
        self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(360, 685, 400, 45)];
        self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_1024.png"]];
        self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:25];
        
        self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(440, 400, 100, 45)];
    }
    else
    {
        CGSize result = [[UIScreen mainScreen] bounds].size;
        NSLog(@"not ipad, device width: %f  height: %f", result.width, result.height);
        
        if((result.width == 480 && result.height == 320)  || (result.width == 320 && result.height == 480))
        {
            // @"IPhone 4 and 4s"
            NSLog(@"iPhone 4 and 4s");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,480, 320)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_480.png"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(130, 260, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2,self.view.frame.size.height/2, 100, 45)];
            
        }
        if( (result.width == 568 && result.height == 320)|| (result.width == 320 && result.height == 568) )
        {
            //  @"Iphone 5 and 5s";
            NSLog(@"iPhone 5.....");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,568, 320)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_568.png"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 270, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(240,160, 100, 45)];
        }
        if((result.width == 667 && result.height == 375) || (result.width == 375 && result.height == 667))
        {
            // @"IPhone 6 and 6s"
            NSLog(@"iPhone 6 and 4.7 inch");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,667,375)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_667.png"]];
            self.timerLabel=[[UILabel alloc]initWithFrame:CGRectMake(170, 325, 300, 45)];
            self.timerLabel.font = [UIFont fontWithName:@"Palatino" size:18];
            self.activityIndicator=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake((self.view.frame.size.width/2)-60,self.view.frame.size.height/2, 100, 45)];
            
        }
        if((result.width == 736 && result.height == 414) || (result.width == 414 && result.height == 736))
        {
            // @"IPhone 6+"
            NSLog(@"iPhone 6+ and 5.5 inch");
            
            self.launcherView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,736, 414)];
            self.launcherView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Launch_736.png"]];
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
    NSLog(@"enter octoshapeStreamCalled");
    //open octoshape log
    //[OCOctoStatic enableLogToConsole];
    
    if(octoshapeSystem == nil){
        NSLog(@"create octoshapeSystem");
    
        octoshapeSystem = [OCOctoStatic createOctoshapeSystem];
    
        [[NSNotificationCenter defaultCenter] addObserverForName:kOCProblemEvent object:octoshapeSystem queue:[NSOperationQueue mainQueue] usingBlock: ^(NSNotification *note)
         {
             OCProblemEvent *p = (OCProblemEvent *)[[note userInfo] objectForKey:kOCEventKey];
             if([p isNormal]) {
                 return;
             }
             NSLog(@"octoshapeSystem error message is %@",p.message);
         
             UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An Error Occurred in octoshapeSystem" message:p.message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
             [alert show];
         }];
    
        [octoshapeSystem addPlayerName:kOCMediaPlayerIosNative andVersion:[[UIDevice currentDevice] systemVersion] forKey:@"videoplayer"];
        [octoshapeSystem open];
    }else{
        NSLog(@"octoshapeSystem already run");
        //[self.octoshapeSystem resume];
    }
    
    //OCStreamPlayer *streamPlayer = [self.octoshapeSystem createStreamPlayer:octolink];
    self.streamPlayer = [octoshapeSystem createStreamPlayer:octolink];
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCUrlEvent
                                                      object:self.streamPlayer
                                                       queue:[NSOperationQueue mainQueue]
                                                  usingBlock:^(NSNotification *note) {
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserverForName:kOCProblemEvent object:self.streamPlayer queue:[NSOperationQueue mainQueue] usingBlock: ^(NSNotification *note)
                                                       {
                                                           OCProblemEvent *p = (OCProblemEvent *)[[note userInfo] objectForKey:kOCEventKey];
                                                           if([p isNormal]) {
                                                               return;
                                                           }
                                                           NSLog(@"streamPlayer error message is %@",p.message);
                                                           
                                                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"An Error Occurred in streamPlayer" message:p.message delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
                                                           [alert show];
                                                       }];
                                                      OCUrlEvent* event = (OCUrlEvent*)[[note userInfo] objectForKey:kOCEventKey];
                                                      
                                                      NSLog(@"streamPlayer hls link %@",event.url);
                                                      
                                                      // play with MPMoviePlayerController or MPMoviePlayerViewController.
                                                      self.mediaPlayer =[[MPMoviePlayerController alloc] init];
                                                      
                                                      [self.mediaPlayer stop];
                                                      self.mediaPlayer.movieSourceType=MPMovieSourceTypeStreaming;
                                                      
                                                      self.mediaPlayer.contentURL = [NSURL URLWithString: event.url];
                                                      self.mediaPlayer.view.frame =self.view.bounds;
                                                      [self.launcherView addSubview:self.mediaPlayer.view];
                                                      
                                                      [self.mediaPlayer setAllowsAirPlay:YES];
                                                      
                                                      [self.mediaPlayer setScalingMode:MPMovieScalingModeFill];
                                                      
                                                      [self.mediaPlayer setFullscreen:YES animated:YES];
                                                    
                                                      
                                                      [self.mediaPlayer prepareToPlay];
                                                      [self.mediaPlayer play];
                                                      
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willEnterFullscreen:) name:MPMoviePlayerWillEnterFullscreenNotification object:nil];
                                                      
                                                      [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(willExitFullscreen:) name:MPMoviePlayerWillExitFullscreenNotification object:nil];
                                                      
                                                  }];
    
    [self.streamPlayer initialize:YES];
   
    [self.streamPlayer play];
    
    NSLog(@"start to play stream: %@", octolink);
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCCurrentStreamInfoEvent
                                                      object:self.streamPlayer queue:[NSOperationQueue mainQueue]
                                                  usingBlock: ^(NSNotification *note)
     {
         OCCurrentStreamInfoEvent *csi = (OCCurrentStreamInfoEvent*)[[note userInfo] objectForKey:kOCEventKey];
         //NSLog(@"channel bit rate %lld kbps",csi.rateset/1000);
         
         NSNumber *bitrate=[NSNumber numberWithLongLong:csi.rateset / 1000];
         
         NSLog(@"orginal bitrate %@ kbps",bitrate);
         
         
         num++;
         
         if (csi.rateset/1000==0 && num==2)
         {
             UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Error in streamPlayer" message:@"Stream Not Available" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"Ok",nil];
             
             [alert show];
             
             [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification* notification){
                 [alert dismissWithClickedButtonIndex:0 animated:NO];
             }];
             
             alert.tag=5;
             alert.delegate=self;
             
             return;
         }
     }];
    
    [[NSNotificationCenter defaultCenter] addObserverForName:kOCSeekTypeInfoEvent object:self.streamPlayer queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note)
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
    
    NSLog(@"willExitFullscreen called");
    
    [self.mediaPlayer stop];
    
    [self.streamPlayer close];
    self.streamPlayer = nil;
    player->isPlaying = false;
    //[self.octoshapeSystem suspend];
    
    
    [self.mediaPlayer.view removeFromSuperview];
    
    
    player->isPresented = false;
    
    //if(![[self modalViewController] isBeingDismissed])
    //{
        [self dismissViewControllerAnimated:YES completion:Nil];
    //}
    
    
#ifndef CHANNEL_LIST
    
    //start a new task to open webpage before exit app
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        
        //[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.google.com"]];
        [[UIApplication sharedApplication] openURL: [NSURL URLWithString:self.webpageUrl]];
    });
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    //home button press programmatically
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    NSLog(@"VideoPlayer: exit app");
    //exit app when app is in background
    exit(0);
#endif
    
}

-(void)viewDidDisappear:(BOOL)animated {
    NSLog(@"VideoPlayer:viewDidDisappear() ...%d", player->isPlaying);
    
    /*
    if( ! isPlaying){
        NSLog(@"Back to Channel page");
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle:nil];
        ChannelView *controller = (ChannelView *)
        [storyboard instantiateViewControllerWithIdentifier:@"ChannelView"];
        
        UIViewController *top = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (top.presentedViewController) {
            top = top.presentedViewController;
        }
        [top presentViewController:controller animated:YES completion: nil];
        //[self presentViewController:controller animated:YES completion:nil];
    }
     */
}

- (void) resetControlPanelAndInvalidateChannel
{
    self.streamPlayer = nil;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"VideoPlayer: alertView");
    if (alertView.tag==5 & buttonIndex==0)
    {
        NSLog(@"enter if statement in alertView");
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
            
            [[UIApplication sharedApplication] openURL: [NSURL URLWithString:self.webpageUrl]];
        });
        
        
        [NSThread sleepForTimeInterval:2.0];
        
        //home button press programmatically
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:2.0];
        
        //exit app when app is in background
        exit(0);
    }
}


/*

- (void)playStream {
    //NSString * link = @"http://ideabytes-lh.akamaihd.net/i/ch_4@383828/master.m3u8";
    
    //NSString *filepath = [[NSBundle mainBundle] pathForResource:@"out1" ofType:@"mp4"];
    
    
    //NSURL *url    =   [NSURL fileURLWithPath:filepath];
    
    NSURL *url = [NSURL URLWithString: self.link];
    
    NSLog(@"PlaySteam: %@", self.link);
    
    
    // Initialize the MPMoviePlayerController object using url
    self.mediaPlayer =  [[MPMoviePlayerController alloc]
                         initWithContentURL:url];
    
    // Add a notification. (It will call a "moviePlayBackDidFinish" method when _videoPlayer finish or stops the plying video)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(moviePlayBackDidFinish:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:self.mediaPlayer];
    
    // Set control style to default
    self.mediaPlayer.controlStyle = MPMovieControlStyleDefault;
    
    // Set shouldAutoplay to YES
    self.mediaPlayer.shouldAutoplay = YES;
    
    // Add _videoPlayer's view as subview to current view.
    [self.view addSubview:self.mediaPlayer.view];
    
    [self.mediaPlayer setScalingMode:MPMovieScalingModeFill];
    // Set the screen to full.
    [self.mediaPlayer setFullscreen:YES animated:YES];
    
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    MPMoviePlayerController *videoplayer = [notification object];
    [[NSNotificationCenter defaultCenter]
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:videoplayer];
    
    if ([videoplayer
         respondsToSelector:@selector(setFullscreen:animated:)])
    {
        // remove the video player from superview.
        [videoplayer.view removeFromSuperview];
    }
}
*/
@end
