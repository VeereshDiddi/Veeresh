//
//  SettingsViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-09-09.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    
    NSArray *settingsData;
    NSArray *settingsImage;
}


@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end
