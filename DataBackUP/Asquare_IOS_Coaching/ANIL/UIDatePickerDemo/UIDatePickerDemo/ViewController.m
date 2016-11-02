//
//  ViewController.m
//  UIDatePickerDemo
//
//  Created by AsquareMobileTechnologies on 6/12/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneBtnClicked:)];
    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonSystemItemDone target:self action:@selector(cancelBtnClicked:)];

    toolBar.items=@[doneBtn,cancelBtn];
    
    NSDate *currentDate = [NSDate date];
    self.datePicker = [[UIDatePicker alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, 265)];
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    self.datePicker.date = currentDate;
    [self.datePicker addTarget:self action:@selector(datesSelected:) forControlEvents:UIControlEventValueChanged];
    self.dateTF.inputView=self.datePicker;
    self.dateTF.inputAccessoryView = toolBar;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)doneBtnClicked:(UIBarButtonItem*)barBtn{
    NSDate *selectedDate = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    /* date to string conversion */
    [dateFormatter setDateFormat:@"EEEE dd-MMMM-yyyy hh:mm:ss a"];
    NSString *dateStr = [dateFormatter stringFromDate:selectedDate];
    
    /* String to date Conversion */
    NSDate *curDate = [dateFormatter dateFromString:dateStr];
    [dateFormatter setDateFormat:@"dd-mm-yyyy"];
    self.dateTF.text = [dateFormatter stringFromDate:curDate];
   // self.dateTF.text = [NSString stringWithFormat:@"%@",curDate];
    [self.dateTF resignFirstResponder];
}
-(void)cancelBtnClicked:(UIBarButtonItem*)barBtn{
    [self.dateTF resignFirstResponder];
}
-(void)datesSelected:(UIDatePicker*)picker{
//    NSDate *selectedDate = [picker date];
//    self.dateTF.text = [NSString stringWithFormat:@"%@",selectedDate];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
