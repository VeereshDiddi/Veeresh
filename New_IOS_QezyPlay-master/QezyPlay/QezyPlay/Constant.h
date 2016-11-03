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

extern NSMutableArray *defaulBouquets;
extern NSMutableArray *channelsInDefaultBouquets;
extern NSMutableArray *channels;
extern NSMutableArray *bouquetChannels;
extern NSMutableArray *versioning;

extern NSString *bouquetsSC;
extern NSString *channelBouquetsSC;
extern NSString *channelsSC;
extern NSString *profilesSC;
extern NSString *loginSC;
extern NSString *customersSC;
extern NSString *resetSC;
extern NSString *privacyPolicySC;

#endif /* Constant_h */
