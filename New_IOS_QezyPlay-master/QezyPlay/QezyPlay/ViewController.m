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
    // Do any additional setup after loading the view, typically from a nib.
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor blackColor]];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    

    
    [self.txtUsername setDelegate:self];
    [self.txtPassword setDelegate:self];
    
    //self.txtUsername.text = @"Qezymedia5";
    //self.txtPassword.text = @"Qezymedia@5";
    self.txtUsername.text = @"chakradhar.katta@ideabytes.com";
    self.txtPassword.text =@"123456";
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
    [self saveImageInDocumentDirectory];
    
}

-(void)saveImageInDocumentDirectory
{
    bouquetImages = [NSMutableArray arrayWithObjects:@"Bangla.png", @"free-new.png", nil];
    for (int i =0; i<bouquetImages.count; i++) {
        NSLog(@"Index value:%d, %@", i, [bouquetImages objectAtIndex:i]);
       
    }
    banglaChannelImages = [NSMutableArray arrayWithObjects:@"high-news.png", @"ctvn.png", @"taratv.png", @"channel-10.png", @"jamuna.png", @"channel-i.png", @"satv.png", @"zeal-news.png", @"boishakhi-tv.png", nil];
    freeChannelImages = [NSMutableArray arrayWithObjects:@"deccan-tv.png", @"Life-Changing.png", @"mana-telugu.png", @"metro.png", @"n24.png", @"news1.png", @"ptv.png", @"sai-tv.png", @"stv.png", @"vtv.png", @"ytv.png", nil];
    bothImages = [NSMutableArray arrayWithObjects:@"high-news.png", @"ctvn.png", @"taratv.png", @"channel-10.png", @"jamuna.png", @"channel-i.png", @"satv.png", @"zeal-news.png", @"boishakhi-tv.png",@"deccan-tv.png", @"Life-Changing.png", @"mana-telugu.png", @"metro.png", @"n24.png", @"news1.png", @"ptv.png", @"sai-tv.png", @"stv.png", @"vtv.png", @"ytv.png", nil];

    
    for (int i=0; i<bouquetImages.count; i++) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSLog(@" %@ ",pathsArray);
        
        NSString *imageName = [bouquetImages objectAtIndex:i];
        
        NSString *path =[pathsArray objectAtIndex:0];
        
        path = [path stringByAppendingPathComponent:imageName];
        
        NSLog(@" %@ ",path);
        
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        
        NSLog(@" %@ imag",imageData);
        
        [imageData writeToFile:path atomically:YES];
    }

    for (int i=0; i<banglaChannelImages.count; i++) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSLog(@" %@ ",pathsArray);
        
        NSString *imageName = [banglaChannelImages objectAtIndex:i];
        
        NSString *path =[pathsArray objectAtIndex:0];
        
        path = [path stringByAppendingPathComponent:imageName];
        
        NSLog(@" %@ ",path);
        
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        
        NSLog(@" %@ imag",imageData);
        
        [imageData writeToFile:path atomically:YES];
    }
    
    for (int i=0; i<freeChannelImages.count; i++) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSLog(@" %@ ",pathsArray);
        
        NSString *imageName = [freeChannelImages objectAtIndex:i];
        
        NSString *path =[pathsArray objectAtIndex:0];
        
        path = [path stringByAppendingPathComponent:imageName];
        
        NSLog(@" %@ ",path);
        
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        
        NSLog(@" %@ imag",imageData);
        
        [imageData writeToFile:path atomically:YES];
    }

 /*
    for (int i=0; i<bothImages.count; i++) {
        NSArray *pathsArray = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSLog(@" %@ ",pathsArray);
        
        NSString *imageName = [bothImages objectAtIndex:i];
        
        NSString *path =[pathsArray objectAtIndex:0];
        
        path = [path stringByAppendingPathComponent:imageName];
        
        NSLog(@" %@ ",path);
        
        NSData *imageData = UIImagePNGRepresentation([UIImage imageNamed:imageName]);
        
        NSLog(@" %@ imag",imageData);
        
        [imageData writeToFile:path atomically:YES];
    }
*/

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupFavorites{
    // Configure collection data from local database
    
    if (favoriteList == nil)
        favoriteList = [[NSMutableArray alloc] init];
    
    favoriteList = [deviceDB getFavoritesChannelList];
    NSInteger numObj = favoriteList.count;
    NSLog(@"query result for favorites: %@ %ld", favoriteList, (long)numObj);
    
    
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
    
    NSLog(@"ViewController -- Favorite list from database: %@", allFavoriteImages);
    
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
    
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),^{
        NSInteger success = 0;
        @try {
        
            if([[self.txtUsername text] isEqualToString:@""]){
                
                [self alertStatus:@"Please enter User name or Email" :@"Login Failed!" :0];
                
            }else if([[self.txtPassword text] isEqualToString:@""] ) {
            
                [self alertStatus:@"Please enter Password" :@"Login Failed!" :0];
            
            } else {
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
            
               // NSString* errorMsg = headerInfo[@"error"];
            
                //NSLog(@"Response code and error code: %ld %@", (long)[response statusCode], errorMsg);
            
                if ([response statusCode] >= 200 && [response statusCode] < 300)
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
                    success =1;
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
                        [self setupBouquet_vs_ChannelsInfo];
                        [self setupVersioningInfo];
                        [self setupFavorites];
                        [self initProfile];
                        
                        [self performSegueWithIdentifier:@"login_success" sender:self];
                    self.txtUsername.text = @"";
                    self.txtPassword.text = @"";
                    
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

        }
        @catch (NSException * e) {
            NSLog(@"Exception: %@", e);
            [self alertStatus:@"Login Failed." :@"Error!" :0];
        }
    });
    
}

-(void) setupPackageInfo {

    NSLog(@"setupPackageInfo");
    defaulBouquets = [NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"Bangla_Bouquet", @"name", @"580799152c369526081c43b3", @"bouquetID", @"Bangla.png", @"imageName",@"Bangla@2x.png",@"image2xUrl", @"Bangla@3x.png", @"image3xUrl" ,@"bangla_bouquet", @"meta_data", @"All Bangla channels from both WestBengal and Bangladesh", @"meta_description", @"2016-09-30 02:48:32", @"create_datetime", @"0000-00-00 00:00:00", @"updated_datetime", @"http://104.196.99.177:6363/api/FileStorageMongos/bouquets/download/", @"downloadUrl",@"0", @"is_free", @"1", @"status", nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"Decan free channel", @"name", @"5808afd55ff0be17f64f2083", @"bouquetID", @"free-new.png", @"imageName", @"free-new@2x.png", @"image2xUrl", @"free-new@3x.png", @"image3xUrl",@"decan-free-channels", @"meta_data", @"All south-Indian Free channels", @"meta_description", @"2016-10-19 07:00:00'", @"create_datetime", @"0000-00-00 00:00:00", @"updated_datetime", @"http://104.196.99.177:6363/api/FileStorageMongos/bouquets/download/", @"downloadUrl", @"1", @"is_free", @"1", @"status", nil],nil];    

    NSLog(@"defaulBouquets:%@", defaulBouquets);
    
    NSLog(@"defaulBouquets");
    channelsInDefaultBouquets = [NSMutableArray arrayWithObjects:
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
        nil];
    
    

    
    
    packageList = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    packageList = [deviceDB getBouquets];
    NSLog(@"getBouquets");

    
    if(packageList.count){
        NSLog(@"ViewController setupBouquetInfo() - load bouquets from local db%@", packageList);
    }
    else{
        packageList = defaulBouquets;
        NSLog(@"ViewController setupBouquetInfo() - load default bouquets %@", packageList);
        
        for(int index = 0; index < packageList.count; index ++){
            NSMutableArray *bouquet = [[NSMutableArray alloc] init];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"name"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"bouquetID"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"imageName"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"image2xUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"image3xUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"meta_data"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"meta_description"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"create_datetime"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"updated_datetime"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"downloadUrl"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"is_free"]];
            [bouquet addObject:[[packageList objectAtIndex:index] valueForKey:@"status"]];
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"Bouquets"]){
                NSLog(@"Bouquets table not exit, create a one");
                
                [deviceDB createTable:@"Bouquets" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, bouquetID TEXT, imageName TEXT, image2xUrl TEXT, image3xUrl TEXT, meta_data TEXT, meta_description TEXT, create_datetime TEXT, updated_datetime TEXT,  downloadUrl TEXT, is_free TEXT, status TEXT)"];
                
            } else {
                NSLog(@"Bouquets table already created");
            }
            [deviceDB insertRecordIntoBouquets:bouquet];
            
        }
        
    }    
    
    channelList = [[NSMutableArray alloc] init];
    
    
}

-(void)setupChannelsInfo
{
    NSLog(@"setupChannelsInfo");
    channels =[NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"High News",@"name" ,@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch27/auto",@"Url" ,@"high news",@"description", @"high-news.png",@"imageUrl", @"5800b642d2610420d86286c1",@"id" ,@"var _0x17b5=[\\\"\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x3A\\\\x2F\\\\x2F\\\\x73\\\\x74\\\\x72\\\\x65\\\\x61\\\\x6D\\\\x73\\\\x2E\\\\x6F\\\\x63\\\\x74\\\\x6F\\\\x73\\\\x68\\\\x61\\\\x70\\\\x65\\\\x2E\\\\x6E\\\\x65\\\\x74\\\\x2F\\\\x69\\\\x64\\\\x65\\\\x61\\\\x62\\\\x79\\\\x74\\\\x65\\\\x73\\\\x2F\\\\x6C\\\\x69\\\\x76\\\\x65\\\\x2F\\\\x69\\\\x62\\\\x2D\\\\x63\\\\x68\\\\x32\\\\x37\\\\x2F\\\\x61\\\\x75\\\\x74\\\\x6F\\\"];var streamURL=_0x17b5[0]",@"octo_js" ,@"high-news",@"meta_data" ,@"",@"meta_description" ,@"1",@"status" ,@"2016-09-30 03:58:51",@"created_datetime" ,@"2016-09-30 06:03:57",@"updated_datetime" ,@"http://104.196.99.177:6363/api/FileStorageMongos/channels/download/",@"downloadUrl" ,@"high-news@2x.png",@"image2xUrl" ,@"high-news@3x.png",@"image3xUrl" ,@"news",@"category", @"octoshape://streams.octoshape.net/ideabytes/vod/QP/ch27-vod6.flv",@"vodUrl" ,@"",@"vod_octo_js" ,nil],nil];
    
    channelsInfo = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    channelsInfo = [deviceDB getChannels];
    NSLog(@"getChannels");
    
    
    if(channelsInfo.count){
        NSLog(@"ViewController setupChannelsInfo() - load Channels from local db%@", channelsInfo);
    }
    else{
        channelsInfo = channels;
        NSLog(@"ViewController setupChannelsInfo() - load default Channels %@", channelsInfo);
        
        for(int index = 0; index < channelsInfo.count; index ++){
            NSMutableArray *channel = [[NSMutableArray alloc] init];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"id"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"name"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"Url"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"octo_js"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"imageUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"meta_data"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"meta_description"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"status"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"created_datetime"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"updated_datetime"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"image2xUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"image3xUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"downloadUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"category"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"vodUrl"]];
            [channel addObject:[[channelsInfo objectAtIndex:index] valueForKey:@"vod_octo_js"]];
            
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
    bouquetChannels =[NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"4", @"bouquet_id" ,@"26",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,nil],
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"8", @"bouquet_id" ,@"26",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"10", @"bouquet_id" ,@"26",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,nil] ,
                      [NSMutableDictionary dictionaryWithObjectsAndKeys:@"4", @"bouquet_id" ,@"31",@"channel_id", @"2016-09-30 11:03:00",@"created_datetime" ,nil],nil];
    
    NSLog(@"setupBouquet_vs_ChannelsInfo");
    
    bouquetChannelsInfo = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    bouquetChannelsInfo = [deviceDB getBouquetChannels];
    NSLog(@"getBouquetChannels");
    
    
    if(bouquetChannelsInfo.count){
        NSLog(@"if:ViewController setupChannelsInfo() - load Channels from local db%@", bouquetChannelsInfo);
    }
    else{
        bouquetChannelsInfo = bouquetChannels;
        NSLog(@"else:ViewController setupChannelsInfo() - load default Channels %@", bouquetChannelsInfo);
        
        for(int index = 0; index < bouquetChannelsInfo.count; index ++){
            NSMutableArray *bouquetChannel = [[NSMutableArray alloc] init];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"bouquet_id"]];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"channel_id"]];
            [bouquetChannel addObject:[[bouquetChannelsInfo objectAtIndex:index] valueForKey:@"created_datetime"]];
            
            
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"bouquet_vs_channels"]){
                NSLog(@"bouquet_vs_channels table not exit, create a one");
                
                [deviceDB createTable:@"bouquet_vs_channels" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, bouquet_id INTEGER NOT NULL, channel_id INTEGER NOT NULL, created_datetime TEXT)"];
                
            } else {
                NSLog(@"bouquet_vs_channels table already created");
            }
            [deviceDB insertRecordIntoBouquet_vs_Channels:bouquetChannel];
            
        }
        
    }
}

-(void) setupVersioningInfo
{
    versioning = [NSMutableArray arrayWithObjects:[NSMutableDictionary dictionaryWithObjectsAndKeys:@"channel", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bouquet", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"bouquet_vs_channels", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil], [NSMutableDictionary dictionaryWithObjectsAndKeys:@"profile", @"tablename", @"1987-09-10 00:00:00",@"version" ,nil],nil];
       
    NSLog(@"setupVersioningInfo");
    
    versioningInfo = [[NSMutableArray alloc] init];
    NSLog(@"Before connect with DB");
    versioningInfo = [deviceDB getVersioningInfo];
    NSLog(@"getVersioningInfo:%@", versioningInfo);
    
    
    if(versioningInfo.count){
        NSLog(@"if:ViewController setupVersioningInfo() - load Channels from local db%@", versioningInfo);
    }
    else{
        versioningInfo = versioning;
        NSLog(@"else:ViewController setupVersioningInfo() - load default Channels %@", versioningInfo);
        
        for(int index = 0; index < versioningInfo.count; index ++){
            NSMutableArray *versioningData = [[NSMutableArray alloc] init];
            [versioningData addObject:[[versioningInfo objectAtIndex:index] valueForKey:@"tablename"]];
            [versioningData addObject:[[versioningInfo objectAtIndex:index] valueForKey:@"version"]];
            
            
            //NSLog(@"bouquet info %@", bouquet);
            if(![deviceDB isTableExist:@"versioning"]){
                NSLog(@"versioning table not exit, create a one");
                
                [deviceDB createTable:@"versioning" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, tablename TEXT,   version TEXT)"];
                
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
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
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
