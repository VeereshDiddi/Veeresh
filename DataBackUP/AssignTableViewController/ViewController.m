//
//  ViewController.m
//  AssignTableViewController
//
//  Created by MacBook Pro on 27/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@implementation ViewController
@synthesize NameTextField,PlayerRoleTextField,strName,strPlayerRole;

- (IBAction)SubmitViewController:(id)sender
{
    strName = NameTextField.text;
    strPlayerRole = PlayerRoleTextField.text;
}
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"SubmitViewController"])
    {
        TableViewController *tvc = [segue destinationViewController];
        tvc.Names = @[strName];
        tvc.PlayersRole = @[strPlayerRole];
        
    }
}

   
   
@end
