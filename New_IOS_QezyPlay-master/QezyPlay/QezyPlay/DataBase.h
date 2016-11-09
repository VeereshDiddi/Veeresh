//
//  DataBase.h
//  QezyPlay
//
//  Created by ideabytes on 2016-09-07.
//  Copyright © 2016 ideabytes. All rights reserved.
//
#ifndef Database_h
#define Database_h

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface DataBase : NSObject

-(void) createTable: (NSString *) tableName : (NSString*) tableDef;
-(Boolean) isDBPathAvailable;
-(void) deleteTable: (NSString*) tableName;
-(void) renameTable: (NSString*) oldName : (NSString *) newName;
-(BOOL) isTableExist:(NSString *)tableName;

-(NSMutableArray *) getFavoritesChannelList;
-(void) insertRecordIntoFavorites: (NSMutableArray *) array;

-(void) insertRecordIntoProfile: (NSMutableArray *) array;
- (void) insertRecordIntoProfileDetails:(NSString *) tableName : (NSMutableArray *)array;
-(NSMutableArray *) getAllProfiles;
- (NSMutableArray *) getProfileChannelList: (NSString *) tableName;

-(void) updateRecord: (NSString *) tableName : (NSString *) originName : (NSString *)newName;
-(void) updateRecordInTable:(NSString *) tableName : (NSString *) key : (NSString *) fieldName : (NSString *)newValue;

-(void) deleteRecordFromTable:(NSString *) tableName : (NSString *) keyName : (NSString *) keyValue;
-(BOOL) recordExistOrNot:(NSString *)tableName : (NSString *) key : (NSString *) keyValue;

- (void)insertRecordIntoChannelList:(NSMutableArray *)array;
- (NSMutableArray *)getChannelInBouquet: (NSString *) bouquetID;

-(void)insertRecordIntoBouquets:(NSMutableArray *)array;
- (NSMutableArray *)getBouquets;

-(void)insertRecordIntoChannels:(NSMutableArray *)array;
- (NSMutableArray *)getChannels;

-(void)insertRecordIntoBouquet_vs_Channels:(NSMutableArray *)array;
- (NSMutableArray *)getBouquetChannels;

-(void)insertRecordIntoVersioning:(NSMutableArray *)array;
- (NSMutableArray *)getVersioningInfo;
- (NSMutableArray *)getBouquet_vs_Channels;
- (NSMutableArray *)getBouquetDetails:(NSMutableArray *)array;
//- (NSMutableArray *)getBouquetDetails;

-(NSMutableArray *)getChannelIdBasedonBouquetId:(NSString *)bouquet_Id;

@end

#endif /* Database_h */