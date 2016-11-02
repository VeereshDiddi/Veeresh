//
//  ViewController.m
//  SafariViewController
//
//  Created by MacBook Pro on 22/06/16.
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

- (IBAction)safariButtonClicked:(id)sender {
    NSString *sURL = @"http://ideabytestraining.com/demoqezyplay/";
    NSURL *URL = [NSURL URLWithString:sURL];
    SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:URL]; // 1.
//    SFSafariViewController *safari = [[SFSafariViewController alloc] initWithURL:URL entersReaderIfAvailable:YES]; // 2.
    safari.delegate = self;
    NSLog(@"SFSafariViewController URL:%@", safari);
    [self presentViewController:safari animated:YES completion:nil];
}

#pragma mark - SFSafariViewController delegate methods
-(void)safariViewController:(SFSafariViewController *)controller didCompleteInitialLoad:(BOOL)didLoadSuccessfully {
    // Load finished
}

-(void)safariViewControllerDidFinish:(SFSafariViewController *)controller {
    // Done button pressed
}
@end
