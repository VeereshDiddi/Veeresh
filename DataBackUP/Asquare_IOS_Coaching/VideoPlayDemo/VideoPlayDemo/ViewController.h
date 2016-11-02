//
//  ViewController.h
//  VideoPlayDemo
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController

- (IBAction)btnPlayClick:(id)sender;

@property (strong, nonatomic) MPMoviePlayerController *videoPlayer;


@end

