//
//  ViewController.m
//  GetWebserviceDemo
//
//  Created by AsquareMobileTechnologies on 7/9/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc]init];
    [self getWebserviceCall];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)getWebserviceCall{
    NSString *urlStr = @"http://www.asquareit.com/asquare/api/states";
    NSURL *url = [NSURL URLWithString:urlStr];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.responseData = [[NSMutableData alloc]init];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"%@",[error localizedDescription]);
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
 
//    NSString *response = [[NSString alloc]initWithData:self.responseData encoding:NSUTF8StringEncoding];
//    NSLog(@"response :%@",response);
    NSArray *tmpArr = [NSJSONSerialization JSONObjectWithData:self.responseData options:0 error:nil];
     NSLog(@"dataArr :%@",tmpArr);
    [self.dataArr addObjectsFromArray:tmpArr];
    [self.tblView reloadData];
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSDictionary *dic = [self.dataArr objectAtIndex:indexPath.row];
    cell.textLabel.text = [dic objectForKey:@"name"];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
