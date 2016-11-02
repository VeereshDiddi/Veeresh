//
//  MusicFavoritesController.h
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MusicFavoritesController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *musicCollectionView;
@property (strong, nonatomic) NSMutableArray *musicChannelImage;
@property (strong, nonatomic) NSMutableArray *musicChannelLink;

@end
