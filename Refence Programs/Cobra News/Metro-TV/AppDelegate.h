//
//  AppDelegate.h
//  Metro-TV
//
//  Created by IDEABYTES on 6/11/15.
//  Copyright (c) 2015 IDEABYTES. All rights reserved.
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
@property (weak, nonatomic) OCOctoshapeSystem *octoshapeSystem;

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;
-(BOOL)checkForNetWorkConnection;

@end