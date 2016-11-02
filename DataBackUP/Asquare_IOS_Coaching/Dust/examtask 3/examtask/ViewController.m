//
//  ViewController.m
//  examtask
//
//  Created by Asquare on 7/3/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import "ViewController.h"
#import "shared.h"
#import "detailsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(next)];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)next
{
    [self performSegueWithIdentifier:@"data" sender:nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.receivearray.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"identifier"];
    if (cell==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"identifier"];
        NSDictionary *dict = [self.receivearray objectAtIndex:indexPath.row];
        cell.textLabel.text=[NSString stringWithFormat:@"%@",[dict valueForKey:@"name"]];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    [self performSegueWithIdentifier:@"details" sender:[self.receivearray objectAtIndex:indexPath.row]];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    shared *sharedobj=[shared sharedClass];
    self.receivearray=sharedobj.receivearray ;
    [self.tableview reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"details"])
    {
    
        detailsViewController *details=[segue destinationViewController];
        details.detailsarray=sender;
    }
}
@end
