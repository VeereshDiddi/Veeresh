//
//  Constant.h
//  QezyPlay
//
//  Created by ideabytes on 2016-10-29.
//  Copyright © 2016 ideabytes. All rights reserved.
//


#ifndef Constant_h
#define Constant_h


// If the following is defined, we will use a database to
//   store a channellist.
// * The database is empty initially.
// * Once the package logo image is triggered, didSelectItemAtIndexPath()
//   will trigger the database check.
// * If the channellist exists, we will load from the database.
//   Otherwise, we will check server and write the channellist from the server
//   to the database.
#define USE_DATABASE_FOR_CHANLIST


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width


#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width

#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define BASEURL @"http://104.198.91.157:6363/api/"

//http://104.196.99.177:6363/api/  ==Main URL
//http://104.198.91.157:6363/api/ == optional URL

#define bouquetsSC [NSString stringWithFormat:@"%@Bouquets",BASEURL]

#define channelBouquetsSC [NSString stringWithFormat:@"%@Bouquets",BASEURL]

#define versioningSC [NSString stringWithFormat:@"%@DataSyncs/checkUpdates",BASEURL]

#define registrationSC [NSString stringWithFormat:@"%@Customers",BASEURL]

#define channelsSC [NSString stringWithFormat:@"%@Channels",BASEURL]

#define profilesSC [NSString stringWithFormat:@"%@Profiles",BASEURL]

#define loginSC [NSString stringWithFormat:@"%@Customers/login",BASEURL]

#define resetSC [NSString stringWithFormat:@"%@Customers/reset",BASEURL]

#define privacyPolicySC [NSString stringWithFormat:@"%@Privacy_Policy.htm",BASEURL]

#define requestURLSC [NSString stringWithFormat:@"%@Bouquets",BASEURL]






extern NSMutableArray *defaulBouquets;
extern NSMutableArray *channelsInDefaultBouquets;
extern NSMutableArray *channels;
extern NSMutableArray *versioning;
extern NSMutableArray *bouquetChannels;
extern NSMutableArray *profiles;
extern NSMutableArray *channelsInProfiles;
extern NSMutableArray *subscriptionPlans;
extern NSMutableArray *subscriptionPlansBouquet;

//extern NSString *channelBouquetsSC;
//extern NSString *channelsSC;
//extern NSString *profilesSC;
//extern NSString *loginSC;
//extern NSString *customersSC;
//extern NSString *resetSC;
//extern NSString *privacyPolicySC;

#endif /* Constant_h */




