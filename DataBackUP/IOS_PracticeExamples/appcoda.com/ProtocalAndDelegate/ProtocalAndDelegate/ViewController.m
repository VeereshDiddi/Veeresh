//
//  ViewController.m
//  ProtocalAndDelegate
//
//  Created by MacBook Pro on 17/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    SampleProtocal *sampleProtocal = [[SampleProtocal alloc]init];
    sampleProtocal.delegate = self;
    [myLabel setText:@"Processing..."];
    [sampleProtocal startSampleProcess];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Sample protocol delegate
- (void)processCompleted
{
    [myLabel setText:@"Process Completed"];
}

@end
