//
//  LanguageViewController.h
//  QezyPlay
//
//  Created by MacBook Pro on 18/10/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LanguageViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    
    NSArray *languageName;
    NSArray *languageCode;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
