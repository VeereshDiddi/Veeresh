//
//  ProfileDetailController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-09-13.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileDetailController : UIViewController<UITableViewDataSource, UITableViewDelegate>
{
    UITextField *newProfileNameTextField;
}

@property (strong, nonatomic) NSString *currentProfileName;
@property (strong, nonatomic) NSMutableArray *allImages;
@property (strong, nonatomic) NSMutableArray *allChannelDescriptions;
@property (strong, nonatomic) NSMutableArray *allLinks;



@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)renameProfile:(id)sender;

- (IBAction)lockProfile:(id)sender;


@end
