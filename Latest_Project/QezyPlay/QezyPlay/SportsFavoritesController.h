//
//  SportsFavoritesController.h
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SportsFavoritesController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *sportsCollectionView;
@property (strong, nonatomic) NSMutableArray *sportsChannelImage;
@property (strong, nonatomic) NSMutableArray *sportsChannelLink;

@end
