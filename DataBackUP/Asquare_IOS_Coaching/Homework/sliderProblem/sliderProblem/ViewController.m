//
//  ViewController.m
//  sliderProblem
//
//  Created by MacBook Pro on 27/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)RGBAction:(id)sender {
    self.view.backgroundColor = [UIColor colorWithRed:self.redSlider.value/255 green:self.greenSlider.value/255 blue:self.blueSlider.value/255 alpha:1];
    
    if (self.greenSlider.value > 100 ||  self.blueSlider.value > 100) {
        self.colorTextLabel.text = [NSString stringWithFormat:@"Red:%1.f Green:%1.f Blue:%1.f",self.redSlider.value, self.greenSlider.value, self.blueSlider.value];
        self.colorTextLabel.hidden = NO;
    }
    else
    {
        self.colorTextLabel.hidden = YES;
    }
}
@end
