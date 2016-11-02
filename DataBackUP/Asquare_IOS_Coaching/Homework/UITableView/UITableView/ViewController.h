//
//  ViewController.h
//  UITableView
//
//  Created by MacBook Pro on 31/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    NSInteger selectedRow;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (strong,nonatomic) NSMutableArray *nameArray;
@property (strong,nonatomic) NSMutableArray *addressArray;
@property (strong,nonatomic) NSMutableArray *phoneNumberArray;
@property (strong,nonatomic) NSMutableArray *imageArray;

- (IBAction)addBtnClicked:(id)sender;

@end

