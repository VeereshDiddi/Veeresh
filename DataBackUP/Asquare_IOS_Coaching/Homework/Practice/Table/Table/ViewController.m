//
//  ViewController.m
//  Table
//
//  Created by MacBook Pro on 21/06/16.
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
    myDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSArray arrayWithObjects:@"Ram", @"Veer", nil], @"students", [NSArray arrayWithObjects:@"Hyd", @"Kurn", @"Vij", nil], @"cities", [NSArray arrayWithObjects:@"AP",@"TS", @"UP" , nil],@"states", [NSArray arrayWithObjects:@"India", @"Pak", @"UK", nil], @"countries", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)
{
    NSArray *arr = [myDict objectForKey:[[myDict allKeys]objectAtIndex:section ]];
    return arr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
       static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSLog(@"Cell:%@",cell);
    cell.textLabel.text = [myDict valueForKey:[[[myDict allKeys] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    return cell;
}
/*

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView              // Default is 1 if not implemented
{
    return myDict.allKeys.count;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section    // fixed font style. use custom view (UILabel) if you want something different
{
    
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    
}

*/

@end
