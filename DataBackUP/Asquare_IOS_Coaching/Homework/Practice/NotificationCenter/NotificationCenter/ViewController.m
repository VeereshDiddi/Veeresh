//
//  ViewController.m
//  NotificationCenter
//
//  Created by MacBook Pro on 24/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController
int x=50, y=120,w=80, h=30,count = 0, i=1, xb=200, yb=120,wb=80, hb=30,countb = 0, ib=1;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(createLabel) name:@"createLabelNotification" object:nil];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(createButton) name:@"createButtonNotification" object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)addButtonClicked:(id)sender {
    
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
-(void)createLabel{

    CGRect labelLocation = CGRectMake(x, y, w, h);
    UILabel *label =  [[UILabel alloc] initWithFrame: labelLocation];
    NSString *iValue = [NSString stringWithFormat:@"Label: %d", i];
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

- (void)createButton
{
    
    CGRect buttonLocation = CGRectMake(xb, yb, wb, hb);
    UIButton *button =  [[UIButton alloc] initWithFrame: buttonLocation];
    
    yb = yb+50;
    [self.view addSubview:button];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:[NSString stringWithFormat:@"Button: %d", ib] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
    countb = countb+1;
    if (countb == 10)
    {
        xb = xb+50;
        yb = 120;
        countb =0;
        
    }
    
    ib = ib+1;

}
@end
