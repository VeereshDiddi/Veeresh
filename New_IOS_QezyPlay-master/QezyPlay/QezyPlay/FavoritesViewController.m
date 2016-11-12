//
//  FavoritesViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "FavoritesViewController.h"
#import "UserData.h"
#import "HomeViewController.h"
#import "SettingsViewController.h"

@interface FavoritesViewController ()

@end

@implementation FavoritesViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    NSString *subscriptionURL = [NSString stringWithFormat:@"http://ideabytestraining.com/newqezyplay/m-subscription/?user_id=%@&user_name=%@",[[NSUserDefaults standardUserDefaults] valueForKey:@"OLD_ID"],[[NSUserDefaults standardUserDefaults] valueForKey:@"USER_NAME"]];
    
    NSLog(@" %@ ",subscriptionURL);
    
    NSURL *url = [NSURL URLWithString:subscriptionURL];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setTimeoutInterval:30];
    subscriptionWebView.delegate = self;
    [subscriptionWebView loadRequest:request];
    
 
}

- (BOOL)webView:(UIWebView *)webView
shouldStartLoadWithRequest:(NSURLRequest *)request
 navigationType:(UIWebViewNavigationType)navigationType {
    
    // these need to match the values defined in your JavaScript
    NSString *myAppScheme = @"myfakeappname";
    NSString *myActionType1 = @"myJavascriptActionType1";
    NSString *myActionType2 = @"myJavascriptActionType2";
    // ignore legit webview requests so they load normally
    if (![request.URL.scheme isEqualToString:myAppScheme]) {
        return YES;
    }
    
    // get the action from the path
    NSString *actionType = request.URL.host;
    // deserialize the request JSON
    NSDictionary *jsonDictString = [[NSDictionary alloc] init];
    
    jsonDictString = (NSDictionary *)[request.URL.fragment stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    //    NSString *jsonDictString = [request.URL.fragment stringByReplacingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    NSLog(@"jsonDictString:%@", jsonDictString);
    
//    NSString *bouquet = jsonDictString[@"redirect_url"];
//    NSString *account = jsonDictString[@"redirect_url"];
//    NSLog(@"Bouquet:jsonDictString:%@", bouquet);
//    NSLog(@"Account:jsonDictString:%@", account);
    
    // look at the actionType and do whatever you want here
    if ([actionType isEqualToString:myActionType1]) {
        //goto_Bouquets
        
//        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//        HomeViewController *controller = (HomeViewController *) [storyboard instantiateViewControllerWithIdentifier:@"HomeViewController"];
//        [self presentViewController:controller animated:YES completion:nil];
//        
//        NSLog(@"Successfully Completed From Webside");
        
        self.tabBarController.selectedIndex = 0;
        
    }
    
 /*
    if ([actionType isEqualToString:myActionType2]) {
        //goto_Bouquets
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        SettingsViewController *controller = (SettingsViewController *) [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
        [self presentViewController:controller animated:YES completion:nil];
        
        NSLog(@"Successfully Completed From Webside");
        
    }
*/
    
    // make sure to return NO so that your webview doesn't try to load your made-up URL
    return NO;
}
/*
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSLog(@"Web Service call");
    
    if ([[[request URL] absoluteString] hasPrefix:@"ios:"]) {
        
        // Call the given selector
        [self performSelector:@selector(webToNativeCall)];
        // Cancel the location change
        return NO;
    }
    return YES;
    
}
*/
- (void)webToNativeCall
{
    NSLog(@"webToNativeCall:Exit");
    [self alertStatus:@"Please enter User name or Email" :@"Web View" :0];
    return;
    
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 //    Dispose of any resources that can be recreated.
}

-(IBAction)backAndForward:(id)sender
{
    if ([sender tag]==1) {
        [subscriptionWebView goBack];
    }
    else
    {
        [subscriptionWebView goForward];
    }
}
@end
