//
//  NewsFavoritesController.h
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsFavoritesController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *newsCollectionView;
@property(strong, nonatomic) NSMutableArray *newsChannelImage;
@property(strong, nonatomic) NSMutableArray *newsChannelLink;

@end
