//
//  FavoritesViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "FavoritesViewController.h"
#import "ChannelCell.h"
#import "VideoPlayer.h"
#import "Player.h"
#import "VarGlobal.h"
#import "FavoriteData.h"

#import "SearchFavoritesController.h"


@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (IBAction)respondToTapGesture:(UITapGestureRecognizer *)recognizer {
    UICollectionView *view = (UICollectionView *)recognizer.view;
    CGPoint point = [recognizer locationInView:recognizer.view];
    
    NSIndexPath *indexPath = [view indexPathForItemAtPoint:point];
    
    if(indexPath) {
        NSLog(@"respondToTapGesture: index %d", indexPath.row);
        
        [self streamItemAtIndexPath:indexPath];
    }
}

- (IBAction)respondToLongPressGesture:(UILongPressGestureRecognizer *)recognizer {
    
    if(recognizer.state == UIGestureRecognizerStateBegan) {
        
        UICollectionView *view = (UICollectionView *)recognizer.view;
        CGPoint point = [recognizer locationInView:recognizer.view];
        
        NSIndexPath *indexPath = [view indexPathForItemAtPoint:point];
        
        if(indexPath) {
            NSLog(@"respondToLongPressGesture: index %d", indexPath.row);
            
            UIAlertController *options = [UIAlertController alertControllerWithTitle:@"Options"
                                                                             message:nil
                                                                      preferredStyle:UIAlertControllerStyleAlert];
            
            [options addAction:[UIAlertAction actionWithTitle:@"Play"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self streamItemAtIndexPath:indexPath];
                                                      }]];
            
            [options addAction:[UIAlertAction actionWithTitle:@"Delete"
                                                        style:UIAlertActionStyleDestructive
                                                      handler:^(UIAlertAction *action) {
                                                          [self deleteItemAtIndexPath:indexPath];
                                                      }]];
            
            [options addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                      }]];
            
            [self presentViewController:options animated:YES completion:nil];
        }
    }
}
    
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Configure gesture recognizers
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.collectionView addGestureRecognizer:tapRecognizer];
    
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(respondToLongPressGesture:)];
    longPressRecognizer.minimumPressDuration = 0.5;
    [self.collectionView addGestureRecognizer:longPressRecognizer];

 
    self.collectionView.alwaysBounceVertical = YES;
}

- (void)viewWillAppear:(BOOL)animated
{
    currentImages = [NSMutableArray arrayWithArray:allFavoriteImages];
    currentLinks = [NSMutableArray arrayWithArray:allFavoriteLinks];
    [self.collectionView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return currentImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"FavoritesCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *imageName = [currentImages objectAtIndex:indexPath.row];
    cell.imgCell.image = [UIImage imageNamed:imageName];
//    [cell.imgCell.layer setBorderWidth:1.0];
    
    return cell;
}

- (void)streamItemAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    NSString *link = [currentLinks objectAtIndex:indexPath.row];
    
    NSLog(@"selected channel %@", link);
    
    VideoPlayer *videoPlayer = (VideoPlayer *)
    [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
    
    videoPlayer.streamUrl = link;
    
    player->isPresented = true;
    player->isPlaying = true;
    
    player->appTimeOut = DEFAULT_TIMEOUT;
    
    //[self.navigationController pushViewController:player animated:YES];
    [self presentViewController:videoPlayer animated:YES completion:nil];
}

- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath {
    [self.collectionView performBatchUpdates:^{
        NSString *image = [currentImages objectAtIndex:indexPath.row];
        NSString *link  = [currentLinks objectAtIndex:indexPath.row];
        
        [currentImages removeObjectAtIndex:indexPath.row];
        [currentLinks removeObjectAtIndex:indexPath.row];
        
        NSInteger index = [allFavoriteImages indexOfObject:image];
        NSString *group = [allFavoriteGroups objectAtIndex:index];
        
        [allFavoriteImages removeObjectAtIndex:index];
        [allFavoriteLinks removeObjectAtIndex:index];
        [allFavoriteGroups removeObjectAtIndex:index];
        
        if([group caseInsensitiveCompare:@"news"] == NSOrderedSame){
            [newsFavoriteImages removeObject:image];
            [newsFavoriteLinks removeObject:link];
        }
        else if([group caseInsensitiveCompare:@"music"] == NSOrderedSame){
            [musicFavoriteImages removeObject:image];
            [musicFavoriteLinks removeObject:link];
        }
        else if([group caseInsensitiveCompare:@"entertainment"] == NSOrderedSame){
            [entertainFavoriteImages removeObject:image];
            [entertainFavoriteLinks removeObject:link];
        }
        else if([group caseInsensitiveCompare:@"sports"] == NSOrderedSame){
            [sportsFavoriteImages removeObject:image];
            [sportsFavoriteLinks removeObject:link];
        }
        
        [deviceDB deleteRecordFromFavorites:image];
        
        NSArray *indexPathArray = [NSArray arrayWithObjects:indexPath, nil];
        
        [self.collectionView deleteItemsAtIndexPaths:indexPathArray];
    } completion:nil];
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(150.0, 150.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5,5,5,5);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

// delete/add objects to transform currentImages and currentLinks to newImages and newLinks
- (void)transitionToImages:(NSMutableArray *)newImages
                   toLinks:(NSMutableArray *)newLinks {

    [self.collectionView performBatchUpdates:^{
        
        NSMutableArray *indexPathsToDelete = [NSMutableArray array];
        NSMutableIndexSet *indexesToDelete = [[NSMutableIndexSet alloc] init];
        
        for(NSUInteger index = 0; index < currentImages.count; ++index)
        {
            if([newImages indexOfObject:[currentImages objectAtIndex:index]] == NSNotFound)
            {
                [indexesToDelete addIndex:index];
                [indexPathsToDelete addObject:[NSIndexPath indexPathForRow:index inSection:0]];
            }
        }
        
        [currentImages removeObjectsAtIndexes:indexesToDelete];
        [currentLinks removeObjectsAtIndexes:indexesToDelete];
        
        [self.collectionView deleteItemsAtIndexPaths:indexPathsToDelete];
        
        NSMutableArray *indexPathsToInsert = [NSMutableArray array];
        
        for(NSUInteger index = 0; index < newImages.count; ++index)
        {
            if([currentImages indexOfObject:[newImages objectAtIndex:index]] == NSNotFound)
            {
                [currentImages insertObject:[newImages objectAtIndex:index] atIndex:index];
                [currentLinks insertObject:[newLinks objectAtIndex:index] atIndex:index];
                [indexPathsToInsert addObject:[NSIndexPath indexPathForRow:index inSection:0]];
            }
        }
        
        [self.collectionView insertItemsAtIndexPaths:indexPathsToInsert];
        
    } completion:nil];
}

- (IBAction)buttonActionAllFavorites:(id)sender {
    NSLog(@"buttonActionAllFavorites");  //goto_allFavorites
    
    [self transitionToImages:allFavoriteImages toLinks:allFavoriteLinks];
}

- (IBAction)buttonActionNewsFavorites:(id)sender {
    NSLog(@"buttonActionNewsFavorites"); //goto_newsFavorites
    
    [self transitionToImages:newsFavoriteImages toLinks:newsFavoriteLinks];
}


- (IBAction)buttonActionMusicFavorites:(id)sender {
    NSLog(@"buttonActionMusicFavorites");  //goto_musicFavorites

    [self transitionToImages:musicFavoriteImages toLinks:musicFavoriteLinks];
}

- (IBAction)buttonActionEntertainmentFavorites:(id)sender {
    NSLog(@"buttonActionEntertainmentFavorites");  //goto_entertainmentFavorites
    
    [self transitionToImages:entertainFavoriteImages toLinks:entertainFavoriteLinks];
}

- (IBAction)buttonActionSportsFavorites:(id)sender {
    NSLog(@"buttonActionSportsFavorites");  //goto_sportsFavorites
    
    [self transitionToImages:sportsFavoriteImages toLinks:sportsFavoriteLinks];
}

- (IBAction)searchButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"goto_searchFavorites" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"goto_searchFavorites"]) {
        SearchFavoritesController *searchObj = [segue destinationViewController];
        searchObj.searchChannelImage = currentImages;
        searchObj.searchChannelLink = currentLinks;
    }
}

@end
