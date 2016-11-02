//
//  ViewController.m
//  SingleTonDemo
//
//  Created by AsquareMobileTechnologies on 6/18/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"
#import "ShareManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ShareManager *shareObj =[ShareManager sharedManager];
    shareObj.nameStr = @"Asquare";
    shareObj.dataArr = [[NSArray alloc]initWithObjects:@"1",@"2", nil];
    
//    [[ShareManager sharedManager]setNameStr:@"Asquare"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewDidAppear:(BOOL)animated{
    
    [super viewDidAppear:YES];
    ShareManager *shareObj =[ShareManager sharedManager];

//    NSString *str = [[ShareManager sharedManager]nameStr];
    NSLog(@"Str :%@", shareObj.nameStr);
     NSLog(@"Array :%@", shareObj.dataArr);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nextBtnClicked:(id)sender {
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
@end
