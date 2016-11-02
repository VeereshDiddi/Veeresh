//
//  ViewController.m
//  VideoPlayerDemo2
//
//  Created by MacBook Pro on 30/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
{
    MPMoviePlayerViewController *_player;
}

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
- (IBAction)playClicked:(id)sender {
    NSURL *videoStremURL = [NSURL URLWithString:@"http://qthttp.apple.com.edgesuite.net/1010qwoeiuryfg/sl.m3u8"];
    _player = [[MPMoviePlayerViewController alloc] initWithContentURL:videoStremURL];
    [self presentMoviePlayerViewControllerAnimated:_player];
}

@end
