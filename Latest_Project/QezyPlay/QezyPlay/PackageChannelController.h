//
//  PackageChannelController.h
//  QezyPlay
//
//  Created by MacBook Pro on 30/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PackageChannelController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *packageCollectionView;

@property (strong, nonatomic) NSArray *packageChannelImages;
@property (strong, nonatomic) NSArray *packageChannelLinks;
@end
