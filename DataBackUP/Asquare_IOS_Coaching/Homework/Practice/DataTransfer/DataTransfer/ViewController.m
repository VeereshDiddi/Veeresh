//
//  ViewController.m
//  DataTransfer
//
//  Created by MacBook Pro on 30/06/16.
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

- (IBAction)saveButtonClicked:(id)sender {
    
    NSString *nameStr = self.nameTF.text;
    NSString *mobileNoStr = self.mobileTF.text;
    NSString *mailStr = self.mailTF.text;
    NSString *passwordStr = self.passwordTF.text;
    
    if ([nameStr length] == 0) {
        [self showAlertMsg:@"Warning" andMsg:@"Please enter Name"];
    }
    else if ([mobileNoStr length] == 0)
    {
        [self showAlertMsg:@"Warning" andMsg:@"Please enter Mobile Number"];
    }
    else if ([mailStr length] == 0)
    {
        [self showAlertMsg:@"Warning" andMsg:@"Please enter eMail"];
    }
    else if ([passwordStr length] == 0)
    {
        [self showAlertMsg:@"Warning" andMsg:@"Please enter Password"];
    }
    else
    {
        NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
        [dict setObject:nameStr forKey:@"name"];
        [dict setObject:mobileNoStr forKey:@"mobile"];
        [dict setObject:mailStr forKey:@"email"];
        [dict setObject:passwordStr forKey:@"password"];
        
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
}

- (void)showAlertMsg:(NSString *)ttl andMsg:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:ttl message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void)clearAllFields
{
    self.nameTF.text = @"";
    self.mobileTF.text = @"";
    self.mailTF.text = @"";
    self.passwordTF.text = @"";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"detailsView"]) {
        DetailsViewController *detailsViewObj = [segue destinationViewController];
        detailsViewObj.viewObj = self;
    }
}

- (IBAction)viewData:(id)sender {
    
}

- (void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex
{
    
}

@end
