//
//  ViewController.m
//  CustomDelegates
//
//  Created by AsquareMobileTechnologies on 6/23/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CustomDelegate *customDelegateObj = [[CustomDelegate alloc]init];
    customDelegateObj.delegate = self;
    [customDelegateObj processMyDelegate];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)doSomething:(NSString *)str andData:(NSArray *)dataArr{
    NSLog(@"String :%@",str);
        NSLog(@"Array :%@",dataArr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnClicked:(id)sender {
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
@end
