//
//  ViewController.h
//  PhoneSMSEmailDemo
//
//  Created by AsquareMobileTechnologies on 6/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface ViewController : UIViewController<UINavigationControllerDelegate,MFMessageComposeViewControllerDelegate,MFMailComposeViewControllerDelegate>
- (IBAction)callBtnClicked:(id)sender;
- (IBAction)smsBtnClicked:(id)sender;
- (IBAction)emailBtnClicked:(id)sender;


@end

