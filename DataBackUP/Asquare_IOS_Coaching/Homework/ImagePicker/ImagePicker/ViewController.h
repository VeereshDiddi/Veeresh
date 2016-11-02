//
//  ViewController.h
//  ImagePicker
//
//  Created by MacBook Pro on 14/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraButtonClicked:(id)sender;
- (IBAction)galleryButtonClicked:(id)sender;

@end

