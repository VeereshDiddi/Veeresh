//
//  ViewController.m
//  YUSwitchDemo
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
    UISwitch *swtch = [[UISwitch alloc]initWithFrame:CGRectMake(100, 200, 50, 35)];
    swtch.on = true;
    [swtch addTarget:self action:@selector(switchStateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:swtch];
    UISlider *slid = [[UISlider alloc]initWithFrame:CGRectMake(150, 250, 100, 30)];
    slid.minimumTrackTintColor = [UIColor greenColor];
    slid.maximumTrackTintColor = [UIColor orangeColor];
    slid.minimumValue = 0;
    slid.maximumValue = 200;
    [slid addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slid];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchStateChanged:(id)sender {
    if ([sender isOn]) {
        NSLog(@"IS ON");
//        [self.switchObj setOn:YES];
//        self.switchObj.on=false;
    }else{
        NSLog(@"IS OFF");
//        [self.switchObj setOn:YES];
//         self.switchObj.on=YES;
    }
}

- (IBAction)sliderValueChanged:(id)sender {
    UISlider *tmpSlider = (UISlider*)sender;
    NSLog(@"%@",[NSString stringWithFormat:@"%f",[tmpSlider value]]);
}
@end
