//
//  DetailsViewController.m
//  Exam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "DetailsViewController.h"
//#import "ViewController.h"
@interface DetailsViewController ()

@end

@implementation DetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.dataArr  = [[NSMutableArray alloc] initWithCapacity:0];
    self.dict = [[NSMutableDictionary alloc] initWithCapacity:0];

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

    NSString *name = self.nameTF.text;
    NSString *state = self.stateTF.text;
    NSString *city = self.cityTF.text;
    NSString *emp = self.empTF.text;
    /*    [dict setObject:name forKey:@"name"];
    [dict setObject:state forKey:@"state"];
    [dict setObject:city forKey:@"city"];
    [dict setObject:emp forKey:@"emp"];
//    [self.dataArr addObject:dict];  */
//    NSLog(@"DetailsViewController:%@", self.dataArr);
//    ViewController *viewObj = [[ViewController alloc] init];
//    viewObj.arr  = self.dataArr;
    
//    NSLog(@"DetailsViewController:%@", viewObj.arr);

    [self.dict setValue:name forKey:@"name"];
    [self.dict setValue:state forKey:@"state"];
    [self.dict setValue:city forKey:@"city"];
    [self.dict setValue:emp forKey:@"employee"];
    
//    ViewController *viewObj = [[ViewController alloc] init];

    [self.viewObj.arr addObject:self.dict];
    NSLog(@"DetailsViewController:%@", self.viewObj.arr);
    [self.navigationController popViewControllerAnimated:YES];
//    [self.navigationController popToViewController:viewObj animated:YES];
    
}

@end
