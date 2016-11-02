//
//  MainViewController.m
//  ShowMeChapter31
//
//  Created by MacBook Pro on 09/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "MainViewController.h"
#import "MessageViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)showMe:(id)sender {
    NSString *messageValue = self.textToSendField.text;
    if ([messageValue isEqualToString:@""]) {
        NSLog(@"No text entered");
    }
    else
    {
        MessageViewController *messageViewController = [[MessageViewController alloc] initWithMessage:messageValue];
        [self.navigationController pushViewController:messageViewController animated:YES];
    }
   
}
@end
