//
//  FavoritesViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritesViewController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate> {
    
    NSMutableArray *channelImages;
    NSMutableArray *channelLink;
    NSMutableArray *channelGroup;
    
    NSMutableArray *newsImage;
    NSMutableArray *newsLink;
    
    NSMutableArray *musicImage;
    NSMutableArray *musicLink;
    
    NSMutableArray *entertainImage;
    NSMutableArray *entertainLink;
    
    NSMutableArray *sportsImage;
    NSMutableArray *sportsLink;
    
}


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

- (IBAction)buttonActionAllFavorites:(id)sender;
- (IBAction)buttonActionNewsFavorites:(id)sender;
- (IBAction)buttonActionMusicFavorites:(id)sender;
- (IBAction)buttonActionEntertainmentFavorites:(id)sender;
- (IBAction)buttonActionSportsFavorites:(id)sender;
- (IBAction)searchButtonClick:(id)sender;

@end
