//
//  ViewController.h
//  MediaPlayer
//
//  Created by MacBook Pro on 26/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController : UIViewController<MPMediaPickerControllerDelegate>

{
     IBOutlet UIImageView *artworkImageView;
     IBOutlet UISlider *volumeSlider;
     IBOutlet UIButton *playPauseButton;
    
     IBOutlet UILabel *titleLabel;
     IBOutlet UILabel *artistLabel;
     IBOutlet UILabel *albumLabel;
    MPMusicPlayerController *musicPlayer;

}

@property (nonatomic, retain) MPMusicPlayerController *musicPlayer;



- (IBAction)volumeChanged:(id)sender;
- (IBAction)showMediaPicker:(id)sender;
- (IBAction)previousSong:(id)sender;
- (IBAction)playPause:(id)sender;
- (IBAction)nextSong:(id)sender;
- (void) registerMediaPlayerNotifications;


@end

