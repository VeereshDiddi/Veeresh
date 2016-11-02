//
//  ViewController.m
//  ArraImageView
//
//  Created by MacBook Pro on 28/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
static int i=0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
     self.array = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"play.png" ], [UIImage imageNamed:@"pause.png" ], [UIImage imageNamed:@"previous.png" ], nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)previousButtonAction:(id)sender {
    
    if(i>= 0 || i <= [self.array count]) {
        self.imageView.image = [self.array objectAtIndex:i];
        i--;
    }
}

- (IBAction)nextButtonAction:(id)sender {
    
    if (i >= 0 || i <= [self.array count]) {
//        self.imageView.image = [UIImage imageNamed:[array objectAtIndex:i]];
        [self.imageView setImage:[UIImage imageNamed:[self.array objectAtIndex:i]]];
        NSLog(@"i value is:%d", i);
        i++;
    }
}
@end
