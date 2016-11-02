//
//  DetailsViewController.m
//  DataDemo
//
//  Created by MacBook Pro on 01/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailsArr = [[NSMutableArray alloc] initWithArray:self.viewObject.dataArr];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detailsArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lbl = (UILabel*)[cell viewWithTag:100];
    NSMutableDictionary *dict = [self.detailsArr objectAtIndex:indexPath.row];
    lbl.text = [dict objectForKey:@"name"];
        return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ViewController *vc = [[ViewController alloc] init];
    [_viewObject updateData:[self.detailsArr objectAtIndex:indexPath.row] andSelectedIndex:indexPath.row];
    
    [self.navigationController popViewControllerAnimated:YES];
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
