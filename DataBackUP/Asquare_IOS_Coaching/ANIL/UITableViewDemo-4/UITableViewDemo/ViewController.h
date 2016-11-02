//
//  ViewController.h
//  UITableViewDemo
//
//  Created by AsquareMobileTechnologies on 5/30/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    UITableView *table;
    NSInteger selectedRow;
}
@property (strong,nonatomic) NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UITableView *tblView;


@end

