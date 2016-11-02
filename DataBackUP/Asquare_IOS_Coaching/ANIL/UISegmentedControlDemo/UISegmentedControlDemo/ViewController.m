//
//  ViewController.m
//  UISegmentedControlDemo
//
//  Created by AsquareMobileTechnologies on 5/26/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
/*    NSArray *segments = [[NSArray alloc]initWithObjects:@"Segment One",@"Segment Two", nil];

    UISegmentedControl *segControl = [[UISegmentedControl alloc]initWithItems:segments];
    segControl.frame = CGRectMake(100, 220, 200, 45);
    segControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [segControl addTarget:self action:@selector(segementValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segControl];   */
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)segementValueChanged:(id)sender {
    if ([self.segmentedControl selectedSegmentIndex] == 0) {
        NSLog(@"Selected Segment 0");
    }else if ([self.segmentedControl selectedSegmentIndex] == 1){
         NSLog(@"Selected Segment 1");
    }
}
@end
