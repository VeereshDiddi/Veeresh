//
//  PlayVideoViewController.h
//  VideoPlay
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import <MobileCoreServices/UTCoreTypes.h>
#import <MediaPlayer/MediaPlayer.h>

@interface PlayVideoViewController : ViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

- (IBAction)playVideo:(id)sender;
- (BOOL)startMediaBrowserFromViewController:(UIViewController*)controller usingDelegate:(id)delegate;

@end
