//
//  MusicFavoritesController.m
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "MusicFavoritesController.h"
#import "ChannelCell.h"
#import "VideoPlayer.h"
#import "Player.h"
#import "VarGlobal.h"


@interface MusicFavoritesController ()

@end

@implementation MusicFavoritesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"*****MusicFavoritesController******");
    NSLog(@"Music Channel Images:%@", self.musicChannelImage);
    NSLog(@"Music Channel Links:%@", self.musicChannelLink);
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.musicChannelImage count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"musicFavoritesCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *imageName = [self.musicChannelImage objectAtIndex:indexPath.row];
    cell.musicImageCell.image = [UIImage imageNamed:imageName];
    //    [cell.imgCell.layer setBorderWidth:1.0];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
     bundle:nil];
     
     NSString *link = [self.musicChannelLink objectAtIndex:indexPath.row];
     
     NSLog(@"selected channel %@", link);
     
     VideoPlayer *videoPlayer = (VideoPlayer *)
     [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
     
     videoPlayer.streamUrl = link;
     
     player->isPresented = true;
     player->isPlaying = true;
     
     player->appTimeOut = DEFAULT_TIMEOUT;
     
     //[self.navigationController pushViewController:player animated:YES];
     [self presentViewController:videoPlayer animated:YES completion:nil];
    
//    NSLog(@"Selected Channel Link:%@", [self.musicChannelLink objectAtIndex:indexPath.row]);
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    float cellWidth = (CGRectGetWidth(collectionView.frame) - (flowLayout.sectionInset.left + flowLayout.sectionInset.right) - flowLayout.minimumInteritemSpacing) / 3;
    return CGSizeMake(cellWidth, cellWidth);
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

@end
