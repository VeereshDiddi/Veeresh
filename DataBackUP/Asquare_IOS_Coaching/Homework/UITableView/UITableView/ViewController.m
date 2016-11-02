//
//  ViewController.m
//  UITableView
//
//  Created by MacBook Pro on 31/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.nameArray = [[NSMutableArray alloc] initWithObjects:@"Abcd", @"Bcde", @"Cdef", @"Defg", @"Efgh", nil];
    self.addressArray = [[NSMutableArray alloc] initWithObjects:@"abcd@gmail.com", @"bcde@gmail.com", @"cdef@gmail.com", @"defg@gmail.com", @"efgh@gmail.com", nil];
    self.phoneNumberArray = [[NSMutableArray alloc] initWithObjects:@"123", @"456", @"789", @"321", @"654", nil];
    
    self.imageArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"1.jpg"], [UIImage imageNamed:@"2.jpg"], [UIImage imageNamed:@"3.jpg"], [UIImage imageNamed:@"4.jpg"], [UIImage imageNamed:@"5.jpg"], nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
        return 5;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 100, 50)];
        imgView.tag = 1;
        [cell addSubview:imgView];
        
        UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(150, 0, 150, 30)];
        lbl1.tag = 2;
        [cell addSubview:lbl1];
        
        UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(150, 20, 150, 30)];
        lbl2.tag = 3;
        [cell addSubview:lbl2];
        
        UILabel *lbl3 = [[UILabel alloc]initWithFrame:CGRectMake(150, 40, 150, 30)];
        lbl3.tag = 4;
        [cell addSubview:lbl3];
        
        
    }
    
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:1];
//    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row+1]];
    imageView.image = [self.imageArray objectAtIndex:indexPath.row];
    
    UILabel *txtLbl1 = (UILabel*)[cell viewWithTag:2];
    txtLbl1.text = [self.nameArray objectAtIndex:indexPath.row];
    
    UILabel *txtLbl2 = (UILabel*)[cell viewWithTag:3];
    txtLbl2.text = [self.addressArray objectAtIndex:indexPath.row];
    
    UILabel *txtLbl3 = (UILabel*)[cell viewWithTag:4];
    txtLbl3.text = [self.phoneNumberArray objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedRow = indexPath.row;
    if (indexPath.row >= 0 || indexPath.row <= 5) {
        [self performSegueWithIdentifier:@"firstView" sender:self];
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"firstView"]) {
          FirstViewController *firstViewObj = [segue destinationViewController];
        if (selectedRow == -1) {
            
        }else{
      
        firstViewObj.nameLabel = [self.nameArray objectAtIndex:selectedRow];
        firstViewObj.addressLabel = [self.addressArray objectAtIndex:selectedRow];
        firstViewObj.phoneLabel = [self.phoneNumberArray objectAtIndex:selectedRow];
        }
        firstViewObj.image = [self.imageArray objectAtIndex:selectedRow];
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (IBAction)addBtnClicked:(id)sender {
    selectedRow = -1;
    [self performSegueWithIdentifier:@"firstView" sender:self];

}
@end
