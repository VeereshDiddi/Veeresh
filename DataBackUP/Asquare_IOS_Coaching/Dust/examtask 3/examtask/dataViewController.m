//
//  dataViewController.m
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import "dataViewController.h"
#import "shared.h"
@interface dataViewController ()

@end

@implementation dataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataarry =[[NSMutableArray alloc]init];
    statearray=[NSArray arrayWithObjects:@"andhraPradesh",@"telangana", nil];
    cityarray=[NSArray arrayWithObjects:@"guntur",@"vijayawada", nil];
    cityarray1=[NSArray arrayWithObjects:@"hyderabad",@"rangareddy", nil];
    emparray=[NSArray arrayWithObjects:@"temp",@"permanent", nil];
    [self.pickerview setHidden:YES];
    pickerarray=[[NSMutableArray alloc]init];
    
    // Do any additional setup after loading the view.
}
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag==2)
    {
        [self.pickerview setHidden:NO];
        [pickerarray removeAllObjects];
        [pickerarray addObjectsFromArray:statearray];
        [self.pickerview reloadAllComponents];
        selectedPickerType = 2;
    }
    else if (textField.tag==3)
    {
        if ([self.statetf.text isEqual:@"andhraPradesh"])
        {
            [pickerarray removeAllObjects];
            [pickerarray addObjectsFromArray:cityarray];
            [self.pickerview reloadAllComponents];
            selectedPickerType = 3;

        }
        else if([self.statetf.text isEqualToString:@"telangana"])
        {
            [pickerarray removeAllObjects];
            [pickerarray addObjectsFromArray:cityarray1];
            [self.pickerview reloadAllComponents];
            selectedPickerType = 3;

        }
    }
    else if (textField.tag==4)
    {
        [pickerarray removeAllObjects];
        [pickerarray addObjectsFromArray:emparray];
        [self.pickerview reloadAllComponents];
        selectedPickerType = 4;

    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (textField.tag == 0) {
        return  YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return pickerarray.count;
}
- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [pickerarray objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (selectedPickerType == 2)
    {
        self.statetf.text=[pickerarray objectAtIndex:row];

    }
    else if (selectedPickerType == 3)
    {
      self.citytf.text=[pickerarray objectAtIndex:row];
    }
    else
    {
      self.emptypetf.text=[pickerarray objectAtIndex:row];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)buttonclicked:(id)sender
{
    
    NSDictionary *dic=[NSDictionary dictionaryWithObjectsAndKeys:self.nametext.text,@"name",self.statetf.text,@"state",self.citytf.text,@"city",self.emptypetf.text,@"emp", nil];
    [dataarry addObject:dic];
    shared *sharedobj=[shared sharedClass];
    [sharedobj.receivearray addObject:dic];
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
