//
//  DeleteViewController.m
//  ASquareExam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "DeleteViewController.h"
#import "ViewController.h"

@interface DeleteViewController ()

@end

@implementation DeleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.detailsArray = [[NSMutableArray alloc]initWithArray:self.deleteViewObj.detailsArr];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)deleteButtonClicked:(id)sender {
    
    index = self.selectedIndex;
    
    self.nameTextF = [[self.detailsArray objectAtIndex:index] valueForKey:@"name"];
    
    
    
}
@end
