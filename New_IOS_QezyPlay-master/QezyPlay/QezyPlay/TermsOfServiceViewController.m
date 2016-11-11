//
//  TermsOfServiceViewController.m
//  QezyPlay
//
//  Created by MacBook Pro on 10/11/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "TermsOfServiceViewController.h"

@interface TermsOfServiceViewController ()

@end

@implementation TermsOfServiceViewController


//[request setURL:[NSURL URLWithString:@"http://104.196.99.177:6363/Terms_of_Service.htm"]];


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Determile cache file path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],@"Terms_of_Service.html"];
    
    NSFileManager *fileManagr = [NSFileManager defaultManager];
    
    if (![fileManagr fileExistsAtPath:filePath]) {
        
        // Download and save File in DocumentDirectory
        NSURL *url = [NSURL URLWithString:@"http://104.196.99.177:6363/Terms_of_Service.htm"];
        NSData *urlData = [NSData dataWithContentsOfURL:url];
        [urlData writeToFile:filePath atomically:YES];
        
        if (urlData!=nil) {
            // Load file in UIWebView
            [webViewObj loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
        }
    }
    else
    {
        // Load file in UIWebView
        [webViewObj loadRequest:[NSURLRequest requestWithURL:[NSURL fileURLWithPath:filePath]]];
    }
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

@end
