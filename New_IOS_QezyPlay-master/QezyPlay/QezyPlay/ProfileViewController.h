//
//  ProfileViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-09-05.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    //NSMutableArray *profileName;
    //NSMutableArray *profileImage;
    
    NSDictionary *profileDictImages;
    NSDictionary *profileDictLinks;
    
    NSMutableArray *allProfileImage;
    
    UITextField *profileNameTextField;
    
    NSString *profileSelected;
    NSMutableArray *profileImagesSelected;
    NSMutableArray *profileLinksSelected;
    NSInteger profileSelectedIndex;
    
    
}



@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


- (IBAction)addNewProfile:(id)sender;


- (IBAction)deleteProfile:(id)sender;

@property (weak, nonatomic) IBOutlet UIView *profileView;


@end
