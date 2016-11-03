//
//  SearchChannelViewController.h
//  QezyPlay
//
//  Created by ideabytes on 2016-09-04.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchChannelViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UISearchBarDelegate>


@property (strong, nonatomic) IBOutlet UICollectionView *searchCollectionView;


@property (strong, nonatomic) NSMutableArray *searchChannelImage;
@property (strong, nonatomic) NSMutableArray *searchChannelLink;

@property (strong, nonatomic) NSMutableString *nameSelected;
@property(strong, nonatomic) NSMutableString *urlSelected;


//SEARCH BAR
@property (strong, nonatomic) NSMutableArray* filteredTableData;

@property (nonatomic, assign) bool isFiltered;

@end
