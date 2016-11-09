//
//  ViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ViewController.h"
#import "FavoriteData.h"
#import "UserData.h"
#import "ProfileData.h"
#import "HomeData.h"
#import "Constant.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([[NSUserDefaults standardUserDefaults] valueForKey:@"FirstTimeView"]==nil) {
        firstTimeView.hidden=false;
        [self.view bringSubviewToFront:firstTimeView];
        self.navigationController.navigationBarHidden=YES;
        [self saveImageInDocumentDirectory];
    }
    else
    {
        firstTimeView.hidden=YES;
    }
    
    self.txtUsername.text=@"";
    self.txtPassword.text=@"";
    
    self.txtUsername.text=@"madhu123@gmail.com";
    self.txtPassword.text=@"12341234";
    
    //self.txtUsername.text = @"Qezymedia5";
    //self.txtPassword.text = @"Qezymedia@5";
    
    //    self.txtUsername.text = @"chakradhar.katta@ideabytes.com";
    //    self.txtPassword.text =@"123456";
    
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    

    
    [self.txtUsername setDelegate:self];
    [self.txtPassword setDelegate:self];
    
    
    
//    self.btnSignIn.backgroundColor = [UIColor redColor];
//    self.btnFacebook.backgroundColor = [UIColor blueColor];
    
     self.loginView.layer.borderWidth = 1.0f;
//    self.loginView.layer.borderColor = [[UIColor colorWithRed:33.0f/255.0f green:39.0f/255.0f blue:73.0f/255.0f alpha:1.0] CGColor];
//    self.loginView.layer.borderColor=[[UIColor colorWithRed:33.0f/255.0f green:39.0f/255.0f blue:73.0f/255.0f alpha:1.0] CGColor];
    
//    self.loginView.layer.masksToBounds = true;
   
    self.loginView.layer.cornerRadius = 1.0f;
    
    [self.btnSignIn setBackgroundColor:[UIColor colorWithRed:(209/255.0) green:(63/255.0) blue:(24/255.0) alpha:1]];
    [self.btnFacebook setBackgroundColor:[UIColor colorWithRed:(61/255.0) green:(103/255.0) blue:(196/255.0) alpha:1]];
    
    self.txtUsername.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.txtPassword.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.btnCheckbox.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.btnFacebook.delegate = self;
    self.btnFacebook.readPermissions = @[@"public_profile", @"email"];
    
//    UIImage *image = [UIImage imageNamed:@"qezy-logo-.png"];
//    self.navigationItem.leftBarButtonItem.image= [[UIImageView alloc] initWithImage:image];
    
    UIImage *leftbuttonImage = [UIImage imageNamed:@"qezy-logo-.png"];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage:leftbuttonImage forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 75, 75);
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = customBarleftItem;
}


-(IBAction)tabsTapped:(id)sender
{
    self.navigationController.navigationBarHidden=NO;
    
    if ([sender tag]==1) {
        
    }
    else if ([sender tag]==2) {
        
    }
    else if ([sender tag]==3) {
        [firstTimeView removeFromSuperview];
    }
    else if ([sender tag]==4) {
        [firstTimeView removeFromSuperview];
        [self signUp:sender];
    }
    
    [[NSUserDefaults standardUserDefaults] setObject:@"DontShow" forKey:@"FirstTimeView"];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SAVE DATA IN DOCUMENT DIRECTORY
-(void)saveImageInDocumentDirectory
{
    staticBouquetImages = [NSMutableArray arrayWithObjects:@"Bangla.png", @"free-new.png", nil];
    
    for (int i=0; i<staticBouquetImages.count; i++) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *imageName = [staticBouquetImages objectAtIndex:i];
        
        NSString *path = [[pathsArray objectAtIndex:0] stringByAppendingPathComponent:imageName];
        
        NSLog(@" %@ ",path);
        
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        
        NSLog(@" %@ imag",imageData);
        
        [imageData writeToFile:path atomically:YES];
    }
}


#pragma mark - CUSTOM METHODS

-(void) setupFavorites{
    // Configure collection data from local database
    
    if (favoriteList == nil)
        favoriteList = [[NSMutableArray alloc] init];
    
    favoriteList = [deviceDB getFavoritesChannelList];
    NSInteger numObj = favoriteList.count;
 //   NSLog(@"query result for favorites: %@ %d", favoriteList, numObj);
    
    
    allFavoriteImages = [[NSMutableArray alloc] init];
    allFavoriteLinks = [[NSMutableArray alloc] init];
    allFavoriteGroups = [[NSMutableArray alloc] init];
    
    newsFavoriteImages = [[NSMutableArray alloc] init];
    newsFavoriteLinks = [[NSMutableArray alloc] init];
    
    musicFavoriteImages = [[NSMutableArray alloc] init];
    musicFavoriteLinks = [[NSMutableArray alloc] init];
    
    entertainFavoriteImages = [[NSMutableArray alloc] init];
    entertainFavoriteLinks = [[NSMutableArray alloc] init];
    
    sportsFavoriteImages = [[NSMutableArray alloc] init];
    sportsFavoriteLinks = [[NSMutableArray alloc] init];
    
    
    for (int index = 0; index < numObj; index++){
        
        NSString * group = [[favoriteList objectAtIndex:index] valueForKey:@"group"];
        NSString *imageName = [[favoriteList objectAtIndex:index] valueForKey:@"name"];
        NSString *link = [[favoriteList objectAtIndex:index] valueForKey:@"link"];
        //NSLog (@"add channel info into favorite list %@ %@ %@", imageName, link, group);
        
        [allFavoriteImages addObject:imageName];
        [allFavoriteLinks addObject:link];
        [allFavoriteGroups addObject:group];

        if([group caseInsensitiveCompare:@"news"] == NSOrderedSame){
            [newsFavoriteImages addObject:imageName];
            [newsFavoriteLinks addObject:link];
        }
        else if([group caseInsensitiveCompare:@"music"] == NSOrderedSame){
            [musicFavoriteImages addObject:imageName];
            [musicFavoriteLinks addObject:link];
        }
        else if([group caseInsensitiveCompare:@"entertainment"] == NSOrderedSame){
            [entertainFavoriteImages addObject:imageName];
            [entertainFavoriteLinks addObject:link];
        }
        else if([group caseInsensitiveCompare:@"sports"] == NSOrderedSame){
            [sportsFavoriteImages addObject:imageName];
            [sportsFavoriteLinks addObject:link];
        }
 

    }
    
//    NSLog(@"ViewController -- Favorite list from database: %@", allFavoriteImages);
    
}

-(void) initProfile{
    
    if (profileList == nil)
        profileList = [[NSMutableArray alloc] init];
    
    profileList = [deviceDB getAllProfiles];
    NSInteger numObj = profileList.count;
    NSLog(@"query result for profile: %@ %ld", profileList, (long)numObj);
    
    profileName = [[NSMutableArray alloc] init];
    profileImage = [[NSMutableArray alloc] init];
    profileIsLock = [[NSMutableArray alloc] init];
    profilePasswords = [[NSMutableArray alloc] init];
    
    for (int index = 0; index < numObj; index++){
        
        NSString * name = [[profileList objectAtIndex:index] valueForKey:@"profileName"];
        NSString *imagePath = [[profileList objectAtIndex:index] valueForKey:@"imagePath"];
        NSString *isLocked = [[profileList objectAtIndex:index] valueForKey:@"isLocked"];
        NSString *password = [[profileList objectAtIndex:index] valueForKey:@"password"];
        
        [profileName addObject:name];
        [profileImage addObject:imagePath];
        [profileIsLock addObject:isLocked];
        [profilePasswords addObject:password];
        
        
    }
    
    NSLog(@"ViewController -- Profile list from database: %@", profileName);
}

-(void) configureDatabase{
    if (deviceDB == nil){
        deviceDB = [[DataBase alloc] init];
    }
    
    //[deviceDB deleteTable:@"Favorites"];
    //[deviceDB createTable:@"Favorites" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, imageName TEXT, link TEXT, groups TEXT)"];
    
    //[deviceDB deleteTable:@"Profile"];
    //[deviceDB createTable:@"Profile" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, profileName TEXT, imagePath TEXT, isLocked TEXT DEFAULT 'NO', password TEXT DEFAULT '0')"];
    
/*
    NSMutableArray * channelInfo = [[NSMutableArray alloc] init];
    
    [channelInfo addObject:@"Sony.png"];
    [channelInfo addObject:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto"];
    [channelInfo addObject:@"news"];
    
    [deviceDB insertRecordIntoFavorites:channelInfo];
*/

}

- (IBAction)checkboxSelected:(id)sender {
    if(self.isChecked ==NO){
        self.isChecked =YES;
        [self.btnCheckbox setImage:[UIImage imageNamed:@"Checkbox1.png"]
                          forState:UIControlStateNormal];
        
    }else{
        self.isChecked =NO;
        [self.btnCheckbox setImage:[UIImage imageNamed:@"UnCheckbox.png"]
                          forState:UIControlStateNormal];
    }
}

- (IBAction)forgetPassword:(id)sender {
    
    [self performSegueWithIdentifier:@"goto_forgetpassword" sender:self];
}

- (IBAction)logIn:(id)sender {
    NSLog(@"ViewController: Enter logIn");
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.spinner.transform = CGAffineTransformMakeScale(2.50, 2.50);
    
    [self.spinner setCenter:self.view.center];
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    
    if([[self.txtUsername text] isEqualToString:@""]){
        
        [self alertStatus:@"Please enter User name or Email" :@"Login Failed!" :0];
        return;
    }else if([[self.txtPassword text] isEqualToString:@""] ) {
        
        [self alertStatus:@"Please enter Password" :@"Login Failed!" :0];
        return;
    }
    else if (self.txtPassword.text.length<8)
    {
        [self alertStatus:@"Password must be minimum 8-16 characters" :@"Login Failed!" :0];
        return;
    }
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        NSInteger success = 0;
        @try {
            //NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.txtUsername text],[self.txtPassword text]];
            if(self.isChecked ==YES || self.isChecked ==NO){
                
                
                NSString *post =[[NSString alloc] initWithFormat:@"email=%@&password=%@",[self.txtUsername text],[self.txtPassword text]];
                NSLog(@"PostData: %@",post);
                
                
                //NSURL *url = [NSURL URLWithString:@"http://104.196.99.177:6363/api/Customers/login"];
                NSURL *url = [NSURL URLWithString:loginSC];
                NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                
                NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
                
                //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
                
                NSError *error = nil;
                NSHTTPURLResponse *response = nil;
                NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
                
                //NSDictionary *headerInfo = [response allHeaderFields];
                
                NSLog(@"Response code: %ld %@", (long)[response statusCode], response);
            
                
                if ([response statusCode] == 200)
                {
                    NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                    NSLog(@"Response ==> %@", responseData);
                    
                    NSError *error = nil;
                    NSDictionary *jsonData = [NSJSONSerialization
                                              JSONObjectWithData:urlData
                                              options:NSJSONReadingMutableContainers
                                              error:&error];
                    
                    success = [jsonData[@"status"] integerValue];
                    NSLog(@"Success: %ld",(long)success);
                    
                    if(success == 1)
                    {
                        NSMutableArray *data = [jsonData valueForKey:@"data"];
                        
                        if (tokenID == nil){
                            tokenID = [[NSString alloc] init];
                        }
                        tokenID = [data valueForKey:@"id"];
                        
                        if (userID == nil){
                            userID = [[NSString alloc] init];
                        }
                        userID = [data valueForKey:@"userId"];
                        
                        NSLog(@"Login SUCCESS, enter home page with user id %@ and token id %@", userID, tokenID);
                        
                        [self configureDatabase];
                        [self setupPackageInfo];
                        [self setupChannelsInfo];
//                        [self setupBouquet_vs_ChannelsInfo];
//                        
//                        [self setupFavorites];
//                        [self initProfile];
//                        [self setupVersioningInfo];
                        [self performSegueWithIdentifier:@"login_success" sender:self];
                        
                        self.txtUsername.text = @"";
                        self.txtPassword.text = @"";
                        [self.spinner stopAnimating];
                        [self.spinner removeFromSuperview];
                        
                    } else {
                        
                        NSString* errorMsg = [jsonData valueForKey:@"message"];
                        [self alertStatus:errorMsg: @"Login Failed" :0];
                    }
                    
                } else {
                    
                    [self alertStatus:@"Can not connect to server" :@"Login Failed!" :0];
                }
            }
            else
            {
                [self alertStatus:@"Please Accept Terms of Service and Privacy Policy" :@"Password is Wrong!" :0];
            }
            
        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            [self alertStatus:@"Login Failed." :@"Error!" :0];
        }
    });
    
}

-(void) setupPackageInfo {
    
    //    tableDef = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER, name TEXT, imageUrl TEXT, image2xUrl TEXT, image3xUrl TEXT, meta_data TEXT, meta_description TEXT, create_datetime TEXT, updated_datetime TEXT, downloadUrl TEXT, is_free TEXT, status INTEGER, imagehdpiUrl TEXT, imageldpiUrl TEXT, imagemdpiUrl TEXT, imagexhdpiUrl TEXT, imagexxhdpiUrl TEXT, imagexxxhdpiUrl TEXT)";
    
    NSLog(@"setupPackageInfo");
    defaulBouquets = [NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"4",@"id",@"Bangla_Bouquet", @"name", @"Bangla.png", @"imageUrl",@"Bangla@2x.png",@"image2xUrl", @"Bangla@3x.png", @"image3xUrl" ,@"bangla_bouquet", @"meta_data", @"All Bangla channels from both WestBengal and Bangladesh", @"meta_description", @"2016-09-30 02:48:32", @"create_datetime", @"0000-00-00 00:00:00", @"updated_datetime", @"http://104.196.99.177:6363/api/FileStorageMongos/bouquets/download/", @"downloadUrl",@"0", @"is_free", @"1", @"status", @"",@"imagehdpiUrl", @"", @"imageldpiUrl", @"",@"imagemdpiUrl", @"",@"imagexhdpiUrl", @"",@"imagexxhdpiUrl",@"",@"imagexxxhdpiUrl", nil],
        [NSMutableDictionary dictionaryWithObjectsAndKeys:@"12",@"id",@"Decan free channel", @"name", @"free-new.png", @"imageUrl", @"free-new@2x.png", @"image2xUrl", @"free-new@3x.png", @"image3xUrl",@"decan-free-channels", @"meta_data", @"All south-Indian Free channels", @"meta_description", @"2016-10-19 07:00:00'", @"create_datetime", @"0000-00-00 00:00:00", @"updated_datetime", @"http://104.196.99.177:6363/api/FileStorageMongos/bouquets/download/", @"downloadUrl", @"1", @"is_free", @"1", @"status", @"",@"imagehdpiUrl", @"", @"imageldpiUrl", @"",@"imagemdpiUrl", @"",@"imagexhdpiUrl", @"",@"imagexxhdpiUrl",@"",@"imagexxxhdpiUrl", nil],
        nil];

    //    NSLog(@"defaulBouquets:%@", defaulBouquets);
    
    //    NSLog(@"defaulBouquets");
/*    channelsInDefaultBouquets = [NSMutableArray arrayWithObjects:
                                 [NSMutableArray arrayWithObjects:
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"High News", @"name", @"5800b642d2610420d86286c1", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch27/auto", @"url", @"high-news.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"high news", @"description", @"news", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"CTVN PLUS", @"name", @"5800b642d2610420d86286c3", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch29/auto", @"url", @"ctvn.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"CTVN PLUS", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Tara TV", @"name", @"5800b642d2610420d86286c5", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch51/auto", @"url", @"taratv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Tara TV", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Channel 10", @"name", @"5800b642d2610420d86286c6", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", @"url", @"channel-10.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Channel 10", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Jamuna TV", @"name", @"5800b642d2610420d86286c7", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch37/auto", @"url", @"jamuna.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Jamuna TV", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Channel I", @"name", @"5800b642d2610420d86286c8", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch46/auto", @"url", @"channel-i.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Channel I", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"SA TV", @"name", @"5800b642d2610420d86286c9", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch47/auto", @"url", @"satv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"SA TV", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Uttar Bangla", @"name", @"5800b642d2610420d86286cb", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch52/auto", @"url", @"Uttarbangla.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Uttar Bangla", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Boishakhi TV", @"name", @"5800b642d2610420d86286cc", @"id", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch54/auto", @"url", @"boishakhi-tv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Boishakhi TV", @"description", @"Entertainment", @"category", nil],
                                  nil],
                                 [NSMutableArray arrayWithObjects:
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Decan", @"name", @"580a022dff0d6f4a5e754158", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch5/auto", @"url", @"deccan-tv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Decan", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Life Changing", @"name", @"580a02a2ff0d6f4a5e754159", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch22/auto", @"url", @"Life-Changing.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Life Changing", @"description", @"Religious", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Mana Telugu", @"name", @"580a0349ff0d6f4a5e75415a", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch36/auto", @"url", @"mana-telugu.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Mana Telugu", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Metro", @"name", @"580a03c1ff0d6f4a5e75415b", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch4/auto", @"url", @"metro.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Metro", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"N24", @"name", @"580a045cff0d6f4a5e75415c", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch17-1/auto", @"url", @"n24.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"N24", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"NewsI", @"name", @"580a04c5ff0d6f4a5e75415d", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch34/auto", @"url", @"news1.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"NewsI", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Ptv", @"name", @"580a053eff0d6f4a5e75415e", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch8-1/auto", @"url", @"ptv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Ptv", @"description", @"News", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Sai Tv", @"name", @"580a05a9ff0d6f4a5e75415f", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch10/auto", @"url", @"sai-tv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Sai Tv", @"description", @"Religious", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Stv", @"name", @"580a060fff0d6f4a5e754160", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch18-1/auto", @"url", @"stv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Stv", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Vtv", @"name", @"580a0674ff0d6f4a5e754161", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch16-1/auto", @"url", @"vtv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Vtv", @"description", @"Entertainment", @"category", nil],
                                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Ytv", @"name", @"580a06e4ff0d6f4a5e754162", @"id", @"octoshape://streams.octoshape.net/ideabytes/ib-ch30/auto", @"url", @"ytv.png", @"image", @"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/", @"imageUrl", @"Ytv", @"description", @"Entertainment", @"category", nil],
                                  nil],
                                 nil];  */
    
    
    
    
 //   NSLog(@"PackageList");
    packageList = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    packageList = [deviceDB getBouquets];
    NSLog(@"getBouquets");
    
    
    if(packageList.count){
        //        NSLog(@"ViewController setupBouquetInfo() - load bouquets from local db%@", packageList);
    }
    else{
        packageList = defaulBouquets;
        //        NSLog(@"ViewController setupBouquetInfo() - load default bouquets %@", packageList);
        
        for(int index = 0; index < packageList.count; index ++){
            NSMutableArray *bouquet = [[NSMutableArray alloc] init];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"id"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"name"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imageUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"image2xUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"image3xUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"meta_data"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"meta_description"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"create_datetime"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"updated_datetime"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"downloadUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"is_free"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"status"]];
             [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imagehdpiUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imageldpiUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imagemdpiUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imagexhdpiUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imagexxhdpiUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imagexxxhdpiUrl"]];
 /*           [bouquet addObject:@""];
            [bouquet addObject:@""];
            [bouquet addObject:@""];
            [bouquet addObject:@""];
            [bouquet addObject:@""];
            [bouquet addObject:@""]; */
            
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"bouquets"]){
                NSLog(@"bouquets table not exit, create a one");
                
                [deviceDB createTable:@"bouquets" :@""];                
                
            } else {
                NSLog(@"Bouquets table already created");
            }
            
            [deviceDB insertRecordIntoBouquets:bouquet];
            
        }
        
    }    
    
//    channelList = [[NSMutableArray alloc] init];
    
    
}

-(void)setupChannelsInfo
{
    NSLog(@"setupChannelsInfo");
    channels =[NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"26",@"id", @"High News",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch27/auto",@"Url" ,@"var _0x17b5=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x32\\\\x37\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x17b5[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch27-vod6.flv",@"vodUrl" , @"var _0x3290=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x32\\\\x37\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x36\\\\x2E\\\\x66\\\\x6C\\\\x76\\\\x20\\\"];var streamURL=_0x3290[0]",@"vod_octo_js" , @"high-news.png",@"imageUrl", @"high-news",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:53",@"created_datetime" ,@"2016-09-30 06:03:57",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
        @"", @"imagehdpiUrl",
        @"",@"imageldpiUrl",
        @"",@"imagemdpiUrl",
        @"",@"imagexhdpiUrl",
        @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"31",@"id", @"Zeal Sports and News",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch45/auto",@"Url" ,@"var _0xb7f0=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x34\\\\x35\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xb7f0[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"zeal-news.png",@"imageUrl", @"zeal-sports-and-news__trashed",@"meta_data" ,@"",@"meta_description" ,@"0",@"status" ,@"2016-11-02 11:36:54",@"created_datetime" ,@"2016-09-27 09:16:39",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"82",@"id", @"CTVN PLUS",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch29/auto",@"Url" ,@"var _0x87b9=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x32\\\\x39\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x87b9[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch29-vod.flv",@"vodUrl" , @"var _0x78e3=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x32\\\\x39\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x66\\\\x6C\\\\x76\\\\x20\\\"];var streamURL=_0x78e3[0]",@"vod_octo_js" , @"ctvn.png",@"imageUrl", @"ctvn-plus",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:54",@"created_datetime" ,@"2016-09-30 06:04:51",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"89",@"id", @"Live 24",@"name" ,@"",@"Url" ,@"var _0x962c=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x6F\\\\x70\\\\x73\\\\x2F\\\\x73\\\\x61\\\\x6A\\\\x61\\\\x69\\\\x6E\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x68\\\\x6C\\\\x73\\\\x2F\\\\x32\\\\x30\\\\x30\\\\x30\\\\x6B\\\"];var streamURL=_0x962c[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"live24.png",@"imageUrl", @"live-24",@"meta_data" ,@"",@"meta_description" ,@"0",@"status" ,@"2016-09-30 10:58:53",@"created_datetime" ,@"2016-08-03 11:54:20",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"129",@"id", @"Tara TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch51/auto",@"Url" ,@"var _0x340c=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x35\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x340c[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch51-vod.mp4",@"vodUrl" , @"var _0x8787=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x35\\\\x31\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0x8787[0]",@"vod_octo_js" , @"taratv.png",@"imageUrl", @"tara-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:55",@"created_datetime" ,@"2016-07-27 11:43:10",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"132",@"id", @"Channel 10",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto",@"Url" ,@"var _0xea65=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x31\\\\x32\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xea65[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch12-vod.mp4",@"vodUrl" , @"var _0x8ca9=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x31\\\\x32\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0x8ca9[0]",@"vod_octo_js" , @"channel-10.png",@"imageUrl", @"channel-10",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:55",@"created_datetime" ,@"2016-07-27 11:42:41",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],

    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"135",@"id", @"Jamuna TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch37/auto",@"Url" ,@"var _0x1958=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x37\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x1958[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/Ch37-vod.mp4",@"vodUrl" , @"var _0x930a=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x43\\\\x68\\\\x33\\\\x37\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0x930a[0]",@"vod_octo_js" , @"jamuna.png",@"imageUrl", @"jamuna-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:56",@"created_datetime" ,@"2016-07-27 11:42:04",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"138",@"id", @"Channel I",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch46/auto",@"Url" ,@"var _0xe9d1=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x34\\\\x36\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xe9d1[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/Ch46-vod.mp4",@"vodUrl" , @"var _0x417d=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x43\\\\x68\\\\x34\\\\x36\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0x417d[0]",@"vod_octo_js" , @"channel-i.png",@"imageUrl", @"channel-i",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:56",@"created_datetime" ,@"2016-07-27 11:41:40",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"185",@"id", @"SA TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch47/auto",@"Url" ,@"var _0xa6d5=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x34\\\\x37\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xa6d5[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch47-vod.mp4",@"vodUrl" , @"var _0xb666=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x34\\\\x37\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0xb666[0]",@"vod_octo_js" , @"satv.png",@"imageUrl", @"sa-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:57",@"created_datetime" ,@"2016-08-04 09:01:37",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"247",@"id", @"Music Bangla",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch35/1600k",@"Url" ,@"var _0x1c8b=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x35\\\\x2F\\\\x31\\\\x36\\\\x30\\\\x30\\\\x6B\\\"];var streamURL=_0x1c8b[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"music-bangla.png",@"imageUrl", @"music-bangla__trashed",@"meta_data" ,@"",@"meta_description" ,@"0",@"status" ,@"2016-11-02 11:09:42",@"created_datetime" ,@"2016-09-27 09:16:45",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],

    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"514",@"id", @"Uttar Bangla",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch52/auto",@"Url" ,@"var _0xcbdf=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x35\\\\x32\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xcbdf[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch52-vod.flv",@"vodUrl" , @"var _0xd2fc=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x63\\\\x68\\\\x35\\\\x32\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x66\\\\x6C\\\\x76\\\"];var streamURL=_0xd2fc[0]",@"vod_octo_js" , @"Uttarbangla.png",@"imageUrl", @"uttar-bangla",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:57",@"created_datetime" ,@"2016-07-27 11:38:08",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"586",@"id", @"Boishakhi TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch54/auto",@"Url" ,@"var _0x49c9=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x35\\\\x34\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x49c9[0]",@"octo_js" , @"octoshape://streams.octoshape.net/ideabytes/vod/QP/Ch54-vod.mp4",@"vodUrl" , @"var _0xcf50=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x76\\\\x6F\\\\x64\\\\x2F\\\\x51\\\\x50\\\\x2F\\\\x43\\\\x68\\\\x35\\\\x34\\\\x2D\\\\x76\\\\x6F\\\\x64\\\\x2E\\\\x6D\\\\x70\\\\x34\\\"];var streamURL=_0xcf50[0]",@"vod_octo_js" , @"boishakhi-tv.png",@"imageUrl", @"boishakhi-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:36:58",@"created_datetime" ,@"2016-09-30 06:01:32",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"756",@"id", @"Deccan TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto",@"Url" ,@"var _0xab09=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x35\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xab09[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"deccan-tv.png",@"imageUrl", @"deccan-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:09",@"created_datetime" ,@"2016-10-21 07:18:14",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"758",@"id", @"Life Changing TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch22/auto",@"Url" ,@"var _0x51df=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x32\\\\x32\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x51df[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"Life-Changing.png",@"imageUrl", @"life-changing-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:08",@"created_datetime" ,@"2016-10-21 07:18:39",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],

    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"760",@"id", @"News One",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch34/auto",@"Url" ,@"var _0xe7b2=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x34\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xe7b2[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"news1.png",@"imageUrl", @"news-one",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:08",@"created_datetime" ,@"2016-10-21 09:24:14",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],

    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"762",@"id", @"Metro TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto",@"Url" ,@"var _0x5fb8=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x34\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x5fb8[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"metro.png",@"imageUrl", @"metro-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:07",@"created_datetime" ,@"2016-10-21 09:24:23",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],

    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"764",@"id", @"Sai TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch10/auto",@"Url" ,@"var _0x238c=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x31\\\\x30\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x238c[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"sai-tv.png",@"imageUrl", @"sai-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:07",@"created_datetime" ,@"2016-10-21 09:24:41",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"766",@"id", @"S TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch18-1/auto",@"Url" ,@"var _0x9752=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x31\\\\x38\\\\x2D\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x9752[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"stv.png",@"imageUrl", @"s-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:06",@"created_datetime" ,@"2016-10-20 14:54:55",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"768",@"id", @"V TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch16-1/auto",@"Url" ,@"var _0xbbee=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x31\\\\x36\\\\x2D\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xbbee[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"vtv.png",@"imageUrl", @"v-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:05",@"created_datetime" ,@"2016-10-20 14:52:58",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"770",@"id", @"Mana Telugu TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch36/auto",@"Url" ,@"var _0x1bf8=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x36\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x1bf8[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"mana-telugu.png",@"imageUrl", @"mana-telugu-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:05",@"created_datetime" ,@"2016-10-21 09:25:11",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"772",@"id", @"N24",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch17-1/auto",@"Url" ,@"var _0xf740=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x31\\\\x37\\\\x2D\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xf740[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"n24.png",@"imageUrl", @"n24",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:04",@"created_datetime" ,@"2016-10-22 06:34:28",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
/*    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"774",@"id", @"P TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch8-1/auto",@"Url" ,@"var _0xe776=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x38\\\\x2D\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xe776[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"2016/10/ptv.jpg",@"imageUrl", @"p-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-09-30 03:58:51",@"created_datetime" ,@"2016-10-20 14:54:23",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"776",@"id", @"Y TV HD",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch30/auto",@"Url" ,@"var _0x1ad4=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x30\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x1ad4[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"2016/10/ytv.jpg",@"imageUrl", @"y-tv-hd",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:03",@"created_datetime" ,@"2016-10-20 14:52:50",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"959",@"id", @"Vijaya News",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch9-1/auto",@"Url" ,@"var _0x93d7=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x39\\\\x2D\\\\x31\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x93d7[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"2016/10/vijaya-news.jpg",@"imageUrl", @"vijaya-news",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-02 11:23:03",@"created_datetime" ,@"2016-11-01 07:23:50",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
               
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1062",@"id", @"Big J TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch56/auto",@"Url" ,@"var _0x2bb3=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x35\\\\x36\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x2bb3[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"2016/11/bigtv.jpg",@"imageUrl", @"big-j-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-11-03 11:23:03",@"created_datetime" ,@"2016-11-03 04:23:03",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil],
 
    [NSMutableDictionary dictionaryWithObjectsAndKeys:@"1104",@"id", @"BN TV",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch32/auto",@"Url" ,@"var _0xea2d=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x33\\\\x32\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0xea2d[0]",@"octo_js" , @"",@"vodUrl" , @"",@"vod_octo_js" , @"2016/11/bntv.jpg",@"imageUrl", @"bn-tv",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-09-30 03:58:51",@"created_datetime" ,@"0000-00-00 00:00:00",@"updated_datetime" ,@"",@"image2xUrl" ,@"",@"image3xUrl" ,
                @"", @"imagehdpiUrl",
                @"",@"imageldpiUrl",
                @"",@"imagemdpiUrl",
                @"",@"imagexhdpiUrl",
                @"",@"imagexxhdpiUrl", @"",@"imagexxxhdpiUrl",  @"http://ideabytestraining.com/newqezyplay/wp-content/uploads/",@"downloadUrl" ,@"",@"category" ,nil], */
               
nil];
    
    channelsInfo = [[NSMutableArray alloc] init];
    NSLog(@"channelsInfo:Before connect with DB");
    channelsInfo = [deviceDB getChannels];
//    NSLog(@"channelsInfo:getChannels:%@", channelsInfo);
    
    
    if(channelsInfo.count){
        //        NSLog(@"ViewController setupChannelsInfo() - load Channels from local db%@", channelsInfo);
    }
    else{
        channelsInfo = channels;
        //        NSLog(@"ViewController setupChannelsInfo() - load default Channels %@", channelsInfo);
        
        for(int index = 0; index < channelsInfo.count; index ++){
            NSMutableArray *channel = [[NSMutableArray alloc] init];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"id"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"name"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"Url"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"octo_js"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"vodUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"vod_octo_js"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imageUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"meta_data"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"meta_description"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"status"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"created_datetime"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"updated_datetime"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"image2xUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"image3xUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imagehdpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imageldpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imagemdpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imagexhdpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imagexxhdpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imagexxxhdpiUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"downloadUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"category"]];
    
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"channels"]){
                NSLog(@"Channels table not exit, create a one");
                
                [deviceDB createTable:@"channels" :@""];
                
            } else {
                NSLog(@"Channels table already created");
            }
            [deviceDB insertRecordIntoChannels:channel];
            
        }
        
    }
    //    channelList = [[NSMutableArray alloc] init];
    
}

-(void)setupBouquet_vs_ChannelsInfo
{
    
    bouquetChannels =[NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"1",@"id",@"4", @"bouquet_id" ,@"26",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil],
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"4",@"id",@"4", @"bouquet_id" ,@"31",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime",@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"7",@"id",@"4", @"bouquet_id" ,@"82",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"10",@"id",@"4", @"bouquet_id" ,@"89",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"12",@"id",@"4", @"bouquet_id" ,@"129",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil]  ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"14",@"id",@"4", @"bouquet_id" ,@"132",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil]  , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"16",@"id",@"4", @"bouquet_id" ,@"135",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil]    ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"18",@"id",@"4", @"bouquet_id" ,@"138",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"20",@"id",@"4", @"bouquet_id" ,@"185",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"22",@"id",@"4", @"bouquet_id" ,@"247",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"24",@"id",@"4", @"bouquet_id" ,@"514",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"26",@"id",@"4", @"bouquet_id" ,@"586",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"42",@"id",@"12", @"bouquet_id" ,@"1104",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"29",@"id",@"12", @"bouquet_id" ,@"760",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"30",@"id",@"12", @"bouquet_id" ,@"758",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil],
                      
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"31",@"id",@"12", @"bouquet_id" ,@"959",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"32",@"id",@"12", @"bouquet_id" ,@"762",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil],
 
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"33",@"id",@"12", @"bouquet_id" ,@"756",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"34",@"id",@"12", @"bouquet_id" ,@"764",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"35",@"id",@"12", @"bouquet_id" ,@"766",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"36",@"id",@"12", @"bouquet_id" ,@"768",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,

                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"37",@"id",@"12", @"bouquet_id" ,@"770",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,[NSMutableDictionary dictionaryWithObjectsAndKeys:@"38",@"id",@"12", @"bouquet_id" ,@"772",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] , [NSMutableDictionary dictionaryWithObjectsAndKeys:@"39",@"id",@"12", @"bouquet_id" ,@"774",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,

                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"40",@"id",@"12", @"bouquet_id" ,@"776",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,[NSMutableDictionary dictionaryWithObjectsAndKeys:@"41",@"id",@"12", @"bouquet_id" ,@"1062",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,@"",@"updated_datetime" ,nil] ,nil];
    
    NSLog(@"setupBouquet_vs_ChannelsInfo");
    
    bouquetChannelsInfo = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    bouquetChannelsInfo = [deviceDB getBouquetChannels];
    NSLog(@"getBouquetChannels");
    
    
    if(bouquetChannelsInfo.count){
        //        NSLog(@"if:ViewController setupChannelsInfo() - load Channels from local db%@", bouquetChannelsInfo);
    }
    else{
        bouquetChannelsInfo = bouquetChannels;
        //        NSLog(@"else:ViewController setupChannelsInfo() - load default Channels %@", bouquetChannelsInfo);
        
        for(int index = 0; index < bouquetChannelsInfo.count; index ++){
            NSMutableArray *bouquetChannel = [[NSMutableArray alloc] init];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"id"]];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"bouquet_id"]];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"channel_id"]];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"created_datetime"]];
            
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"updated_datetime"]];
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"bouquet_vs_channels"]){
                NSLog(@"bouquet_vs_channels table not exit, create a one");
                
                [deviceDB createTable:@"bouquet_vs_channels" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER, bouquet_id INTEGER NOT NULL, channel_id INTEGER NOT NULL, created_datetime TEXT, updated_datetime TEXT)"];
                
            } else {
                NSLog(@"bouquet_vs_channels table already created");
            }
            [deviceDB insertRecordIntoBouquet_vs_Channels:bouquetChannel];
            
        }
        
    }
}



-(void) setupVersioningInfo
{
    versioning = [NSMutableArray arrayWithObjects:
                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"channels", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],
                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bouquets", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],
                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bouquet_vs_channels", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],
                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Favorites", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],
                  [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Profile", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],
                nil];
    
    NSLog(@"ViewController: setupVersioningInfo");
    
    versioningInfo = [[NSMutableArray alloc] init];
    versioningInfo = [deviceDB getVersioningInfo];
   
    if(versioningInfo.count){
 //       NSLog(@"if:ViewController setupVersioningInfo() - load Version info from local db%@", versioningInfo);
    }
    else{
        versioningInfo = versioning;
 //       NSLog(@"else:ViewController setupVersioningInfo() - load default Version info %@", versioningInfo);
        
        for(int index = 0; index < versioningInfo.count; index ++){
            NSMutableArray *versioningData = [[NSMutableArray alloc] init];
            [versioningData addObject:[[versioningInfo objectAtIndex:index] valueForKey:@"tablename"]];
            [versioningData addObject:[[versioningInfo objectAtIndex:index] valueForKey:@"version"]];
            
            
            if(![deviceDB isTableExist:@"versioning"]){
                NSLog(@"versioning table not exit, create a one");
                
                [deviceDB createTable:@"Versioning" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, tablename TEXT,   version TEXT)"];
                
            } else {
                NSLog(@"versioning table already created");
            }
            [deviceDB insertRecordIntoVersioning:versioningData];
            
        }
        
    }
    
}

-(void) getPackage {
    
    NSURL *requestURL = [NSURL URLWithString:@"http://104.196.99.177:6363/api/Bouquets"];
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
    
    if ([response statusCode] >= 200 && [response statusCode] < 300){
        //NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
        //NSLog(@"Response ==> %@", responseData);
        
        NSError *error = nil;
        NSDictionary *jsonData = [NSJSONSerialization
                                  JSONObjectWithData:urlData
                                  options:NSJSONReadingMutableContainers
                                  error:&error];
        
        NSMutableArray * bouquetList = [jsonData valueForKey:@"data"];
        
        
        for (int index = 0; index < bouquetList.count; index ++){
            NSDictionary* bouquet = [bouquetList objectAtIndex:index];
            NSString *name = [bouquet valueForKey:@"name"];
            NSString *bouquetID = [bouquet valueForKey:@"id"];
            NSString *imageName = [bouquet valueForKey:@"imageUrl"];
            NSString *imagePath = [bouquet valueForKey:@"downloadUrl"];
            
            //NSLog(@"bouquet information: %@ %@ %@ %@", name, bouquetID, imageName, imagePath);
            
            NSDictionary *bouquetInfo =[NSDictionary dictionaryWithObjectsAndKeys:name,@"name",
                                        bouquetID,@"id", imageName, @"imageName", imagePath, @"imagePath", nil];
            [packageList addObject:bouquetInfo];
            
            
        }
        NSLog(@"Available bouquets %@ ", packageList);
        
    }  else {
        
        [self alertStatus:@"Can not connect to server" :@"Server Error!" :0];
    }
    
}

- (IBAction)signUp:(id)sender {
    [self performSegueWithIdentifier:@"goto_signup" sender:self];

}

- (IBAction)termsOfServiceForSignIn:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)privacyPolicyForSignIn:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)termsOfServiceForFacebook:(id)sender {
//    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)privacyPolicyForFacebook:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}
/*
- (IBAction)signUp:(id)sender {
    [self performSegueWithIdentifier:@"goto_signup" sender:self];
}
*/
- (IBAction)registrationForm:(id)sender {
    [self performSegueWithIdentifier:@"goto_signup" sender:self];
}



- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

// press return to hide keyboard
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField==self.txtPassword) {
        if (newString.length>16) {
            [self alertStatus:@"Password not exceed 16 digits" :@"Login Failed!" :0];
            return NO;
        }
    }
    
    return YES;
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

- (void)alertView:(UIAlertView *)theAlert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"The %@ button was tapped.", [theAlert buttonTitleAtIndex:buttonIndex]);
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    //    self.lblLoginStatus.text = @"You are logged in.";
    
    //    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    //    self.profilePicture.profileID = user.id;
    //    self.lblUsername.text = user.name;
    //    self.lblEmail.text = [user objectForKey:@"email"];
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    //    self.lblLoginStatus.text = @"You are logged out";
    //
    //    [self toggleHiddenState:YES];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}


@end
