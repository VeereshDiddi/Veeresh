//
//  DetailsViewController.h
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *nameTf;
@property (weak, nonatomic) IBOutlet UITextField *stateTf;
@property (weak, nonatomic) IBOutlet UITextField *cityTf;
@property (weak, nonatomic) IBOutlet UITextField *employeeTypeTf;
- (IBAction)submitBtnClicked:(id)sender;
@property(strong, nonatomic)NSMutableDictionary *dic;
@property(strong, nonatomic)ViewController *viewObj;
@property(strong, nonatomic)NSMutableArray *arr;
@end
