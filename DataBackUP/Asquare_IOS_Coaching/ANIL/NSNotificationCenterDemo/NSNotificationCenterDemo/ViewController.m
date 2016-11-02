//
//  ViewController.m
//  NSNotificationCenterDemo
//
//  Created by AsquareMobileTechnologies on 6/22/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(updateData:) name:@"updateNotification" object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    NSDictionary *dic = [self.dataArr objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dic objectForKey:@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedRow = indexPath.row;
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier]isEqualToString:@"firstView"]) {
        FirstViewController *firstViewObj = [segue destinationViewController];
        firstViewObj.row = selectedRow;
        if (selectedRow>=0)
            firstViewObj.dic = [self.dataArr objectAtIndex:selectedRow];
    }
}
-(void)updateData:(NSNotification*)notify{
    NSDictionary *dic = [notify object];
    if (selectedRow == -1) {
        [self.dataArr addObject:dic];
    }else{
        [self.dataArr replaceObjectAtIndex:selectedRow withObject:dic];
    }
    [self.tblView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addBtnClicked:(id)sender {
    selectedRow = -1;
    [self performSegueWithIdentifier:@"firstView" sender:self];
}
@end
