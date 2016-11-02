//
//  SearchFavoritesController.m
//  QezyPlay
//
//  Created by MacBook Pro on 29/08/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "SearchFavoritesController.h"
#import "ChannelCell.h"

@interface SearchFavoritesController ()

@end

@implementation SearchFavoritesController
int channelNotFound = 0;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"Search Channel Images:%@", self.searchChannelImage);
    NSLog(@"Search Channel Links:%@", self.searchChannelLink);
    
    UISearchBar *searchBar = [UISearchBar new];
    searchBar.delegate = self;
    searchBar.showsCancelButton = YES;
    self.navigationItem.titleView = searchBar;
    
    if ([self respondsToSelector:@selector(setNeedsStatusBarAppearanceUpdate)]) {
        // iOS 7
        [self prefersStatusBarHidden];
        [self performSelector:@selector(setNeedsStatusBarAppearanceUpdate)];
    } else {
        // iOS 6
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
    }

}

// Add this Method
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

//viewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.searchCollectionView reloadData];
}

#pragma mark - numberOfSectionsInCollectionView

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - numberOfItemsInSection

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //    return [channelLogo count];
    int rowCount;
    if(self.isFiltered)
        rowCount = (int)self.filteredTableData.count;
    else
        rowCount = (int)[self.searchChannelImage count];
    
    return rowCount;
}

#pragma mark - cellForItemAtIndexPath

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"searchFavoritesCell";
    
    ChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    NSString *str1;
    
    if(self.isFiltered)
        str1 = [self.filteredTableData objectAtIndex:indexPath.row];
    else
        str1 = [self.searchChannelImage objectAtIndex:indexPath.row];
    
    
    //  NSLog(@"%li", (long)indexPath.row);
    cell.searchImageCell.image = [UIImage imageNamed:str1];
    return cell;
}

#pragma mark - didSelectItemAtIndexPath

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    // TODO: Select Item
    if(self.isFiltered)
        self.nameSelected = [self.filteredTableData objectAtIndex:[indexPath row]];
    else
        self.nameSelected = [self.searchChannelImage objectAtIndex:[indexPath row]];
    
    NSLog(@"Name: %@ ...", self.nameSelected);
    
}

#pragma mark - didDeselectItemAtIndexPath

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    // TODO: Deselect item
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(150.0, 150.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5,5,5,5);
}

//*****************
// SEARCH BAR
//*****************

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    //NSLog(@"searchBar ... text.length: %d", text.length);
    
    if(text.length == 0)
    {
        self.isFiltered = FALSE;
        [searchBar resignFirstResponder];
    }
    else
    {
        self.isFiltered = true;
        self.filteredTableData = [[NSMutableArray alloc] init];
        
        for (NSString* item in self.searchChannelImage)
        {
            //case insensative search - way cool
            if ([item rangeOfString:text options:NSCaseInsensitiveSearch].location != NSNotFound)
            {
                [self.filteredTableData addObject:item];
            }
            if ([item isEqualToString:@"Zeal.png"])//taratv-1.png & Zeal.png
            {
                //                NSLog(@"Selected LOGO found.");
            }
            else
            {
                //              NSLog(@"Selected LOGO not found.");
                channelNotFound++;
            }
        }
    }//end if-else
    
    //Channel Not Found.
    if (channelNotFound == [self.searchChannelImage count]) {
        NSLog(@"Selected LOGO not found.");
        NSLog(@"Item Not Found:%d", channelNotFound);
        channelNotFound = 0;
        
        
    }
    [self.searchCollectionView reloadData];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //User hit Search button on Keyboard
    [searchBar resignFirstResponder];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    searchBar.text=@"";
    
    [searchBar setShowsCancelButton:NO animated:YES];
    [searchBar resignFirstResponder];
    
    self.isFiltered = FALSE;
    [self.searchCollectionView reloadData];
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
