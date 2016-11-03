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
#import "MediaPackageHeaderView.h"
#import "HomeData.h"
#import "UserData.h"
#import "Constant.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //goto_package
    //packageImages = [NSMutableArray arrayWithObjects:@"Bangla.png",@"free-new.png", nil];
    
    //packageName = [NSMutableArray arrayWithObjects:@"Shonar Bangla",@"Free Bouquet",  nil];
    //packageImages = [NSMutableArray arrayWithObjects:@"Bangla.png", @"English.jpeg", @"Telugu.jpeg", nil];
    
    //packageName = [NSMutableArray arrayWithObjects:@"Shonar Bangla", @"English", @"Telugu", nil];

    packageImagesSelected = [[NSMutableArray alloc] init];
    packageLinksSelected = [[NSMutableArray alloc] init];
    packageGroupsSelected = [[NSMutableArray alloc] init];
    packageDiscriptionSelected = [[NSMutableArray alloc] init];
    
    
    self.collectionView.alwaysBounceVertical = YES;
}


-(void) getChannelInBouquet: (NSString*) bouquetID : (NSInteger) index {
#ifdef USE_DATABASE_FOR_CHANLIST
    // Query if database exists. If so, get info from database and return.
    //NSLog(@"HomeViewController::getChannelInBouquet() check deviceDB");
    channelList = [[NSMutableArray alloc] init];
    channelList = [deviceDB getChannelInBouquet:bouquetID];
    if (channelList.count) { // count > 0
        NSLog(@"HomeViewController::getChannelInBouquet() deviceDB channelList.count=%d", channelList.count);
        NSLog(@"Channel in bouquet from db %@", channelList);
        return;
    }
   
    // Else, we have to contact server, which is done next.
    
#endif// #ifdef USE_DATABASE_FOR_CHANLIST
    
    // If we are here, it means there was no database for this item.
    NSMutableArray * channelsInBouquet = [[NSMutableArray alloc] init];
    channelsInBouquet = [channelsInDefaultBouquets objectAtIndex:index];
    NSLog(@"HomeViewController:getChannelInBouquet() load default channels2 %@", channelsInBouquet);
    
    for (int count = 0; count < channelsInBouquet.count; count ++){
        NSDictionary* channel = [channelsInBouquet objectAtIndex:count];
        NSString *name = [channel valueForKey:@"name"];
        NSString *channelID = [channel valueForKey:@"id"];
        NSString *imageName = [channel valueForKey:@"image"];
        NSString *imagePath = [channel valueForKey:@"imageUrl"];
        NSString *channelDescription = [channel valueForKey:@"description"];
        NSString *channelUrl = [channel valueForKey:@"url"];
        NSString *channelGroup = [channel valueForKey:@"category"];
        
        if (channelGroup == nil)
            channelGroup = @"entertainment";
        
        if (channelUrl == nil)
            channelUrl = @"unknown";
        
        //NSLog(@"bouquet information: %@ %@ %@ %@ %@ %@ %@ %@", bouquetID, name, channelID, imageName, imagePath, channelDescription, channelGroup, channelUrl);
        NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:name,@"channelName",
                                    channelID,@"channelID", imageName,@"imageName", imagePath, @"imagePath", channelDescription,@"channelDescription", channelUrl,@"channelUrl", channelGroup,@"channelGroup", nil];
        [channelList addObject:channelInfo];
        
#ifdef USE_DATABASE_FOR_CHANLIST
        // Write to database.
        NSMutableArray *aChannel = [[NSMutableArray alloc] init];
        
        [aChannel addObject:bouquetID];
        [aChannel addObject:name];
        [aChannel addObject:channelID];
        [aChannel addObject:imageName];
        [aChannel addObject:imagePath];
        [aChannel addObject:channelDescription];
        [aChannel addObject:channelGroup];
        [aChannel addObject:channelUrl];
        
        if(![deviceDB isTableExist:@"ChannelList"]){
            NSLog(@"ChannelList table not exit, create a one");
            
            [deviceDB createTable:@"ChannelList" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, bouquetID TEXT, channelName TEXT, channelID TEXT, imageName TEXT, imagePath TEXT, channelDescription TEXT, channelGroup TEXT, ChannelUrl TEXT)"];
            
        } else {
            NSLog(@"ChannelList table already created");
        }
        
        [deviceDB insertRecordIntoChannelList: aChannel];
        
#endif // #ifdef USE_DATABASE_FOR_CHANLIST
    }



/*
    NSString* serverURL = [NSString stringWithFormat:@"http://104.196.99.177:6363/api/Bouquets/%@", bouquetID];
    NSURL *requestURL = [NSURL URLWithString:serverURL];
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:requestURL
                            cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                        timeoutInterval:10
     ];
    
    [request setHTTPMethod: @"GET"];
    
    NSError *error = nil;
    NSHTTPURLResponse *response = nil;
    
    
    NSData *urlData =[NSURLConnection sendSynchronousRequest:request
                                           returningResponse:&response error:&error];
    
    
    //NSDictionary *headerInfo = [response allHeaderFields];
    
    NSLog(@"Response code: %ld %@",(long)[response statusCode],  response);
    
    // NSString* errorMsg = headerInfo[@"error"];
    
    //NSLog(@"Response code and error code: %ld %@", (long)[response statusCode], errorMsg);
    
    // The condition of >= 200 and < 300 is defined by HTTP protocol, meaning a success.
    if ([response statusCode] >= 200 && [response statusCode] < 300){
        //NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        //NSLog(@"Response ==> %@", responseData);
        
        NSError *error = nil;
        NSDictionary *jsonData = [NSJSONSerialization
                                  JSONObjectWithData:urlData
                                  options:NSJSONReadingMutableContainers
                                  error:&error];
        
        NSMutableArray * channelsInBouquet = [[jsonData valueForKey:@"data"] valueForKey:@"bouquetContainsChannels"];
        
        channelList = [[NSMutableArray alloc] init];
        //NSLog(@"channelsInBouquet %@", channelsInBouquet);
        
        for (int index = 0; index < channelsInBouquet.count; index ++){
            NSDictionary* channel = [[channelsInBouquet objectAtIndex:index] valueForKey:@"channel"];
            
            NSString *name = [channel valueForKey:@"name"];
            NSString *channelID = [channel valueForKey:@"id"];
            NSString *imageName = [channel valueForKey:@"image"];
            NSString *imagePath = [channel valueForKey:@"imageUrl"];
            NSString *channelDescription = [channel valueForKey:@"description"];
            NSString *channelUrl = [channel valueForKey:@"url"];
            NSString *channelGroup = [channel valueForKey:@"category"];
            
            if (channelGroup == nil)
                channelGroup = @"entertainment";
            
            if (channelUrl == nil)
                channelUrl = @"unknown";
            
            //NSLog(@"bouquet information: %@ %@ %@ %@ %@ %@ %@ %@", bouquetID, name, channelID, imageName, imagePath, channelDescription, channelGroup, channelUrl);
            
            NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:name,@"channelName",
                                       channelID,@"channelID", imageName,@"imageName", imagePath, @"imagePath", channelDescription,@"channelDescription", channelUrl,@"channelUrl", channelGroup,@"channelGroup", nil];
            [channelList addObject:channelInfo];
            
            
            //NSLog(@"Channel %@", aChannel);
#ifdef USE_DATABASE_FOR_CHANLIST
            // Write to database.
            NSMutableArray *aChannel = [[NSMutableArray alloc] init];
            
            [aChannel addObject:bouquetID];
            [aChannel addObject:name];
            [aChannel addObject:channelID];
            [aChannel addObject:imageName];
            [aChannel addObject:imagePath];
            [aChannel addObject:channelDescription];
            [aChannel addObject:channelGroup];
            [aChannel addObject:channelUrl];
            
            if(![deviceDB isTableExist:@"ChannelList"]){
                NSLog(@"ChannelList table not exit, create a one");
                
                [deviceDB createTable:@"ChannelList" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, bouquetID TEXT, channelName TEXT, channelID TEXT, imageName TEXT, imagePath TEXT, channelDescription TEXT, channelGroup TEXT, ChannelUrl TEXT)"];
                
            } else {
                NSLog(@"ChannelList table already created");
            }
            
            //if (![deviceDB recordExistOrNot:@"ChannelList": @"channelID": channelID]){
                [deviceDB insertRecordIntoChannelList: aChannel];
            //}
#endif // #ifdef USE_DATABASE_FOR_CHANLIST
            
        }
        //NSLog(@"channel in bouquet %@ %@", bouquetID, channelList);

    }  else {
        
        [self alertStatus:@"Can not connect to server" :@"Server Error!" :0];
    }
*/
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return packageList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"PackageCell";
    
    PackageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    //NSString *imageName = [packageImages objectAtIndex:indexPath.row];
    NSString *imageName = [[packageList objectAtIndex:indexPath.row] valueForKey:@"imageName"];
    cell.imgCell.image = [UIImage imageNamed:imageName];
    
    NSString *packageNameTmp= [[packageList objectAtIndex:indexPath.row] valueForKey:@"name"];
    cell.lblCell.text = packageNameTmp;
    
    //get localized string from appropriate strings file
    NSString *localizedString = NSLocalizedString(packageNameTmp, @"");
    cell.lblCell.text  = localizedString;
    return cell;
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"HomeViewController -- didSelectItemAtIndexPath:");
    //packageSelected = [packageName objectAtIndex:[indexPath row]];
    NSString* bouquetID = [[packageList objectAtIndex:indexPath.row] valueForKey:@"bouquetID"];
    [self getChannelInBouquet:bouquetID:indexPath.row];
    NSLog(@"channels %d", channelList.count);
    
    packageSelected = [[packageList objectAtIndex:[indexPath row]] valueForKey:@"name"];
    
    packageImagesSelected = [[NSMutableArray alloc] init];
    packageLinksSelected = [[NSMutableArray alloc] init];
    packageGroupsSelected = [[NSMutableArray alloc] init];
    packageDiscriptionSelected = [[NSMutableArray alloc] init];
    for (int index = 0; index < channelList.count; index++){
        [packageImagesSelected addObject:[[channelList objectAtIndex:index] valueForKey:@"imageName"]];
        [packageLinksSelected addObject:[[channelList objectAtIndex:index] valueForKey:@"channelUrl"]];
        [packageGroupsSelected addObject:[[channelList objectAtIndex:index] valueForKey:@"channelGroup"]];
        [packageDiscriptionSelected addObject:[[channelList objectAtIndex:index] valueForKey:@"channelDescription"]];
    }
    NSLog(@"Selected Package Name: %@ channels %@", packageSelected, packageDiscriptionSelected);
/*
    allChanneInBouquet = [[NSMutableArray alloc] init];
    allChanneInBouquet = [deviceDB getChannelInBouquet:bouquetID];
 
    packageSelected = [[packageList objectAtIndex:[indexPath row]] valueForKey:@"name"];
    
    //NSLog(@"Selected Package Name: %@ channels %@", packageSelected, allChanneInBouquet);

    for (int index = 0; index < allChanneInBouquet.count; index++){
        [packageImagesSelected addObject:[[allChanneInBouquet objectAtIndex:index] valueForKey:@"imageName"]];
        [packageLinksSelected addObject:[[allChanneInBouquet objectAtIndex:index] valueForKey:@"channelUrl"]];
        [packageGroupsSelected addObject:[[allChanneInBouquet objectAtIndex:index] valueForKey:@"channelGroup"]];
        [packageDiscriptionSelected addObject:[[allChanneInBouquet objectAtIndex:index] valueForKey:@"channelDescription"]];
    }
    //NSLog(@"Selected Package Name: %@ channels %@", packageSelected, packageDiscriptionSelected);
*/

    [self performSegueWithIdentifier:@"goto_package" sender:self];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
    if ([[segue identifier]isEqualToString:@"goto_package"]) {
        
        PackageChannelController *packageObj = [segue destinationViewController];
        packageObj.allImages =packageImagesSelected;
        packageObj.allLinks = packageLinksSelected;
        packageObj.allGroups = packageGroupsSelected;
        packageObj.allDescriptions = packageDiscriptionSelected;
        packageObj.navigationTitle = packageSelected;
        
    }
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(150.0, 150.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5,5,5,5);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    MediaPackageHeaderView *commentView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"MediaPackageHeaderView" forIndexPath:indexPath];
    
//    commentView.commentLabel.text = [NSString stringWithFormat:@"%@", kind];
    commentView.commentLabel.text = @"Select Media Package";
    return commentView;
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
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
