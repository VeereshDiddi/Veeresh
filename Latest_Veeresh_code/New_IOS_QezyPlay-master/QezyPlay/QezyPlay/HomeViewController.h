//
//  HomeViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    NSMutableArray *packageImages;
    NSMutableArray *packageName;
    NSDictionary *packageDictImages;
    NSDictionary *packageDictLinks;
    NSDictionary *packageDictGroups;
    
    NSString *packageSelected;
    NSMutableArray *packageImagesSelected;
    NSMutableArray *packageLinksSelected;
    NSMutableArray *packageGroupsSelected;
}


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end
