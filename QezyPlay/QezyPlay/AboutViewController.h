//
//  AboutViewController.h
//  QezyPlay
//
//  Created by MacBook Pro on 18/10/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AboutViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *aboutImage;
    NSArray *aboutData;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
