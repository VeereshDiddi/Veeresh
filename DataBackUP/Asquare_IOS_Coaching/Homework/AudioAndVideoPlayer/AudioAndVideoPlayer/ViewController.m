//
//  ViewController.m
//  AudioAndVideoPlayer
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

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

- (IBAction)playAudio:(id)sender {
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"https://www.youtube.com/watch?v=1M2gC86Q_9o" ofType:@"mp3"];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:NULL];
    [audioPlayer play];
}

- (IBAction)playVideo:(id)sender {
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"https://www.youtube.com/watch?v=cULVDmIDIzI" ofType:@"mp4"];
    moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:[NSURL fileURLWithPath:path]];
    [self presentModalViewController:moviePlayer animated:NO];
}
@end
