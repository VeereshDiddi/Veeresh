//
//  AppDelegate.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "AppDelegate.h"
#import "VideoPlayer.h"
#import "FavoritesViewController.h"
#import "VarGlobal.h"
#import "Player.h"
#import <FacebookSDK/FacebookSDK.h>
#import <QuartzCore/QuartzCore.h>

OCOctoshapeSystem *octoshapeSystem;

struct Player *player;

NSTimer *updateTimer;
NSTimer *playTimer;


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:33.0f/255.0f
                                                                  green:39.0f/255.0f
                                                                   blue:73.0f/255.0f
                                                                  alpha:1.0f]];
    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    // change title color
    
    
    player = malloc(sizeof(struct Player));
    memset(player, 0, sizeof(struct Player));
    
    [FBLoginView class];

    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"AppDelegate: call applicationWillResignActive");
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
    NSLog(@"AppDelegate: call applicationDidEnterBackground");
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    
    NSLog(@"AppDelegate: call applicationWillEnterForeground");
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
    [self checkForNetWorkConnection];
    
    if(octoshapeSystem != nil) [octoshapeSystem resume];
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
    
}

- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    //NSLog(@"enter supportedInterfaceOrientationsForWindows");
    
#ifdef ORIENTATION_CHANGE
    NSLog(@"enter support orientation change");
    if ([self.window.rootViewController.presentedViewController isKindOfClass: [VideoPlayer class]])
    {
        NSLog(@"enter VideoPlayer view");
        //VideoPlayer *videoPlayer = (VideoPlayer *) self.window.rootViewController.presentedViewController;
        
        //NSLog(@"Current view videoPlayer %d", videoPlayer.isPresented);
        
        if (player->isPresented)
            return UIInterfaceOrientationMaskLandscape;
        else return UIInterfaceOrientationMaskAll;
    }
    else return UIInterfaceOrientationMaskAll;
    
#else
    return UIInterfaceOrientationMaskAll;
    
#endif
    
}


#pragma mark - Reachability
//check network connection
-(BOOL)checkForNetWorkConnection
{
    reachable = [Reachability reachabilityWithHostName:@"www.google.co.in"];
    
    if (reachable != nil)
    {
        NetworkStatus internetStatus = [reachable currentReachabilityStatus];
        
        if (( internetStatus != ReachableViaWiFi) && (internetStatus != ReachableViaWWAN))
            
        {
            UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Network Alert !!" message:@"Please Check Your Internet Connection " delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
            [alert show];
            
            //Dismiss alert message when app enter background
            [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification* notification){
                [alert dismissWithClickedButtonIndex:0 animated:NO];
            }];
            
            alert.tag=100;
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        }
        
        else
        {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
            NSLog(@"Network Connection Available");
        }
        
    }
    
    return YES;
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"AppDelegate: alertView");
    if (buttonIndex ==0 || buttonIndex ==1)
    {
        //home button press programmatically
        UIApplication *app = [UIApplication sharedApplication];
        [app performSelector:@selector(suspend)];
        
        //wait 2 seconds while app is going background
        [NSThread sleepForTimeInterval:1.0];
        
        //exit app when app is in background
        exit(0);
    }
}


#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.ideabytes.Cobra_News" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Cobra_News" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"Cobra_News.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    
    return [FBAppCall handleOpenURL:url
                  sourceApplication:sourceApplication];
}

@end
