//
//  SimpleTableViewController.m
//  TableViewAppCoda
//
//  Created by MacBook Pro on 02/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "SimpleTableViewController.h"

@interface SimpleTableViewController ()
{
    NSArray *tableData;
}

@end

@implementation SimpleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    tableData = [NSArray arrayWithObjects:@"A", @"B", @"C",@"D", @"D", @"E", @"F",@"G", @"H", @"I", @"J", @"K", @"L", @"M", @"N", @"O", @"P", nil];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    
    }
    cell.textLabel.text = [tableData objectAtIndex:indexPath.row];
    return cell;
}

@end
