//
//  DetailsViewController.m
//  DataTransfer
//
//  Created by MacBook Pro on 30/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.detailsArr = [[NSMutableArray alloc] initWithObjects:self.viewObj.dataArr, nil];
    NSLog(@"details Att :%@", self.detailsArr);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.detailsArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UILabel *lbl = (UILabel *)[cell viewWithTag:100];
    NSDictionary *dic = [self.detailsArr objectAtIndex:indexPath.row];
    lbl.text = [dic objectForKey:@"name"];
    return cell;
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
