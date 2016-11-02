//
//  ViewController.h
//  ASquareExam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface ViewController : UIViewController<UITextViewDelegate, UITableViewDataSource>

@property(nonatomic, readwrite)NSInteger selectedIndex;


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic)DetailsViewController *detailsViewObj;
@property(strong,nonatomic)NSMutableArray *detailsArr;


@end

