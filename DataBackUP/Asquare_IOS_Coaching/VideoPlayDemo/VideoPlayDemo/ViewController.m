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
    
    NSURL *url = [NSURL URLWithString:@"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"];
//    NSURL *url = [NSURL URLWithString:@"http://0.s3.envato.com/h264-video-previews/80fad324-9db4-11e3-bf3d-0050569255a8/490527.mp4"];
//    NSURL *url = [NSURL URLWithString:@"http://techslides.com/demos/sample-videos/small.mp4"];
//    NSURL *url = [NSURL URLWithString:@"http://www.ebookfrenzy.com/ios_book/movie/movie.mov"];

    //Local Video
    
//  NSURL *url = [NSURL URLWithString:@"Users/macbookpro/Desktop/1920 London Trailer - [Webmusic.IN].mp4"];
//    NSString *test = @"/Users/macbookpro/Desktop/1920 London Trailer - [Webmusic.IN].mp4";
//    NSString *path = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"mp4"];
//    _videoPlayer = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:path]];
    
//    _videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:path];

    _videoPlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(moviePlayBackDidFinish:) name:MPMoviePlayerPlaybackDidFinishNotification object:_videoPlayer];
    
    _videoPlayer.controlStyle = MPMovieControlStyleDefault;
    
    _videoPlayer.shouldAutoplay = YES;
    
    [self.view addSubview:_videoPlayer.view];
    
    [_videoPlayer setFullscreen:YES animated:YES];
}

- (void) moviePlayBackDidFinish:(NSNotification*)notification
{
    MPMoviePlayerController *videoplayer = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:videoplayer];
    
    if ([videoplayer respondsToSelector:@selector(setFullscreen:animated:)]) {
        [videoplayer.view removeFromSuperview];
    }
}


@end
