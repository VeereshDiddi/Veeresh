//
//  EntertainmentFavoritesController.h
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EntertainmentFavoritesController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>
@property (weak, nonatomic) IBOutlet UICollectionView *entertainCollectionView;
@property (strong, nonatomic) NSMutableArray *entertainChannelImage;
@property (strong, nonatomic) NSMutableArray *entertainChannelLink;

@end
