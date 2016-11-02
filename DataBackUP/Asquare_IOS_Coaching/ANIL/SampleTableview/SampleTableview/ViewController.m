//
//  ViewController.m
//  SampleTableview
//
//  Created by AsquareMobileTechnologies on 6/7/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark ViewLifeCycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myDict =[NSDictionary dictionaryWithObjectsAndKeys:[NSArray arrayWithObjects:@"Anil",@"ravi",@"Kiran",@"Avinash", nil],@"students",[NSArray arrayWithObjects:@"Hyd",@"Bng",@"Chennai",@"Vizag", nil],@"cities",[NSArray arrayWithObjects:@"AP",@"TN",@"TS", nil],@"states",[NSArray arrayWithObjects:@"India",@"UK",@"USA", nil],@"countries", nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark TableView Methods
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return [[myDict allKeys] objectAtIndex:section];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{

    return @"Mobile";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return myDict.allKeys.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 100;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSArray *arr =[myDict valueForKey:[[myDict allKeys] objectAtIndex:section]];
    return arr.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
         cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
   
    NSLog(@"Cell::%@",cell);
    cell.textLabel.text = [[myDict valueForKey:[[myDict allKeys] objectAtIndex:indexPath.section]] objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = @"Tech";
    cell.imageView.image = [UIImage imageNamed:@"car2.png"];
    return cell;

    
}
@end
