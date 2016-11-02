//
//  ViewController.h
//  Exam
//
//  Created by ASquare Mobile Technologies on 04/07/16.
//  Copyright © 2016 ASquare Mobile Technologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailsViewController.h"

@interface ViewController : UIViewController
@property(strong, nonatomic)NSMutableArray *detailsArray;
- (IBAction)addBtnClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(readwrite)NSInteger selectedRow;
@property(strong,nonatomic)DetailsViewController *detailsviewObj;


@end

