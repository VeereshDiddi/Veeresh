//
//  DetailsViewController.h
//  DataDemo
//
//  Created by MacBook Pro on 01/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong)ViewController *viewObject;
@property(nonatomic, strong)NSMutableArray *detailsArr;

@end
