//  © Copyright 2009 Neal Goldstein. All rights reserved.
//  For more information on this sample application or Objective-C For Dummies
//  Please visit www.nealgoldstein.com


#import "iVacationAppDelegate.h"
#import "iVacationViewController.h"

@implementation iVacationAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
  
  // Override point for customization after app launch    
  [window addSubview:viewController.view];
  [window makeKeyAndVisible];
}


- (void)dealloc {
  [viewController release];
  [window release];
  [super dealloc];
}


@end
