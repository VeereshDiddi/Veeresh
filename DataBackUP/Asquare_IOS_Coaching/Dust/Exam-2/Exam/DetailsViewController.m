//
//  DetailsViewController.m
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dic=[[NSMutableDictionary alloc]initWithCapacity:0];
    
    NSLog(@"View object is::VEereSh:: %@", self.viewObj);
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

- (IBAction)submitBtnClicked:(id)sender {
    NSString *nameStr=self.nameTf.text;
//    NSString *stateStr=self.stateTf.text;
//    NSString *cityStr=self.cityTf.text;
//
//    NSString *empStr=self.employeeTypeTf.text;

    [self.dic setValue:nameStr forKey:@"name"];
//    [self.dic setValue:stateStr forKey:@"state"];
//    [self.dic setValue:cityStr forKey:@"city"];
//    [self.dic setValue:empStr forKey:@"emp"];
    
    [self.viewObj.detailsArray addObject:self.dic];
    
     
    NSLog(@"detailsArray::%@", self.viewObj.detailsArray);
//    [self.navigationController popViewControllerAnimated:YES];
    [self.navigationController popToViewController:self.viewObj animated:YES];
    
}
@end
