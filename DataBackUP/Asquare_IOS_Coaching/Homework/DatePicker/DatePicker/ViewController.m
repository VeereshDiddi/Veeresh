//
//  ViewController.m
//  DatePicker
//
//  Created by MacBook Pro on 14/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBtnClicked:)];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancelBtnClicked:)];
    toolBar.items = @[doneBtn, cancelBtn];
    
    NSDate *currentDate = [NSDate date];
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 260)];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    self.datePicker.date = currentDate;
    [self.datePicker addTarget:self action:@selector(selectedDate:) forControlEvents:UIControlEventValueChanged];
    self.dateTextField.inputView = self.datePicker;
    self.dateTextField.inputAccessoryView = toolBar;
    }
- (void)doneBtnClicked:(UIBarButtonItem*)barBtn
{
    NSDate *selectedDate = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    //date to String conversion
    [dateFormatter setDateFormat:@"EEEE dd-mm-yyyy hh:mm:ss a"];
    NSString *dateStr = [dateFormatter stringFromDate:selectedDate];
//    self.dateTextField.text = dateStr;
    //String to date Conversion
    NSDate *curDate = [dateFormatter dateFromString:dateStr];
    [dateFormatter setDateFormat:@"dd-mm-yyyy"];
    self.dateTextField.text = [dateFormatter stringFromDate:curDate];
    [self.dateTextField resignFirstResponder];
}
- (void)cancelBtnClicked:(UIBarButtonItem*)barBtn
{
    [self.dateTextField resignFirstResponder];
}

- (void)selectedDate:(UIDatePicker*)picker
{
//    NSDate *selectedDate = [picker date];
//    self.dateTextField.text = [NSString stringWithFormat:@"%@", selectedDate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
