//
//  AppDelegate.h
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "Reachability.h"
#import "include/OCAPI.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIBackgroundTaskIdentifier  bgTask;
    NSTimer *timer1;
    UIActivityIndicatorView *activityIndicator;
    Reachability *reachable;
}


@property (strong, nonatomic) UIWindow *window;

//@property (weak, nonatomic) OCOctoshapeSystem *octoshapeSystem;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(BOOL)checkForNetWorkConnection;
@end

