//
//  TableViewController.h
//  AssignTableViewController
//
//  Created by MacBook Pro on 26/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController
@property (strong, nonatomic) NSArray *Names;
@property (strong, nonatomic) NSArray *PlayersRole;
@property (strong, nonatomic) NSArray *Description;
@property (strong, nonatomic) NSArray *PlayerImages;

@property (strong, nonatomic) NSString *strName;
@property (strong, nonatomic) NSString *strPlayerRole;


@end
