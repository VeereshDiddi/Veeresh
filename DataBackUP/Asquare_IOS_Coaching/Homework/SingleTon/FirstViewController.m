//
//  FirstViewController.m
//  SingleTon
//
//  Created by MacBook Pro on 19/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "FirstViewController.h"
#import "ShareManager.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *titleStr = [[ShareManager sharedManager] nameStr];
    NSArray *array = [[ShareManager sharedManager] dataArr];
    NSLog(@"FirsrViewController Title :%@", titleStr);
    NSLog(@"FirstViewController Array: %@", array);
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
