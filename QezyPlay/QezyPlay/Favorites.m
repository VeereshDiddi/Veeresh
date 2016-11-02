//
//  Favorites.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "Favorites.h"

@interface Favorites ()

@end

@implementation Favorites

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    channelLogo = [[NSMutableArray alloc] initWithObjects:@"BBC.jpg", @"AppleTV.jpg", @"Discovery.jpg", nil];
    
    channelURL = [[NSMutableArray alloc] initWithObjects:@"www.bbc.com", @"www.appleTV.com", @"www.discovery.com", nil];
    
//    [self.collectionView setDataSource:self];
//    [self.collectionView setDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [channelLogo count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:1];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@", [channelLogo objectAtIndex:indexPath.row]]];
    NSLog(@"%li", (long)indexPath.row);
//    cell.backgroundColor = [UIColor redColor];

    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    //selectedRow = indexPath.row;
    //[self performSegueWithIdentifier:@"channelView" sender:self];
    NSString *link = [channelURL objectAtIndex:indexPath.row];
    
    NSLog(@"selected channel Link: %@", link);
}



#pragma mark - UICollectionViewFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat picDimension = self.view.frame.size.width / 4.0f;
    return CGSizeMake(picDimension, picDimension);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat leftRightInset = self.view.frame.size.width / 14.0f;
    return UIEdgeInsetsMake(0, leftRightInset, 0, leftRightInset);
}


@end


