//
//  ModificationsViewController.m
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import "ModificationsViewController.h"

@interface ModificationsViewController ()

@end

@implementation ModificationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableDictionary *dic=[self.viewObjOfMVC.detailsArray objectAtIndex:self.viewObjOfMVC.selectedRow];

    self.nameLbl.text=[dic valueForKey:@"name"];
//    self.stateLbl.text=[dic valueForKey:@"state"];
//    self.cityLbl.text=[dic valueForKey:@"city"];
//    self.employeeTypeLbl.text=[dic valueForKey:@"emp"];
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

- (IBAction)deleteBtnClicked:(id)sender {
  //  self.viewObjOfMVC.tableView.
}
@end
