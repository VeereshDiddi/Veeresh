//
//  MessageViewController.h
//  ShowMeChapter31
//
//  Created by MacBook Pro on 09/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MessageViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;
@property (weak, nonatomic) NSString *messageData;

-(id)initWithMessage:(NSString *)messageDaata;
@end
