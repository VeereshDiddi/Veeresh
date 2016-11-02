//
//  SportsFavoritesController.m
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "SportsFavoritesController.h"
#import "ChannelCell.h"
#import "VideoPlayer.h"
#import "Player.h"
#import "VarGlobal.h"


@interface SportsFavoritesController ()

@end

@implementation SportsFavoritesController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSLog(@"*****SportsFavoritesController******");
    NSLog(@"Sports Channel Image:%@", self.sportsChannelImage);
    NSLog(@"Sports Channel Link:%@", self.sportsChannelLink);

}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.sportsChannelImage count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"sportsFavoritesCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *imageName = [self.sportsChannelImage objectAtIndex:indexPath.row];
    cell.sportsImageCell.image = [UIImage imageNamed:imageName];
    //    [cell.imgCell.layer setBorderWidth:1.0];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
     bundle:nil];
     
     NSString *link = [self.sportsChannelLink objectAtIndex:indexPath.row];
     
     NSLog(@"selected channel %@", link);
     
     VideoPlayer *videoPlayer = (VideoPlayer *)
     [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
     
     videoPlayer.streamUrl = link;
     
     player->isPresented = true;
     player->isPlaying = true;
     
     player->appTimeOut = DEFAULT_TIMEOUT;
     
     //[self.navigationController pushViewController:player animated:YES];
     [self presentViewController:videoPlayer animated:YES completion:nil];
     
//    NSLog(@"Selected Channel Link:%@", [self.sportsChannelLink objectAtIndex:indexPath.row]);
    
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

@end
