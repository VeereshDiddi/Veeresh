//
//  HomeViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout> {
    
    //NSMutableArray * aChannel;
    NSMutableArray *allChanneInBouquet;
    
    NSMutableArray *packageImages;
    NSMutableArray *packageName;
   // NSDictionary *packageDictImages;
   // NSDictionary *packageDictLinks;
   // NSDictionary *packageDictGroups;
   // NSDictionary *packageDicDiscriptions;
    
    NSString *packageSelected;
    NSMutableArray *packageImagesSelected;
    NSMutableArray *packageLinksSelected;
    NSMutableArray *packageGroupsSelected;
    NSMutableArray *packageDiscriptionSelected;
}


@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end
