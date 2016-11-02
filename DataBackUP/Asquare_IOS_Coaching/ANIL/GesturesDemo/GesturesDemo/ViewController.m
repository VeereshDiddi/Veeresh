//
//  ViewController.m
//  GesturesDemo
//
//  Created by AsquareMobileTechnologies on 6/30/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.imgView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapGesusterAction:)];
    tapGesture.numberOfTapsRequired = 2;
//    tapGesture.numberOfTouchesRequired = 2;
//    [self.imgView addGestureRecognizer:tapGesture];
    
    UISwipeGestureRecognizer *swipeGesture= [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swipeLeft:)];
    swipeGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeGesture];
    
    
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPress:)];
//    [self.imgView addGestureRecognizer:longPress];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(pinchGestureAction:)];
    self.view.multipleTouchEnabled = YES;
    [self.imgView addGestureRecognizer:pinchGesture];
    
//    [self.view addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)tapGesusterAction:(UITapGestureRecognizer *)sender{
    NSLog(@"Tap Gesture");
}

-(void)swipeLeft:(UISwipeGestureRecognizer*)sender{
    NSLog(@"Swipe Left");
}

-(void)longPress:(UILongPressGestureRecognizer *)sender{
    NSLog(@"Long Press");
}
-(void)pinchGestureAction:(UIPinchGestureRecognizer*)recognizer{
    if (recognizer.scale >1.0f && recognizer.scale < 2.5f) {
        NSLog(@"Pinch Gesture:%f",recognizer.scale);

        CGAffineTransform transform = CGAffineTransformMakeScale(recognizer.scale, recognizer.scale);
        self.imgView.transform = transform;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
