//
//  DetailsViewController.h
//  DataPassingDemo
//
//  Created by AsquareMobileTechnologies on 6/4/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DetailsViewController : UIViewController
@property(strong,nonatomic)NSMutableArray *detailsArr;
@property (weak, nonatomic) IBOutlet UITableView *tblView;

@property(strong,nonatomic)ViewController *viewObj;
@end
