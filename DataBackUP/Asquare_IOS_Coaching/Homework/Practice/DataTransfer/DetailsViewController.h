//
//  DetailsViewController.h
//  DataTransfer
//
//  Created by MacBook Pro on 30/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailsViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic, strong)NSMutableArray *detailsArr;
@property(nonatomic, strong)ViewController *viewObj;
@end
