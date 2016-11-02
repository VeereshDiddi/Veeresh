//
//  ViewController.m
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"
#import "ModificationsViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.detailsArray=[[NSMutableArray alloc]initWithCapacity:0];
   
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    NSLog(@"detailsArray ::Veeresh%@", self.detailsArray);
    [self.tableView reloadData];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.detailsArray count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    
    NSDictionary *dic=[self.detailsArray objectAtIndex:indexPath.row];
    cell.textLabel.text=[dic objectForKey:@"name"];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.selectedRow=indexPath.row;

    [self performSegueWithIdentifier:@"modificationsView" sender:self];
}
- (void)deleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths withRowAnimation:(UITableViewRowAnimation)animation

{
    
    
    }



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier ]isEqualToString:@"detailsView"]) {
         DetailsViewController *detailsviewObj=[segue destinationViewController];
        detailsviewObj.viewObj=self;
        NSLog(@"self:::%@\n\n", self);
        NSLog(@"detailsViewOb:::%@\n\n", detailsviewObj);
        NSLog(@"viewObj:::%@\n\n", detailsviewObj.viewObj);
   }else{
      ModificationsViewController *moificationViewObj=[segue destinationViewController];
      
       moificationViewObj.viewObjOfMVC=self;
    }
}
- (IBAction)addBtnClicked:(id)sender {
    [self performSegueWithIdentifier:@"detailsView" sender:nil];
}


@end

