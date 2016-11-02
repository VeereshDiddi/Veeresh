//
//  FirstViewController.h
//  NSNotificationCenterDemo
//
//  Created by AsquareMobileTechnologies on 6/22/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
- (IBAction)saveBtnClicked:(id)sender;
@property(nonatomic,assign) NSInteger row;
@property(nonatomic,strong)NSMutableDictionary *dic;
@end
