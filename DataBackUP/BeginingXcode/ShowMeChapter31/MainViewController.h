//
//  MainViewController.h
//  ShowMeChapter31
//
//  Created by MacBook Pro on 09/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *textToSendField;
- (IBAction)showMe:(id)sender;

@end
