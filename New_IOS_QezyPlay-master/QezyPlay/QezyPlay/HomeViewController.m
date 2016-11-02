//
//  HomeViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "HomeViewController.h"
#import "PackageCell.h"
#import "PackageChannelController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //goto_package
    packageImages = [NSMutableArray arrayWithObjects:@"Games.jpeg", @"English.jpeg", @"Telugu.jpeg", nil];
    
    packageName = [NSMutableArray arrayWithObjects:@"Sports", @"English", @"Telugu", nil];

    packageImagesSelected = [[NSMutableArray alloc] init];
    packageLinksSelected = [[NSMutableArray alloc] init];
    packageGroupsSelected = [[NSMutableArray alloc] init];
    packageDictImages = [NSDictionary dictionaryWithObjectsAndKeys:[NSMutableArray arrayWithObjects:@"Game1.jpeg", @"Game2.png", @"Game3.jpeg",nil],@"Games.jpeg", [NSMutableArray arrayWithObjects:@"English1.jpeg", @"English2.jpeg", nil],@"English.jpeg", [NSMutableArray arrayWithObjects:@"Telugu1.jpeg", @"Telugu2.jpeg", @"Telugu3.jpeg", nil], @"Telugu.jpeg", nil];
    packageDictLinks = [NSDictionary dictionaryWithObjectsAndKeys:[NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil],@"Games.jpeg", [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", nil],@"English.jpeg", [NSMutableArray arrayWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil], @"Telugu.jpeg", nil];
    packageDictGroups = [NSDictionary dictionaryWithObjectsAndKeys:[NSMutableArray arrayWithObjects:@"news", @"music", @"sports",nil],@"Games.jpeg", [NSMutableArray arrayWithObjects:@"entertainment", @"sports", nil],@"English.jpeg", [NSMutableArray arrayWithObjects:@"entertainment", @"news", @"music", nil], @"Telugu.jpeg", nil];
   // NSLog(@"*****Package Dictionary Images*****:%@", packageDictImages);
   // NSLog(@"*****Package Dictionary Images*****:%@", packageGroups);
    
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
    return packageImages.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PackageCell";
    
    PackageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSString *imageName = [packageImages objectAtIndex:indexPath.row];
    cell.imgCell.image = [UIImage imageNamed:imageName];
    
    cell.lblCell.text = [packageName objectAtIndex:indexPath.row];
    
    
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    packageSelected = [packageImages objectAtIndex:[indexPath row]];
    
    NSLog(@"Selected Package Name: %@ ...", packageSelected);
    
    for (NSString *key in packageImages) {
        if ([key isEqualToString:packageSelected]) {
            packageImagesSelected = [packageDictImages valueForKey:key];
            packageLinksSelected = [packageDictLinks valueForKey:key];
            packageGroupsSelected = [packageDictGroups valueForKey:key];
            
        }
    }
    
    [self performSegueWithIdentifier:@"goto_package" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([[segue identifier]isEqualToString:@"goto_package"]) {
        
        PackageChannelController *packageObj = [segue destinationViewController];
        packageObj.allImages =packageImagesSelected;
        packageObj.allLinks = packageLinksSelected;
        packageObj.allGroups = packageGroupsSelected;
        packageObj.navigationTitle = packageSelected;
        
    }
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

@end
