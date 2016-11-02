//
//  ViewController.m
//  Exam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.arr = [[NSMutableArray alloc] initWithCapacity:0];
//    NSLog(@"ViewController:%@", self.arr);
    

}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
//    self.arra = [NSMutableArray arrayWithArray:self.arr];
    NSLog(@"ViewController:%@", self.arr);
//    NSLog(@"Copy of ViewController:%@", self.arra);
//    NSLog(@"Copy of ViewController:%@", self.objArray);

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
