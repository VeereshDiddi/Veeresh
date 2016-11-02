//
//  ViewController.h
//  UITableView
//
//  Created by MacBook Pro on 31/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSInteger selectedRow;
    NSInteger c1,c2,c3,c4;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic) NSMutableArray *firstNameArray;
@property (strong,nonatomic) NSMutableArray *lastNameArray;
@property (strong,nonatomic) NSMutableArray *imageArray;

- (IBAction)addBtnClicked:(id)sender;

@end

