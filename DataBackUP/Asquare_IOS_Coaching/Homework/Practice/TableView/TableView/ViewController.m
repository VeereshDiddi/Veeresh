//
//  ViewController.m
//  TableView
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
    myDict = [[NSDictionary alloc] initWithObjectsAndKeys:[NSArray arrayWithObjects:@"Veeresh", @"Ramesh", @"Suresh", @"Sreedhar", nil], @"students", [NSArray arrayWithObjects:@"Kurnool", @"Hyderabad", @"Vijayawada", @"Adoni", nil], @"cities", [NSArray arrayWithObjects:@"AP", @"UP", @"JK", @"TS", nil], @"states", [NSArray arrayWithObjects:@"India", @"Virsys", @"Australia", @"UK", nil], @"countries", nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return myDict.allKeys.count;
}// Default is 1 if not implemented


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *arr = [myDict objectForKey:[[myDict allKeys] objectAtIndex:section]];
    return arr.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    NSLog(@"Cell:%@",cell);
    cell.textLabel.text = [myDict objectForKey:[[[myDict allKeys] objectAtIndex:indexPath.section] objectAtIndex:indexPath.row]];
    cell.detailTextLabel.text = @"Tech";
    cell.imageView.image = [UIImage imageNamed:@"car2.png"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section   // fixed font style. use custom view (UILabel) if you want something different
{
    return [[myDict allKeys] objectAtIndex:section];
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @"Virsys";
}



@end
