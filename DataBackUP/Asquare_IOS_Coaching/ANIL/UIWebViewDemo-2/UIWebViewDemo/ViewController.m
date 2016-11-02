//
//  ViewController.m
//  UIWebViewDemo
//
//  Created by AsquareMobileTechnologies on 6/27/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.activity startAnimating];
    NSString * urlStr= @"https://www.facebook.com/";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:30];
    [self.webView loadRequest:request];
    timer = [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doSomething) userInfo:nil repeats:YES];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)doSomething{
    NSLog(@"Test");
    if (i == 3) {
        [timer invalidate];
    }
    i++;
    [self.activity stopAnimating];
}
-(void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:YES];
    // [self.activity stopAnimating];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
