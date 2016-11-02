//
//  ViewController.m
//  DataDemo
//
//  Created by MacBook Pro on 01/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataArr = [[NSMutableArray alloc] initWithCapacity:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonCilcked:(id)sender {
    NSString *nameStr = self.nameTF.text;
    NSString *mobileNoStr = self.mobileTF.text;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict setObject:nameStr forKey:@"name"];
    [dict setObject:mobileNoStr forKey:@"mobile"];
/*
    if ([nameStr length] == 0){
        [self showAlerMessage:@"Warning" andMessage:@"Please Enter Name"];
    }  */
    
    if ([[[sender titleLabel]text] isEqualToString:@"Update"]) {
        [self.dataArr replaceObjectAtIndex:selectedIndex withObject:dict];
        [self.saveButton setTitle:@"Save" forState:UIControlStateNormal];
    }
    else
    {
        [self.dataArr addObject:dict];
    }
    
    [self clearAllFields];
    [self performSegueWithIdentifier:@"detailsView" sender:self];
    
}
/*
- (void)showAlertMessage:(NSString *)title andMessage:(NSString *)mssg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message:mssg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
 */

- (void)clearAllFields
{
    self.nameTF.text = @"";
    self.mobileTF.text = @"";
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailsView"]) {
        DetailsViewController *detailsView = [segue destinationViewController];
        detailsView.viewObject = self;
        
    }
}

- (void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex
{
    selectedIndex = sIndex;
    self.nameTF.text = [dic objectForKey:@"name"];
    self.mobileTF.text = [dic objectForKey:@"mobile"];
    [self.saveButton setTitle:@"Update" forState:UIControlStateNormal];
}

- (IBAction)viewData:(id)sender {
    [self performSegueWithIdentifier:@"detailsView" sender:self];
}

@end
