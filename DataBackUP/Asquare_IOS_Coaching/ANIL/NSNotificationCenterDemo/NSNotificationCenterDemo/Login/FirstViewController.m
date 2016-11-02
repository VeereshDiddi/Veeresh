//
//  FirstViewController.m
//  NSNotificationCenterDemo
//
//  Created by AsquareMobileTechnologies on 6/22/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self.row == -1) {
        self.title = @"Add Record";
    }else{
     self.title = @"Update Record";
     self.nameTF.text =[self.dic objectForKey:@"name"];
        self.emailTF.text =[self.dic objectForKey:@"email"];
        self.mobileTF.text =[self.dic objectForKey:@"mobile"];
    }
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

- (IBAction)saveBtnClicked:(id)sender {
    
    self.dic = [[NSMutableDictionary alloc]initWithCapacity:0];
    [self.dic setObject:self.nameTF.text forKey:@"name"];
    [self.dic setObject:self.emailTF.text forKey:@"email"];
    [self.dic setObject:self.mobileTF.text forKey:@"mobile"];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"updateNotification" object:self.dic];
    [self.navigationController popViewControllerAnimated:YES];
}
@end
