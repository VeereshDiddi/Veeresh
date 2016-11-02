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

#import "AllFavoritesController.h"
#import "NewsFavoritesController.h"
#import "MusicFavoritesController.h"
#import "EntertainmentFavoritesController.h"
#import "SportsFavoritesController.h"
#import "SearchFavoritesController.h"


@interface FavoritesViewController ()

@end

@implementation FavoritesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    channelImages = [NSMutableArray arrayWithObjects:@"AppleTV.jpg", @"BBC.jpg", @"Discovery.jpg", nil];
    
    channelLink = [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch7/auto", nil];

    newsImage = [NSMutableArray arrayWithObjects:@"IndiaToday.png", @"CNN.jpg", nil];
    newsLink = [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", nil];
    for (NSString *nImage in newsImage) {
        [channelImages addObject:nImage];
    }
    for (NSString *nLink in newsLink) {
        [channelLink addObject:nLink];
    }
//    NSLog(@"***addObjectsFromArray&&&:%@ ", channelImages);
//    NSLog(@"***addObjectsFromArray&&&:%@ ", channelLink);

    
    musicImage = [NSMutableArray arrayWithObjects:@"MusicIndia.png", @"MusicAmazon.jpeg", nil];
    musicLink = [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", nil];
    for (NSString *mImage in musicImage) {
        [channelImages addObject:mImage];
    }
    for (NSString *mLink in musicLink) {
        [channelLink addObject:mLink];
    }
    
    entertainImage = [NSMutableArray arrayWithObjects:@"Sony.png", @"TrueEntertain.jpeg", nil];
    entertainLink = [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", nil];
    for (NSString *eImage in entertainImage) {
        [channelImages addObject:eImage];
    }
    for (NSString *eLink in entertainLink) {
        [channelLink addObject:eLink];
    }
    
    sportsImage = [NSMutableArray arrayWithObjects:@"Sports.jpeg",@"StarSports.jpeg", nil];
    sportsLink = [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", nil];
    for (NSString *sImage in sportsImage) {
        [channelImages addObject:sImage];
    }
    for (NSString *sLink in sportsLink) {
        [channelLink addObject:sLink];
    }
    
    self.collectionView.alwaysBounceVertical = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return channelImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"FavoritesCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSString *imageName = [channelImages objectAtIndex:indexPath.row];
    cell.imgCell.image = [UIImage imageNamed:imageName];
//    [cell.imgCell.layer setBorderWidth:1.0];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    NSString *link = [channelLink objectAtIndex:indexPath.row];
    
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

- (IBAction)buttonActionAllFavorites:(id)sender {
    NSLog(@"buttonActionAllFavorites");  //goto_allFavorites
    
    [self performSegueWithIdentifier:@"goto_allFavorites" sender:self];
    
}

- (IBAction)buttonActionNewsFavorites:(id)sender {
    NSLog(@"buttonActionNewsFavorites");    //goto_newsFavorites
    [self performSegueWithIdentifier:@"goto_newsFavorites" sender:self];
}

- (IBAction)buttonActionMusicFavorites:(id)sender {
    NSLog(@"buttonActionMusicFavorites");  ////goto_musicFavorites

    [self performSegueWithIdentifier:@"goto_musicFavorites" sender:self];
}

- (IBAction)buttonActionEntertainmentFavorites:(id)sender {
    NSLog(@"buttonActionEntertainmentFavorites");  //goto_entertainmentFavorites
    
    [self performSegueWithIdentifier:@"goto_entertainmentFavorites" sender:self];
}

- (IBAction)buttonActionSportsFavorites:(id)sender {
    NSLog(@"buttonActionSportsFavorites");  //goto_sportsFavorites
    
    [self performSegueWithIdentifier:@"goto_sportsFavorites" sender:self];
}

- (IBAction)searchButtonClick:(id)sender {
    [self performSegueWithIdentifier:@"goto_searchFavorites" sender:nil];
}



- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"goto_allFavorites"]) {
        AllFavoritesController *allObj = [segue destinationViewController];
        allObj.allChannelImages = channelImages;
        allObj.allChannelLink = channelLink;
    }
    
    if ([[segue identifier]isEqualToString:@"goto_newsFavorites"]) {
        NewsFavoritesController *newsObj = [segue destinationViewController];
        newsObj.newsChannelImage = newsImage;
        newsObj.newsChannelLink = newsLink;
    }
    
    if ([[segue identifier]isEqualToString:@"goto_musicFavorites"])
    {
        MusicFavoritesController *musicObj = [segue destinationViewController];
        musicObj.musicChannelImage = musicImage;
        musicObj.musicChannelLink = musicLink;
    }
    
    if ([[segue identifier]isEqualToString:@"goto_entertainmentFavorites"])
    {
        EntertainmentFavoritesController *entertainObj = [segue destinationViewController];
        entertainObj.entertainChannelImage = entertainImage;
        entertainObj.entertainChannelLink = entertainLink;
    }
    
    if ([[segue identifier]isEqualToString:@"goto_sportsFavorites"])
    {
        SportsFavoritesController *sportsObj = [segue destinationViewController];
        sportsObj.sportsChannelImage = sportsImage;
        sportsObj.sportsChannelLink = sportsLink;
    }
    
    if ([[segue identifier]isEqualToString:@"goto_searchFavorites"]) {
        SearchFavoritesController *searchObj = [segue destinationViewController];
        searchObj.searchChannelImage = channelImages;
        searchObj.searchChannelLink = channelLink;
        }

}

@end
