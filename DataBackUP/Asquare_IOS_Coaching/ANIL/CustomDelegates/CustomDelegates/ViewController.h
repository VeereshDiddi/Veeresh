//
//  ViewController.h
//  CustomDelegates
//
//  Created by AsquareMobileTechnologies on 6/23/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "CustomDelegate.h"

@interface ViewController : UIViewController<DataDelegate>
- (IBAction)nextBtnClicked:(id)sender;

@end
