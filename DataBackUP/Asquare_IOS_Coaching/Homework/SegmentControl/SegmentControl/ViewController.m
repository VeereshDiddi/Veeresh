//
//  ViewController.m
//  SegmentControl
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imageArray, labelArray;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.labelValue.backgroundColor = [UIColor redColor];
    imageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"pause.png"], [UIImage imageNamed:@"play.png"], [UIImage imageNamed:@"previous.png"], nil];
    labelArray = [[NSMutableArray alloc] initWithObjects:@"Pause Image", @"Play Image", @"Previous Image", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)LabelOnOFfSwitchAction:(id)sender {
    
    if (self.switchVariable.on == YES) {
        self.labelValue.hidden = NO;
    }
    else
    {
        self.labelValue.hidden = YES;
    }
}

- (IBAction)segmentValueChanged:(id)sender {
    if ([self.segmentControl selectedSegmentIndex] == 0) {
        NSLog(@"Segment Index:0");
        self.imageView.image = [imageArray objectAtIndex:0];
        self.labelValue.text = [labelArray objectAtIndex:0];
    }
    else if ([self.segmentControl selectedSegmentIndex] == 1)
    {
        NSLog(@"Segment Index:1");
        self.imageView.image = [imageArray objectAtIndex:1];
        self.labelValue.text = [labelArray objectAtIndex:1];
    }
    else if ([self.segmentControl selectedSegmentIndex] == 2)
    {
        NSLog(@"Segment Index:2");
        self.imageView.image = [imageArray objectAtIndex:2];
        self.labelValue.text = [labelArray objectAtIndex:2];
    }
}

- (IBAction)sliderAction:(id)sender {
    self.sliderLabel.text = [NSString stringWithFormat:@"%f", self.slider.value];
}
@end
