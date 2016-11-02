//
//  PackageChannelController.m
//  QezyPlay
//
//  Created by MacBook Pro on 30/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "PackageChannelController.h"
#import "PackageCell.h"
#import "VideoPlayer.h"
#import "Player.h"
#import "VarGlobal.h"
#import "SearchChannelViewController.h"
#import "FavoriteData.h"


@interface PackageChannelController ()

@end

@implementation PackageChannelController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = self.navigationTitle;
    
    NSLog(@"*** PackageChannelController ***");
    NSLog(@"Package Channel Images:%@", self.allImages);
    NSLog(@"Package Group: %@", self.allGroups);
    NSLog(@"Package Link: %@", self.allLinks);
    
    // Configure gesture recognizers
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]
                                             initWithTarget:self action:@selector(respondToTapGesture:)];
    tapRecognizer.numberOfTapsRequired = 1;
    [self.packageCollectionView addGestureRecognizer:tapRecognizer];
    
    UILongPressGestureRecognizer *longPressRecognizer = [[UILongPressGestureRecognizer alloc]
                                                         initWithTarget:self action:@selector(respondToLongPressGesture:)];
    longPressRecognizer.minimumPressDuration = 0.5;
    [self.packageCollectionView addGestureRecognizer:longPressRecognizer];
    
    newsImages = [[NSMutableArray alloc] init];
    newsLinks = [[NSMutableArray alloc] init];
    
    musicImages = [[NSMutableArray alloc] init];
    musicLinks = [[NSMutableArray alloc] init];
    
    entertainImages = [[NSMutableArray alloc] init];
    entertainLinks = [[NSMutableArray alloc] init];
    
    sportsImages = [[NSMutableArray alloc] init];
    sportsLinks = [[NSMutableArray alloc] init];
    
    NSInteger numObj = [self.allImages count];
    
    for (int index = 0; index < numObj; index++){
        
        NSString * group = [self.allGroups objectAtIndex:index];
        NSLog(@"string value at index %d of %d %@", index, numObj, group);
        
        if([group caseInsensitiveCompare:@"news"] == NSOrderedSame){
            [newsImages addObject:[self.allImages objectAtIndex:index]];
            [newsLinks addObject:[self.allLinks objectAtIndex:index]];
        }
        else if([group caseInsensitiveCompare:@"music"] == NSOrderedSame){
            [musicImages addObject:[self.allImages objectAtIndex:index]];
            [musicLinks addObject:[self.allLinks objectAtIndex:index]];
        }
        else if([group caseInsensitiveCompare:@"entertainment"] == NSOrderedSame){
            [entertainImages addObject:[self.allImages objectAtIndex:index]];
            [entertainLinks addObject:[self.allLinks objectAtIndex:index]];
        }
        else if([group caseInsensitiveCompare:@"sports"] == NSOrderedSame){
            [sportsImages addObject:[self.allImages objectAtIndex:index]];
            [sportsLinks addObject:[self.allLinks objectAtIndex:index]];
        }
        
    }
    
    currentImages = [NSMutableArray arrayWithArray:self.allImages];
    currentLinks = [NSMutableArray arrayWithArray:self.allLinks];
    
    self.packageCollectionView.alwaysBounceVertical = YES;
}


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
            
            [options addAction:[UIAlertAction actionWithTitle:@"Add to Favorites"
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction *action) {
                                                          [self addToFavoritesFromIndexPath:indexPath];
                                                      }]];
            
            [options addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                        style:UIAlertActionStyleCancel
                                                      handler:^(UIAlertAction *action) {
                                                      }]];
            
            [self presentViewController:options animated:YES completion:nil];
        }
    }
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [currentImages count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"packageChannelCell";
    
    PackageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSString *imageName = [currentImages objectAtIndex:indexPath.row];


    cell.channelCell.image = [UIImage imageNamed:imageName];
    
    return cell;
}

- (void)streamItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    NSString *link = [self.allLinks objectAtIndex:indexPath.row];
    
    NSLog(@"selected channel %@", link);
    
    VideoPlayer *videoPlayer = (VideoPlayer *)
    [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
    
    videoPlayer.streamUrl = link;
    
    player->isPresented = true;
    player->isPlaying = true;
    
    player->appTimeOut = DEFAULT_TIMEOUT;
    
    //[self.navigationController pushViewController:player animated:YES];
    [self presentViewController:videoPlayer animated:YES completion:nil];
    
    //    NSLog(@"Selected Channel Link:%@", [self.packageChannelLinks objectAtIndex:indexPath.row]);
    
}

-(void)addToFavoritesFromIndexPath:(NSIndexPath *)indexPath
{
    NSString *image = [currentImages objectAtIndex:indexPath.row];
    NSString *link  = [currentLinks objectAtIndex:indexPath.row];
    NSString *group = [self.allGroups objectAtIndex:[self.allImages indexOfObject:image]];
    
    NSLog(@"%@", image);
    
    if([allFavoriteImages indexOfObject:image] != NSNotFound)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Cannot Add"
                                                                       message:@"Selection is already in favorites"
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"OK"
                                                  style:UIAlertActionStyleDefault
                                                handler:^(UIAlertAction *action){}]];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        return;
    }
    
    [allFavoriteImages  addObject:image];
    [allFavoriteLinks   addObject:link];
    [allFavoriteGroups  addObject:group];
    
    if([group caseInsensitiveCompare:@"news"] == NSOrderedSame){
        [newsFavoriteImages addObject:image];
        [newsFavoriteLinks addObject:link];
    }
    else if([group caseInsensitiveCompare:@"music"] == NSOrderedSame){
        [musicFavoriteImages addObject:image];
        [musicFavoriteLinks addObject:link];
    }
    else if([group caseInsensitiveCompare:@"entertainment"] == NSOrderedSame){
        [entertainFavoriteImages addObject:image];
        [entertainFavoriteLinks addObject:link];
    }
    else if([group caseInsensitiveCompare:@"sports"] == NSOrderedSame){
        [sportsFavoriteImages addObject:image];
        [sportsFavoriteLinks addObject:link];
    }
    
    NSMutableArray * channelInfo = [[NSMutableArray alloc] init];
    
    [channelInfo addObject:image];
    [channelInfo addObject:link];
    [channelInfo addObject:group];
    
    [deviceDB insertRecordIntoFavorites:channelInfo];
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(150.0, 150.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5,5,5,5);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)allClicked:(id)sender {
    NSLog(@"buttonActionAll");
    
    [self transitionToImages:self.allImages toLinks:self.allLinks];
}

- (IBAction)newsClicked:(id)sender {
    
    NSLog(@"buttonActionNews");
    
    [self transitionToImages:newsImages toLinks:newsLinks];
}

- (IBAction)musicClicked:(id)sender {
    NSLog(@"buttonActionMusic");
    
    [self transitionToImages:musicImages toLinks:musicLinks];
    
}

- (IBAction)entertainmentClicked:(id)sender {
    NSLog(@"buttonActionEntertainment");
    
    [self transitionToImages:entertainImages toLinks:entertainLinks];
}

- (IBAction)sportsClicked:(id)sender {
    NSLog(@"buttonActionSports");
    
    [self transitionToImages:sportsImages toLinks:sportsLinks];
}

- (IBAction)searchClicked:(id)sender {
    
    [self performSegueWithIdentifier:@"goto_searchChannels" sender:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"goto_searchChannels"]) {
        SearchChannelViewController *searchObj = [segue destinationViewController];
        searchObj.searchChannelImage = currentImages;
        searchObj.searchChannelLink = currentLinks;
    }
}

// delete/add objects to transform currentImages and currentLinks to newImages and newLinks
- (void)transitionToImages:(NSMutableArray *)newImages
                   toLinks:(NSMutableArray *)newLinks {
    
    [self.packageCollectionView performBatchUpdates:^{
        
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
        
        [self.packageCollectionView deleteItemsAtIndexPaths:indexPathsToDelete];
        
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
        
        [self.packageCollectionView insertItemsAtIndexPaths:indexPathsToInsert];
        
    } completion:nil];
}



@end
