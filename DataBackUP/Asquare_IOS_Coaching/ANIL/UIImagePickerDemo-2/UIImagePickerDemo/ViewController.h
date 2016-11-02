//
//  ViewController.h
//  UIImagePickerDemo
//
//  Created by AsquareMobileTechnologies on 6/12/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgView;
- (IBAction)cameraBtnClicked:(id)sender;
- (IBAction)galleryBtnClicked:(id)sender;

@end

