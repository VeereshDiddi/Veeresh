//
//  dataViewController.h
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dataViewController : UIViewController
{
    NSMutableArray *dataarry;
    NSMutableArray *pickerarray;
    NSArray *statearray;
    NSArray *cityarray;
     NSArray *cityarray1;
    NSArray *emparray;
    NSInteger selectedPickerType;
}
@property (weak, nonatomic) IBOutlet UITextField *nametext;
@property (weak, nonatomic) IBOutlet UITextField *statetf;
@property (weak, nonatomic) IBOutlet UITextField *citytf;
@property (weak, nonatomic) IBOutlet UITextField *emptypetf;
@property (weak, nonatomic) IBOutlet UIButton *subbtn;
- (IBAction)buttonclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerview;

@end
