//
//  ViewController.m
//  WebserviceDemo
//
//  Created by AsquareMobileTechnologies on 5/3/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self getWebserviceCalling];
    [self postWebserviceCall];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getWebserviceCalling{
    
    NSString *urlStr = @"https://itunes.apple.com/search?term=jack johnson";
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"GET"];
    [request setTimeoutInterval:60];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

-(void)postWebserviceCall{
    
    NSString *urlStr = @"http://www.asquareit.com/asquare/api/login";
    urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url = [NSURL URLWithString:urlStr];
    NSDictionary *params = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"ashokreddy1262@gmail.com",@"M2F5UX", nil] forKeys:[NSArray arrayWithObjects:@"email",@"password", nil]];
    NSError *err = nil;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&err];
    if (err) {
        NSLog(@"error :%@",[err localizedDescription]);
    }
    //NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:postData];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setTimeoutInterval:60];
    [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
    self.recievedData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.recievedData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    
    NSLog(@"Error :%@",[error localizedDescription]);
    self.recievedData = nil;
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    NSString *response = [[NSString alloc]initWithData:self.recievedData encoding:NSUTF8StringEncoding];
//    NSLog(@"Response :%@",response);
    NSError *err = nil;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:self.recievedData options:0 error:&err];
    if (err) {
        NSLog(@"JSON OBJECT ERROR :%@",[err localizedDescription]);
    }else{
        NSArray *resultsArr = [jsonDic objectForKey:@"results"];
        NSLog(@"Results Array :%@",resultsArr);
        NSLog(@"Results Count :%@",[jsonDic objectForKey:@"resultCount"]);
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
