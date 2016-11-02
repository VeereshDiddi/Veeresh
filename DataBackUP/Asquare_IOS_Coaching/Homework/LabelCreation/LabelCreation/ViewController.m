//
//  ViewController.m
//  LabelCreation
//
//  Created by MacBook Pro on 18/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

int x=50, y=120,w=30, h=20,count = 0, i=1;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createLabelButton:(id)sender {
    
            CGRect labelLocation = CGRectMake(x, y, w, h);
        UILabel *label =  [[UILabel alloc] initWithFrame: labelLocation];
        NSString *iValue = [NSString stringWithFormat:@"%d", i];
        label.text = iValue;
        y = y+50;
        [self.view addSubview:label];
        label.backgroundColor = [UIColor greenColor];
        label.textColor = [UIColor redColor];
        count = count+1;
        if (count == 10)
        {
            x = x+50;
            y = 120;
            count =0;
            
        }
        
    i = i+1;

}

- (IBAction)clearLabelButton:(id)sender {
    
    
            if (i >= 5) {
               int j = 0;
                for (id obj in self.view.subviews) {
                    if ([obj isKindOfClass:[UILabel class]]) {
                        [obj removeFromSuperview];
                        j++;
                        if (j == 5) {
                            break;
                            j = 0;
                        }
                    }
                }
            }
            else
            {
                NSLog(@"AletView");
                
            }
        
    
    
    x = 50;
    y = 120;
    count = 0;
    i = 1;
}

@end
