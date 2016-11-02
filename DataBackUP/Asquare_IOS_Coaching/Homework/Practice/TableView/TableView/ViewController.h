//
//  ViewController.h
//  TableView
//
//  Created by MacBook Pro on 21/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
{
    NSDictionary *myDict;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

