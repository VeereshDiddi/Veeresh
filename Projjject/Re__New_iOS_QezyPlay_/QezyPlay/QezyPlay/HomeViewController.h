//
//  HomeViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
    <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    NSArray *packageImages;
    NSArray *packageName;
    NSDictionary *packageDictImages;
    NSDictionary *packageDictLinks;
    NSString *packageSelected;
    NSArray *packageImagesSelected;
    NSArray *packageLinksSelected;
}

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

@end
