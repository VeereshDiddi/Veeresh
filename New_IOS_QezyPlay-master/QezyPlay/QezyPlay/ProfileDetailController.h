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
    
    NSMutableArray * channelList;
    
    UITextField *newProfileLockTextField;
    UITextField *newProfileUnLockTextField;
    
    Boolean isProfileOpen;
}

@property (strong, nonatomic) NSString *currentProfileName;
@property (strong, nonatomic) NSMutableArray *allImages;
@property (strong, nonatomic) NSMutableArray *allChannelDescriptions;
@property (strong, nonatomic) NSMutableArray *allLinks;

@property (nonatomic) NSInteger profileIndex;

@property (strong, nonatomic) IBOutlet UIImageView *image;



@property (strong, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)renameProfile:(id)sender;

- (IBAction)lockProfile:(id)sender;


- (IBAction)addChannel:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *profileDetailView;


@end
