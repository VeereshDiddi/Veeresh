//
//  FirstViewController.h
//  NSUserDefaultsDemo
//
//  Created by AsquareMobileTechnologies on 6/14/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
- (IBAction)createBtnClicked:(id)sender;
- (IBAction)galleryBtnClicked:(id)sender;

@end
