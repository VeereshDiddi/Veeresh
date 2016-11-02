//
//  swathiViewController.m
//  singleview
//
//  Created by ASquare Mobile Technologies on 13/05/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import "swathiViewController.h"

@interface swathiViewController ()

@end

@implementation swathiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear");

}    // Called when the view is about to made visible. Default does nothing
- (void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");

}
// Called when the view has been fully transitioned onto the screen. Default does nothing
- (void)viewWillDisappear:(BOOL)animated{
    NSLog(@"viewWillDisappear");

} // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
- (void)viewDidDisappear:(BOOL)animated{
    NSLog(@"viewDidDisappear");

    }  // Called after the view was dismissed, covered or otherwise hidden. Default does nothing



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

@end
