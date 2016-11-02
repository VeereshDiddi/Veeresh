//
//  DetailsViewController.m
//  ASquareExam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "DetailsViewController.h"
#import "ViewController.h"

@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataArr = [[NSMutableArray alloc] initWithCapacity:0];
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

- (IBAction)submitButtonClicked:(id)sender {
    
    NSString *nameTF = self.nameTF.text;
    NSString *stateTF = self.stateTF.text;
    NSString *cityTF = self.cityTF.text;
    NSString *empType = self.empTF.text;
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:0];
    [dict setObject:nameTF forKey:@"name"];
    [dict setObject:stateTF forKey:@"state"];

    [dict setObject:cityTF forKey:@"city"];

    [dict setObject:empType forKey:@"emp"];
    
    [self.dataArr addObject:dict];

[self performSegueWithIdentifier:@"detailsView" sender:self];


}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"detailsView"]) {
         ViewController *viewObj = [segue destinationViewController];
        viewObj.detailsViewObj = self;
        [self.navigationController popViewControllerAnimated:YES];
    }
}


@end
