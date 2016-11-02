//
//  DetailsViewController.m
//  DataPassingDemo
//
//  Created by AsquareMobileTechnologies on 6/4/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailsArr = [[NSMutableArray alloc]initWithArray:self.viewObj.dataArr];

    NSLog(@"details Arr :%@",self.detailsArr);
    // Do any additional setup after loading the view.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.detailsArr count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lbl = (UILabel*)[cell viewWithTag:100];
    NSDictionary *dic = [self.detailsArr objectAtIndex:indexPath.row];
    lbl.text = [dic objectForKey:@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.viewObj updateData:[self.detailsArr objectAtIndex:indexPath.row] andSelectedIndex:indexPath.row];
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
