//
//  FavoritesViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewController : UIViewController <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate, UIGestureRecognizerDelegate> {
    
/*    NSMutableArray *allImages;
    NSMutableArray *allLinks;
    NSMutableArray *allGroups;
    
    NSMutableArray *newsImages;
    NSMutableArray *newsLinks;
    
    NSMutableArray *musicImages;
    NSMutableArray *musicLinks;
    
    NSMutableArray *entertainImages;
    NSMutableArray *entertainLinks;
    
    NSMutableArray *sportsImages;
    NSMutableArray *sportsLinks;
*/    
    NSMutableArray *currentImages;
    NSMutableArray *currentLinks;
    NSString       *currentCategory;
    
}


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;


@property (strong, nonatomic) IBOutlet UIButton *bntAll;
@property (strong, nonatomic) IBOutlet UIButton *bntNews;
@property (strong, nonatomic) IBOutlet UIButton *bntMusic;
@property (strong, nonatomic) IBOutlet UIButton *bntEntertainments;
@property (strong, nonatomic) IBOutlet UIButton *bntSports;


- (IBAction)buttonActionAllFavorites:(id)sender;
- (IBAction)buttonActionNewsFavorites:(id)sender;
- (IBAction)buttonActionMusicFavorites:(id)sender;
- (IBAction)buttonActionEntertainmentFavorites:(id)sender;
- (IBAction)buttonActionSportsFavorites:(id)sender;
- (IBAction)searchButtonClick:(id)sender;
- (IBAction)addButtonClick:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *favoritesView;

@end