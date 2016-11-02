//
//  FirstViewController.m
//  CustomDelegates
//
//  Created by AsquareMobileTechnologies on 6/23/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomDelegate *customDelegateObj = [[CustomDelegate alloc]init];
    customDelegateObj.delegate = self;
    NSDictionary *dic =@{@"name":@"asquare",@"email":@"info@asquareit.com"};
    [customDelegateObj testMethod:dic];
    // Do any additional setup after loading the view.
}
-(void)doSomething:(NSString *)str andData:(NSArray *)dataArr{
    
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

@end
