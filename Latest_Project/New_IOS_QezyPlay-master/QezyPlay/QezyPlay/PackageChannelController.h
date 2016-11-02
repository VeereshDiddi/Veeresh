//
//  PackageChannelController.h
//  QezyPlay
//
//  Created by MacBook Pro on 30/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackageChannelController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    NSMutableArray *newsImages;
    NSMutableArray *newsLinks;
    
    NSMutableArray *musicImages;
    NSMutableArray *musicLinks;
    
    NSMutableArray *entertainImages;
    NSMutableArray *entertainLinks;
    
    NSMutableArray *sportsImages;
    NSMutableArray *sportsLinks;
    
    NSMutableArray *currentImages;
    NSMutableArray *currentLinks;
    NSString       *currentCategory;
    
    
}

@property (strong, nonatomic) NSString *navigationTitle;
@property (strong, nonatomic) NSMutableArray *allImages;
@property (strong, nonatomic) NSMutableArray *allLinks;
@property (strong, nonatomic) NSMutableArray *allGroups;

@property (strong, nonatomic) IBOutlet UICollectionView *packageCollectionView;



//@property (strong, nonatomic) NSArray *packageChannelImages;
//@property (strong, nonatomic) NSArray *packageChannelLinks;


- (IBAction)allClicked:(id)sender;

- (IBAction)newsClicked:(id)sender;

- (IBAction)musicClicked:(id)sender;

- (IBAction)entertainmentClicked:(id)sender;
- (IBAction)sportsClicked:(id)sender;

- (IBAction)searchClicked:(id)sender;

@end
