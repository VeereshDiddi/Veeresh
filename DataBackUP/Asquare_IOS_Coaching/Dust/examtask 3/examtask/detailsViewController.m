//
//  detailsViewController.m
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import "detailsViewController.h"
#import "ViewController.h"
#import "shared.h"
@interface detailsViewController ()

@end

@implementation detailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    NSLog(@"%@",self.detailsarray);
    
    self.detailsname.text=[self.detailsarray valueForKey:@"name"];
     self.detailscity.text=[self.detailsarray valueForKey:@"city"];
     self.detailsstate.text=[self.detailsarray valueForKey:@"state"];
     self.deatilsemp.text=[self.detailsarray valueForKey:@"emp"];
    

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deletebutton:(id)sender
{
    shared *sharedobj=[shared sharedClass];

    [sharedobj.receivearray removeObject:self.detailsarray];
    [self.navigationController popViewControllerAnimated:YES];
    
   }
@end
