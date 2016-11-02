//
//  TableViewCell.h
//  AssignTableViewController
//
//  Created by MacBook Pro on 26/03/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *NamesLabel;
@property (strong, nonatomic) IBOutlet UILabel *PlayersRoleLabel;
@property (strong, nonatomic) IBOutlet UILabel *DescriptionLabel;
@property (strong, nonatomic) IBOutlet UIImageView *PlayerImages;


@end
