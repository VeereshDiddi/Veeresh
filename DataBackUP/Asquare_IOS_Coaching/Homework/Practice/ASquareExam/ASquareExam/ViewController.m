//
//  ViewController.m
//  ASquareExam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "DeleteViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.detailsArr = [[NSMutableArray alloc]initWithArray:self.detailsViewObj.dataArr];
    
    NSLog(@"details Arr :%@",self.detailsArr);
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
    
    selectedIndex = indexPath.row;
    //deleteView
    [self performSegueWithIdentifier:@"deleteView" sender:self];

}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"deleteView"]) {
        DeleteViewController *viewObj = [segue destinationViewController];
        viewObj.deleteViewObj = self;
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
