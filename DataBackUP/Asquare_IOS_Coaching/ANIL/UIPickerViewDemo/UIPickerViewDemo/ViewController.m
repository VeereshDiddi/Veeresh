//
//  ViewController.m
//  UIPickerViewDemo
//
//  Created by AsquareMobileTechnologies on 6/11/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc]initWithObjects:@"Cricket",@"Foot Ball",@"Valley Ball",@"Hockey",@"Basket Ball",@"Ruggby", nil];

   
    self.picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 200, 320, 200)];
    self.picker.dataSource = self;
    self.picker.delegate = self;
    UIToolbar *toolBar= [[UIToolbar alloc] initWithFrame:CGRectMake(0,0,320,44)];
    [toolBar setBarStyle:UIBarStyleBlackOpaque];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                      style:UIBarButtonItemStyleBordered target:self action:@selector(addDataToTF:)];
    UIBarButtonItem *barButtonCancel = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                      style:UIBarButtonItemStyleBordered target:self action:@selector(cancelTF:)];
    toolBar.items = @[barButtonDone,barButtonCancel];
    barButtonDone.tintColor=[UIColor blackColor];
    toolBar.userInteractionEnabled = YES;
    self.nameTF.inputView = self.picker;
    self.nameTF.inputAccessoryView = toolBar;
    // Do any additional setup after loading the view, typically from a nib.
}
//- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
//    [self.view addSubview:self.picker];
//    return NO;
//}
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    
    return 2;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component ==0 )
        return [self.dataArray count];
    else
        return 4;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0)
        return [self.dataArray objectAtIndex:row];
    else
        return [NSString stringWithFormat:@"ROW:%ld",(long)row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
//    [self.picker removeFromSuperview];
    if (component == 0) {
        playerStr =[self.dataArray objectAtIndex:row];
    }else{
        dummyStr =[NSString stringWithFormat:@"ROW:%ld",(long)row];
    }
}
-(void)cancelTF:(id)sender{
    [self.nameTF resignFirstResponder];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addDataToTF:(id)sender{
    self.nameTF.text = [NSString stringWithFormat:@"%@ & %@",playerStr,dummyStr];
    [self.nameTF resignFirstResponder];
}

@end
