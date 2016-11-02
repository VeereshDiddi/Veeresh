//
//  ViewController.h
//  NavigationAndTableVC
//
//  Created by MacBook Pro on 02/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) IBOutlet UITableView *tableView;


@end

