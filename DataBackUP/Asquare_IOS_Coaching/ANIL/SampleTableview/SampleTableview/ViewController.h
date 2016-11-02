//
//  ViewController.h
//  SampleTableview
//
//  Created by AsquareMobileTechnologies on 6/7/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{

    NSDictionary *myDict;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

