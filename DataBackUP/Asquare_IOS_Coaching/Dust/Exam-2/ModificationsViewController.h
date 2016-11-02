//
//  ModificationsViewController.h
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ModificationsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *nameLbl;
@property (weak, nonatomic) IBOutlet UILabel *stateLbl;
@property (weak, nonatomic) IBOutlet UILabel *cityLbl;
@property (weak, nonatomic) IBOutlet UILabel *employeeTypeLbl;
- (IBAction)deleteBtnClicked:(id)sender;
@property(strong, nonatomic)ViewController *viewObjOfMVC;

@end
