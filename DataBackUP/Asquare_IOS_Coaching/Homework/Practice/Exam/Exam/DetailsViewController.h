//
//  DetailsViewController.h
//  Exam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface DetailsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextField *nameTF;
@property (strong, nonatomic) IBOutlet UITextField *stateTF;
@property (strong, nonatomic) IBOutlet UITextField *cityTF;
@property (strong, nonatomic) IBOutlet UITextField *empTF;
- (IBAction)submitButtonClicked:(id)sender;

//@property (strong, nonatomic) NSMutableArray *dataArr;
@property (strong, nonatomic)NSMutableDictionary *dict;
@property (strong, nonatomic)ViewController *viewObj;

@end
