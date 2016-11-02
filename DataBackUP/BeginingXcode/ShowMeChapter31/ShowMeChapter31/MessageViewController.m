//
//  MessageViewController.m
//  ShowMeChapter31
//
//  Created by MacBook Pro on 09/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "MessageViewController.h"
#import "MainViewController.h"
@interface MessageViewController ()

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.messageLabel setText:_messageData];
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
-(id)initWithMessage:(NSString *)messageDaata
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        _messageData = messageDaata;
    }
    return self;
}

@end
