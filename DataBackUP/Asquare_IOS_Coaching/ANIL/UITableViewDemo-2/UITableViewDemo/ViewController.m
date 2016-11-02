//
//  ViewController.m
//  UITableViewDemo
//
//  Created by AsquareMobileTechnologies on 5/30/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Home";
    
//    table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    table.dataSource = self;
//    table.delegate = self;
//    [self.view addSubview:table];
    
    
    self.dataArr = [[NSMutableArray alloc]initWithObjects:@"Test",@"Hello World",@"ASQUARE",@"MAHESH",@"RAJESH", nil];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return [self.dataArr count];
    }else if(section == 1){
        return 4;
    }else{
        return 10;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:1];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",indexPath.row+1]];
    UILabel *txtLbl = (UILabel*)[cell viewWithTag:2];
    txtLbl.text = [self.dataArr objectAtIndex:indexPath.row];


    return cell;
}
/*- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
     NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
       if (cell == nil) {
          
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
           
           UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 150, 30)];
           lbl.tag = 1;
           [cell addSubview:lbl];
           
           UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(160, 5, 55, 40)];
           imgView.tag = 2;
           [cell addSubview:imgView];
    }
    UILabel *txtLbl = (UILabel*)[cell viewWithTag:1];
   txtLbl.text = [self.dataArr objectAtIndex:indexPath.row];
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:2];
   imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",indexPath.row+1]];
    
    return cell;
}*/
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return @"ABC";
    }else if (section ==1){
        return @"DEF";
    }else if (section == 2){
        return @"XYZ";
    }else{
        return @"IJK";
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return 50;
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedRow = indexPath.row;
    if (indexPath.row ==0) {
        [self performSegueWithIdentifier:@"firstView" sender:self];
    }else if (indexPath.row ==1) {
        [self performSegueWithIdentifier:@"secondView" sender:self];
    }else if (indexPath.row ==2) {
        [self performSegueWithIdentifier:@"thirdView" sender:self];
    }
    NSLog(@"Selected Values :%@",[self.dataArr objectAtIndex:indexPath.row]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    if ([[segue identifier]isEqualToString:@"firstView"]) {
        FirstViewController *firstViewObj = [segue destinationViewController];
        firstViewObj.txtStr = [self.dataArr objectAtIndex:selectedRow];
    }
}
@end
