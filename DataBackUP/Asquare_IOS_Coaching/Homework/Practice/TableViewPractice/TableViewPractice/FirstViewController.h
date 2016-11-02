//
//  FirstViewController.h
//  TableViewPractice
//
//  Created by MacBook Pro on 22/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

@property (weak, nonatomic) IBOutlet UITextField *dataTextField;

- (IBAction)submitButtonClicked:(id)sender;

@property (assign, nonatomic)NSInteger row;
@property (strong, nonatomic) NSString *nameArr;

@end
