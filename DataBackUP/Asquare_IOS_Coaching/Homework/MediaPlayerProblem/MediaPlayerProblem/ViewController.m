//
//  ViewController.m
//  MediaPlayerProblem
//
//  Created by MacBook Pro on 30/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize moviePlayer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.jplayer.org/video/m4v/Big_Buck_Bunny_Trailer.m4v"];
    moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL:url];
    [moviePlayer.view setFrame:CGRectMake(20, 100, 300, 150)];
    [self.view addSubview:moviePlayer.view];
    moviePlayer.fullscreen =YES;
    moviePlayer.allowsAirPlay = YES;
    moviePlayer.shouldAutoplay = YES;
    moviePlayer.controlStyle = MPMovieControlStyleDefault;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
