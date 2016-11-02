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
static int i = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.firstNameArray = [[NSMutableArray alloc] initWithObjects:@"Diddi", @"Boya", @"BD", @"BC", @"Kurukunda", nil];
    self.lastNameArray = [[NSMutableArray alloc] initWithObjects:@"Veeresh", @"Indu", @"Jyoshna", @"Haritha", @"Sreedhar", nil];
    
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
    
        return 4;
    
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
        
        
    }
    
    UIImageView *imageView = (UIImageView*)[cell viewWithTag:1];
//    imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpg",indexPath.row+1]];
    imageView.image = [self.imageArray objectAtIndex:indexPath.row];
    
    UILabel *txtLbl1 = (UILabel*)[cell viewWithTag:2];
    txtLbl1.text = [self.firstNameArray objectAtIndex:indexPath.row];
    
    UILabel *txtLbl2 = (UILabel*)[cell viewWithTag:3];
    txtLbl2.text = [self.lastNameArray objectAtIndex:indexPath.row];
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
        selectedRow = indexPath.row;
    if (indexPath.row >= 0 || indexPath.row <=4) {
        
        [self performSegueWithIdentifier:@"firstView" sender:self];
    }
    }

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"firstView"]) {
          FirstViewController *firstViewObj = [segue destinationViewController];
              
        firstViewObj.firstLabel = [self.firstNameArray objectAtIndex:selectedRow];
        firstViewObj.lastLabel = [self.lastNameArray objectAtIndex:selectedRow];
        firstViewObj.image = [self.imageArray objectAtIndex:selectedRow];
        i++;
        firstViewObj.count1 = i;
        
        if (selectedRow == 0) {
            i++;
            firstViewObj.count1 = i;
            
                    }
        if (selectedRow == 1) {
            
        }
        if (selectedRow == 2) {
            
        }
        if (selectedRow == 3) {
            
        }

        
        
    }
}



@end
