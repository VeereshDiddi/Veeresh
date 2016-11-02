//
//  ViewController.m
//  VideoPlayDemo
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPlayClick:(id)sender {
    
//    NSURL *url = [NSURL URLWithString:@"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"];
    NSURL *url = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];

    self.videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:self.videoPlayer];
    
    self.videoPlayer.controlStyle = MPMovieControlStyleDefault;
    
    self.videoPlayer.shouldAutoplay = YES;
    
    [self.view addSubview:self.videoPlayer.view];
    
    [self.videoPlayer setFullscreen:YES animated:YES];
    
/*    NSURL *aVideoUrl = [NSURL URLWithString:@"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"];
    
    // Initialize the movie player view controller with a video URL string
    MPMoviePlayerViewController *playerVC = [[[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL URLWithString:aVideoUrl]] autorelease];
    
    // Remove the movie player view controller from the "playback did finish" notification observers
    [[NSNotificationCenter defaultCenter] removeObserver:playerVC
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:playerVC.moviePlayer];
    
    // Register this class as an observer instead
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(movieFinishedCallback:)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification
                                               object:playerVC.moviePlayer];
    
    // Set the modal transition style of your choice
    playerVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    // Present the movie player view controller
    [self presentModalViewController:playerVC animated:YES];
    
    // Start playback
    [playerVC.moviePlayer prepareToPlay];
    [playerVC.moviePlayer play];   */
    
    
    
}


- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    MPMoviePlayerController *videoplayer = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:videoplayer];
    
    if ([videoplayer respondsToSelector:@selector(setFullscreen:animated:)]) {
        [videoplayer.view removeFromSuperview];
    }
}

// Returns a thumbnail at the given time.
// Deprecated.  Use -requestThumbnailImagesAtTimes:timeOption: / MPMoviePlayerThumbnailImageRequestDidFinishNotification instead.
- (UIImage *)thumbnailImageAtTime:(NSTimeInterval)playbackTime timeOption:(MPMovieTimeOption)option NS_DEPRECATED_IOS(3_2, 7_0)
{
    UIImage *thumbnail = [_videoPlayer thumbnailImageAtTime:1.0 timeOption:MPMovieTimeOptionNearestKeyFrame];
    return thumbnail;
   
}

// Asynchronously request thumbnails for one or more times, provided as an array of NSNumbers (double).
// Posts MPMoviePlayerThumbnailImageRequestDidFinishNotification on completion.
- (void)requestThumbnailImagesAtTimes:(NSArray *)playbackTimes timeOption:(MPMovieTimeOption)option NS_DEPRECATED_IOS(3_2, 9_0)
{
    [self.videoPlayer requestThumbnailImagesAtTimes:@[@14.f] timeOption:MPMovieTimeOptionNearestKeyFrame];
}


// Cancels all pending asynchronous thumbnail requests.
- (void)cancelAllThumbnailImageRequests NS_DEPRECATED_IOS(3_2, 9_0)
{
    
}






/*
- (void)movieFinishedCallback:(NSNotification*)aNotification
{
    // Obtain the reason why the movie playback finished
    NSNumber *finishReason = [[aNotification userInfo] objectForKey:MPMoviePlayerPlaybackDidFinishReasonUserInfoKey];
    
    // Dismiss the view controller ONLY when the reason is not "playback ended"
    if ([finishReason intValue] != MPMovieFinishReasonPlaybackEnded)
    {
        MPMoviePlayerController *moviePlayer = [aNotification object];
        
        // Remove this class from the observers
        [[NSNotificationCenter defaultCenter] removeObserver:self
                                                        name:MPMoviePlayerPlaybackDidFinishNotification
                                                      object:moviePlayer];
        
        // Dismiss the view controller
        [self dismissModalViewControllerAnimated:YES];
    }

}   */




    @end

