//
//  WebViewController.m
//  QezyPlay
//
//  Created by MacBook Pro on 13/10/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Determile cache file path
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [NSString stringWithFormat:@"%@/%@", [paths objectAtIndex:0],@"privacy.html"];
    
    NSFileManager *fileManagr = [NSFileManager defaultManager];
    
    if (![fileManagr fileExistsAtPath:filePath]) {
        
        // Download and save File in DocumentDirectory
        NSURL *url = [NSURL URLWithString:@"http://104.196.99.177:6363/Privacy_Policy.htm"];
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


@end
