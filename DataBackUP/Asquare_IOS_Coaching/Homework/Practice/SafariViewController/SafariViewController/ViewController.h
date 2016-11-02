//
//  ViewController.h
//  SafariViewController
//
//  Created by MacBook Pro on 22/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SafariServices/SafariServices.h>
@interface ViewController : UIViewController<SFSafariViewControllerDelegate>
- (IBAction)safariButtonClicked:(id)sender;


@end

