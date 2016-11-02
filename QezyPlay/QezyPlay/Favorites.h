//
//  Favorites.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef Favorites_h
#define Favorites_h

#import <UIKit/UIKit.h>

@interface Favorites : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
{
    NSMutableArray *channelLogo;
    NSMutableArray *channelURL;
    //NSInteger selectedRow;
}
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;



@end

#endif /* Favorites_h */
