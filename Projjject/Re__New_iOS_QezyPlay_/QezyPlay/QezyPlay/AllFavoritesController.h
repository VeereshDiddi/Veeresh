//
//  AllFavoritesController.h
//  QezyPlay
//
//  Created by MacBook Pro on 26/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllFavoritesController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *allCollectionView;

@property(strong, nonatomic) NSMutableArray *allChannelImages;
@property(strong, nonatomic) NSMutableArray *allChannelLink;

@end
