//
//  DataBase.m
//  QezyPlay
//
//  Created by ideabytes on 2016-09-07.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "DataBase.h"

@implementation DataBase {
    NSString *dataBasepath;
    sqlite3 *sqliteDB;
    
    NSMutableArray *channelList;
    NSMutableArray *profiles;
    NSMutableArray *profileChannels;
    
    NSMutableArray *channelsInBouquet;
    NSMutableArray *bouquets;
    NSMutableArray *channels;
    NSMutableArray *bouquetChannels;

    
    NSMutableArray *versionArray;
}

- (id)init {
    self = [super init];
    
    if (self != nil) {
        [self createDataBaseIfNeeded];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                             NSUserDomainMask, YES);
        NSString *documentDirectory = [paths objectAtIndex:0];
        
        dataBasepath = [[NSString alloc]
                        initWithString:[documentDirectory
                                        stringByAppendingPathComponent:@"DataBase.sqlite"]];
        
        NSLog(@"Database path: %@", dataBasepath);
    }
    
    return self;
}

- (void)createDataBaseIfNeeded {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *docmentDirectory = [paths objectAtIndex:0];
    NSString *writablePath =
    [docmentDirectory stringByAppendingPathComponent:@"DataBase.sqlite"];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:writablePath]) {
        NSLog(@"file exist");
    }
    
    else {
        NSLog(@"Database: create new database");
        NSString *filePath = [[[NSBundle mainBundle] resourcePath]
                              stringByAppendingPathComponent:@"DataBase.sqlite"];
        
        NSError *error = nil;
        
        if(![[NSFileManager defaultManager] copyItemAtPath:filePath
                                                toPath:writablePath
                                                     error:&error]){
            
            NSLog(@"error copying database from bundle: %@", error);
        }
            
    }
}

- (void)createTable: (NSString*) tableName : (NSString*) tableDef {
    NSLog (@"DataBase: enter createTable");
    
    if ([tableName isEqualToString:@"bouquets"]) {
        tableDef = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER, name TEXT, imageUrl TEXT, image2xUrl TEXT, image3xUrl TEXT, meta_data TEXT, meta_description TEXT, create_datetime TEXT, updated_datetime TEXT, downloadUrl TEXT, is_free TEXT, status INTEGER, imagehdpiUrl TEXT, imageldpiUrl TEXT, imagemdpiUrl TEXT, imagexhdpiUrl TEXT, imagexxhdpiUrl TEXT, imagexxxhdpiUrl TEXT)";
    }
    
    if ([tableName isEqualToString:@"channels"]) {
        tableDef = @"CREATE TABLE IF NOT EXISTS %@ (id INTEGER, name TEXT, Url TEXT, octo_js TEXT, vodUrl TEXT, vod_octo_js TEXT, imageUrl TEXT, meta_data TEXT, meta_description TEXT, status INTEGER, created_datetime TEXT, updated_datetime TEXT,  image2xUrl TEXT, image3xUrl TEXT, imagehdpiUrl TEXT, imageldpiUrl TEXT, imagemdpiUrl TEXT, imagexhdpiUrl TEXT, imagexxhdpiUrl TEXT, imagexxxhdpiUrl TEXT, downloadUrl TEXT, category TEXT)";
    }
 
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    if ([fileManager fileExistsAtPath:dataBasepath] == YES) {
        const char *dbPath = [dataBasepath UTF8String];
        
        char *error;
        NSLog(@"enter fileExistersAtPath");
        if (sqlite3_open(dbPath, &sqliteDB) == SQLITE_OK) {
            //NSString*  query = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT, url TEXT, image TEXT)", tableName];
            NSString*  query = [NSString stringWithFormat:tableDef, tableName];
            if (sqlite3_exec(sqliteDB, [query UTF8String], NULL, NULL, &error) ==
                SQLITE_OK) {
                NSLog(@"%@ table created", tableName);
            }
            
            else {
                NSLog(@"%@ table can not be created %s", tableName, error);
            }
            
        }
        else {
            NSLog(@"Can not open database");
        }
        
        sqlite3_close(sqliteDB);
    }else {
        NSLog(@"created table failed: file not at the path");
    }
}

-(void) deleteTable: (NSString*) tableName {
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        NSString *deleteSql=[NSString stringWithFormat:@"DROP TABLE IF EXISTS %@", tableName];
        
        if (sqlite3_prepare_v2(sqliteDB, [deleteSql cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL)==SQLITE_OK) {
            
            
            if (sqlite3_step(statement)==SQLITE_DONE) {
                NSLog(@"%@ deleted", tableName);
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
}

-(void) renameTable: (NSString*) oldName : (NSString *) newName {
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        NSString *renameSql=[NSString stringWithFormat:@"ALTER TABLE %@ RENAME TO %@", oldName, newName];
        
        if (sqlite3_prepare_v2(sqliteDB, [renameSql cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL)==SQLITE_OK) {
            
            
            if (sqlite3_step(statement)==SQLITE_DONE) {
                NSLog(@"rename %@ to %@", oldName, newName);
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
}

- (void)insertRecordIntoFavorites:(NSMutableArray *)array {
    
    NSLog(@"Database: enter insertRecordIntoFavorites");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable =
        @"INSERT INTO Favorites (imageName, link, groups) VALUES (?, ?, ?)";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
       
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into Favorites table");
            }
            
            else {
                NSLog(@"failed to insert Favorites table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
}

- (NSMutableArray *)getFavoritesChannelList {
    
    channelList = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM Favorites";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *name = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        1))];
                
                NSString *link = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        2))];
                
                NSString *group = [[NSString alloc]
                                   initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                         3))];
                
                NSLog (@"query result: %@ %@ %@", name, link, group);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:name,@"name",
                                           link,@"link", group, @"group",nil];
                
                [channelList addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return channelList;
}


- (void)insertRecordIntoProfile:(NSMutableArray *)array {
    
    NSLog(@"Database: enter insertRecordIntoProfile");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable =
        @"INSERT INTO Profile (profileName, imagePath) VALUES (?, ?)";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into Profile table");
            }
            
            else {
                NSLog(@"failed to insert Profile table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed for inserting record into profile");
        }
        
    }
}

- (void)insertRecordIntoProfileDetails:(NSString *) tableName : (NSMutableArray *)array {
    
    NSLog(@"Database: enter insertRecordIntoProfileDetails");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable = [NSString stringWithFormat:@"INSERT INTO %@ (imageName, link, channelDescription) VALUES (?, ?, ?)", tableName ];
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into %@ table", tableName);
            }
            
            else {
                NSLog(@"failed to insert %@ table", tableName);
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
}


-(void) deleteRecordFromTable:(NSString *) tableName : (NSString *) keyName : (NSString *) keyValue
{
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE from %@ WHERE %@ = '%@'", tableName, keyName, keyValue];
        
        if (sqlite3_prepare_v2(sqliteDB, [deleteSql cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL)==SQLITE_OK) {
            
            
            if (sqlite3_step(statement)==SQLITE_DONE) {
                NSLog(@"deleted row from %@ for %@", tableName, keyValue);
            }
            else{
                NSLog(@"cann't delet record");
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
}

- (NSMutableArray *)getProfileChannelList: (NSString *) tableName {
    
    profileChannels = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM %@", tableName];
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *imageName = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        1))];
                
                NSString *link = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        2))];
                
                NSString *channelDescription = [[NSString alloc]
                                   initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                         3))];
                
                NSLog (@"query result: %@ %@ %@", imageName, link, channelDescription);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:imageName,@"imageName",
                                            link,@"link", channelDescription, @"channelDescription",nil];
                
                [profileChannels addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return profileChannels;
}

- (NSMutableArray *)getAllProfiles {
    
    profiles = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM Profile";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *profileName = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        1))];
                
                NSString *imagePath = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        2))];
                NSString *isLocked = [[NSString alloc]
                                      initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                            3))];
                NSString *password = [[NSString alloc]
                                      initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                            4))];
                
                NSLog (@"query result: %@ %@ %@ %@", profileName, imagePath, isLocked, password);
                
                NSDictionary *profile =[NSDictionary dictionaryWithObjectsAndKeys:profileName,@"profileName",
                                            imagePath,@"imagePath", isLocked,@"isLocked", password,@"password", nil];
                
                [profiles addObject: profile];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    
    return profiles;
}

-(void)updateRecord:(NSString *) tableName : (NSString* ) originName : (NSString *)newName
{
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        
        sqlite3_stmt *statement;
        
        NSString *insertDetailsTable=[NSString stringWithFormat:@"UPDATE %@ SET profileName ='%@' WHERE profileName ='%@'", tableName, newName, originName];
        sqlite3_prepare_v2(sqliteDB, [insertDetailsTable cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL);
        
        
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSLog(@"update profile name at Profile table");
        }
        
        else
        {
            NSLog(@"failed");
        }
        
        
        sqlite3_step(statement);
        sqlite3_close(sqliteDB);
    }
    
}

-(void) updateRecordInTable:(NSString *) tableName : (NSString *) key : (NSString *) fieldName : (NSString *)newValue
{
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        
        sqlite3_stmt *statement;
        
        NSString *insertDetailsTable=[NSString stringWithFormat:@"UPDATE %@ SET %@ ='%@' WHERE profileName ='%@'", tableName, fieldName, newValue, key];
        sqlite3_prepare_v2(sqliteDB, [insertDetailsTable cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL);
        
        
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSLog(@"update %@ at %@ table", fieldName, tableName);
        }
        
        else
        {
            NSLog(@"failed");
        }
        
        
        sqlite3_step(statement);
        sqlite3_close(sqliteDB);
    }
    
}

-(BOOL)recordExistOrNot:(NSString *)tableName : (NSString *) key : (NSString *) keyValue{
    BOOL recordExist=NO;
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        
            sqlite3_stmt *statement;
            
            NSString * query = [NSString stringWithFormat:@"select * from %@ where %@ = '%@'", tableName, key, keyValue];
            
            sqlite3_prepare_v2(sqliteDB, [query cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL);
            {
                if (sqlite3_step(statement)==SQLITE_ROW)
                {
                    recordExist=YES;
                }
                else
                {
                    //////NSLog(@"%s,",sqlite3_errmsg(database));
                }
                sqlite3_step(statement);
                sqlite3_close(sqliteDB);
            }
    }
    return recordExist;
}

-(BOOL)isTableExist:(NSString *)tableName {
    BOOL isExist=NO;
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        
        sqlite3_stmt *statement;
        
        NSString * query = [NSString stringWithFormat:@"select * from sqlite_master WHERE type = 'table' AND name='%@'", tableName];
        
        sqlite3_prepare_v2(sqliteDB, [query cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL);
        {
            if (sqlite3_step(statement)==SQLITE_ROW)
            {
                isExist=YES;
            }
            else
            {
                //////NSLog(@"%s,",sqlite3_errmsg(database));
            }
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return isExist;
}

-(Boolean) isDBPathAvailable{
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dataBasepath] == YES)
        return YES;
    else
        return NO;
}

- (void)insertRecordIntoChannelList:(NSMutableArray *)array {
    
    NSLog(@"Database: enter insertRecordIntoChannelList");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable =
        @"INSERT INTO ChannelList (bouquetID, channelName, channelID, imageName, imagePath, channelDescription, channelGroup, ChannelUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 4, [[array objectAtIndex:3] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 5, [[array objectAtIndex:4] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 6, [[array objectAtIndex:5] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 7, [[array objectAtIndex:6] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 8, [[array objectAtIndex:7] UTF8String], -1, NULL);
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into channelList table");
            }
            
            else {
                NSLog(@"failed to insert channelList table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
}

- (NSMutableArray *)getChannelInBouquet: (NSString *) bouquetID {
    
    channelsInBouquet = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM ChannelList where bouquetID = '%@' ", bouquetID];
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *channelName = [[NSString alloc]
                                         initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                               2))];
                
                NSString *channelID = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             3))];
                
                NSString *imageName = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             4))];
                
                NSString *imagePath = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement, 5))];
                
                NSString *channelDescription = [[NSString alloc]
                                                initWithUTF8String:(const char *)(sqlite3_column_text(statement, 6))];
                
                NSString *channelGroup = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement, 7))];
                
                NSString *channelUrl = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement, 8))];
                
                NSLog (@"query result: %@ %@ %@ %@ %@ %@ %@", channelName, channelID, imageName, imagePath, channelDescription, channelGroup, channelUrl);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:channelName,@"channelName", channelID,@"channelID", imageName,@"imageName", imagePath,@"imagePath", channelDescription,@"channelDescription", channelGroup,@"channelGroup", channelUrl,@"channelUrl", nil];
                
                [channelsInBouquet addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return channelsInBouquet;
}

-(void)insertRecordIntoBouquets:(NSMutableArray *)array{
    NSLog(@"Database: enter insertRecordIntoBouquets");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable = @"INSERT INTO bouquets (id, name, imageUrl, image2xUrl, image3xUrl, meta_data, meta_description, create_datetime, updated_datetime, downloadUrl, is_free, status, imagehdpiUrl, imageldpiUrl, imagemdpiUrl, imagexhdpiUrl, imagexxhdpiUrl, imagexxxhdpiUrl) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ;
        
        
        NSLog(@" %@ ",insertDetailTable);
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_int(statement, 1, (int)[[array objectAtIndex:0] integerValue]);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 4, [[array objectAtIndex:3] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 5, [[array objectAtIndex:4] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 6, [[array objectAtIndex:5] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 7, [[array objectAtIndex:6] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 8, [[array objectAtIndex:7] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 9, [[array objectAtIndex:8] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 10, [[array objectAtIndex:9] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 11, [[array objectAtIndex:10] UTF8String], -1, NULL);
            
            sqlite3_bind_int(statement, 12, (int)[[array objectAtIndex:11] integerValue]);
            
            sqlite3_bind_text(statement, 13, [[array objectAtIndex:12] UTF8String], -1, NULL);
            
/*            sqlite3_bind_text(statement, 14, [[array objectAtIndex:13] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 15, [[array objectAtIndex:14] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 16, [[array objectAtIndex:15] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 17, [[array objectAtIndex:16] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 18, [[array objectAtIndex:17] UTF8String], -1, NULL);*/
            
            
            sqlite3_bind_int(statement, 14, (int)[[array objectAtIndex:13] integerValue]);
            sqlite3_bind_int(statement, 15, (int)[[array objectAtIndex:14] integerValue]);
            sqlite3_bind_int(statement, 16, (int)[[array objectAtIndex:15] integerValue]);
            sqlite3_bind_int(statement, 17, (int)[[array objectAtIndex:16] integerValue]);
            sqlite3_bind_int(statement, 18, (int)[[array objectAtIndex:17] integerValue]);
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into Bouquets table");
            }
            
            else {
                NSLog(@"failed to insert Bouquets table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
    
}
- (NSMutableArray *)getBouquets{
    NSLog(@"getBouquets:DB");
    bouquets = [[NSMutableArray alloc] init];
    int count = 0;
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSLog(@"dataBasepath:");
        NSString *selectSql = @"SELECT * FROM bouquets";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            NSLog(@"sqlite3_prepare_v2");
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                count = sqlite3_column_int(statement, 0);
               // NSLog(@"count:%i", count);
                NSString *id = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        0))];
               // NSLog(@"id:%@", id);
                NSString *name = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             1))];
               // NSLog(@"name:%@", name);
                NSString *imageUrl = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             2))];
               // NSLog(@"imageUrl:%@", imageUrl);
                NSString *image2xUrl = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              3))];
                //NSLog(@"image2xUrl:%@", image2xUrl);
                NSString *image3xUrl = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              4))];
               // NSLog(@"image3xUrl:%@", image3xUrl);
                NSString *meta_data = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             5))];
               // NSLog(@"meta_data:%@", meta_data);
                NSString *meta_description = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    6))];
               // NSLog(@"meta_description:%@", meta_description);
                NSString *create_datetime = [[NSString alloc]
                                             initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                   7))];
               // NSLog(@"create_datetime:%@", create_datetime);
                NSString *updated_datetime = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    8))];
                
                //NSLog(@"updated_datetime:%@", updated_datetime);
                NSString *downloadUrl = [[NSString alloc]
                                         initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                               9))];
               // NSLog(@"downloadUrl:%@", downloadUrl);
                NSString *is_free = [[NSString alloc]
                                     initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                           10))];
               // NSLog(@"is_free:%@", is_free);
                NSString *status = [[NSString alloc]
                                    initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                          11))];
                //NSLog(@"status:%@", status);
 /*              NSString *imagehdpiUrl = [[NSString alloc]
                                    initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                          12))];
                NSLog(@"imagehdpiUrl:%@", imagehdpiUrl);
                NSString *imageldpiUrl = [[NSString alloc]
                                    initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                          14))];
                NSLog(@"imageldpiUrl:%@", imageldpiUrl);
                NSString *imagemdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                15))];
                NSLog(@"imagemdpiUrl:%@", imagemdpiUrl);
                NSString *imagexhdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                16))];
            NSLog(@"imagexhdpiUrl:%@", imagexhdpiUrl);
            NSString *imagexxhdpiUrl = [[NSString alloc]
                                           initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                 17))];
            NSLog(@"imagexxhdpiUrl:%@", imagexxhdpiUrl);
            NSString *imagexxxhdpiUrl = [[NSString alloc]
                                           initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                 18))];
                NSLog(@"imagexxxhdpiUrl:%@", imagexxxhdpiUrl);  */
                
             //   NSLog (@"query result: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@", id, name, imageUrl, image2xUrl, image3xUrl, meta_data, meta_description, create_datetime, updated_datetime, downloadUrl, is_free, status, imagehdpiUrl, imageldpiUrl, imagemdpiUrl, imagexhdpiUrl, imagexxhdpiUrl, imagexxxhdpiUrl );
                NSLog (@"query result: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ ", id, name, imageUrl, image2xUrl, image3xUrl, meta_data, meta_description, create_datetime, updated_datetime, downloadUrl, is_free, status);
                
                NSDictionary *bouquetInfo =[NSDictionary dictionaryWithObjectsAndKeys:id, @"id",name,@"name",
                imageUrl,@"imageUrl",image2xUrl,@"image2xUrl",image3xUrl,@"image3xUrl",
                    meta_data,@"meta_data",
                    meta_description,@"meta_description",
                    create_datetime,@"create_datetime",
                    updated_datetime,@"updated_datetime",
                    downloadUrl,@"downloadUrl",
                    is_free, @"is_free",
                    status,@"status", nil];
                
                [bouquets addObject: bouquetInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    //NSLog(@"bouquets:DB:%@", bouquets);
    return bouquets;
}

-(void)insertRecordIntoChannels:(NSMutableArray *)array{
    NSLog(@"Database: enter insertRecordIntoChannels");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        
        
        NSString *insertDetailTable = @"INSERT INTO channels (id, name, Url, octo_js, vodUrl, vod_octo_js, imageUrl, meta_data, meta_description, status, created_datetime, updated_datetime, image2xUrl, image3xUrl, imagehdpiUrl, imageldpiUrl, imagemdpiUrl, imagexhdpiUrl, imagexxhdpiUrl, imagexxxhdpiUrl,downloadUrl, category) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)" ;
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(sqliteDB,[insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_int(statement, 1, (int)[[array objectAtIndex:0] integerValue]);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 4, [[array objectAtIndex:3] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 5, [[array objectAtIndex:4] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 6, [[array objectAtIndex:5] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 7, [[array objectAtIndex:6] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 8, [[array objectAtIndex:7] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 9, [[array objectAtIndex:8] UTF8String], -1, NULL);
            
            sqlite3_bind_int(statement, 10, (int)[[array objectAtIndex:9] integerValue]);
            
            sqlite3_bind_text(statement, 11, [[array objectAtIndex:10] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 12, [[array objectAtIndex:11] UTF8String], -1, NULL);
            
            sqlite3_bind_int(statement, 13, (int)[[array objectAtIndex:12] integerValue]);
            
            sqlite3_bind_int(statement, 14, (int)[[array objectAtIndex:13] integerValue]);
            
            sqlite3_bind_int(statement, 15, (int)[[array objectAtIndex:14] integerValue]);
            
            sqlite3_bind_int(statement, 16, (int)[[array objectAtIndex:15] integerValue]);
            
            sqlite3_bind_int(statement, 17, (int)[[array objectAtIndex:16] integerValue]);
            
            sqlite3_bind_int(statement, 18, (int)[[array objectAtIndex:17] integerValue]);
            
            sqlite3_bind_int(statement, 19, (int)[[array objectAtIndex:18] integerValue]);
            
            sqlite3_bind_int(statement, 20, (int)[[array objectAtIndex:19] integerValue]);
            
            sqlite3_bind_text(statement, 21, [[array objectAtIndex:20] UTF8String], -1, NULL);
            
            sqlite3_bind_int(statement, 22, (int)[[array objectAtIndex:21] integerValue]);
            
            
  /*          sqlite3_bind_text(statement, 13, [[array objectAtIndex:12] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 14, [[array objectAtIndex:13] UTF8String], -1, NULL);
            
            
            sqlite3_bind_text(statement, 15, [[array objectAtIndex:14] UTF8String], -1, NULL);
            
            
            sqlite3_bind_text(statement, 16, [[array objectAtIndex:15] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 17, [[array objectAtIndex:16] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 18, [[array objectAtIndex:17] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 19, [[array objectAtIndex:18] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 20, [[array objectAtIndex:19] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 21, [[array objectAtIndex:20] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 22, [[array objectAtIndex:21] UTF8String], -1, NULL);
            */
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into Channels table");
            }
            
            else {
                NSLog(@"failed to insert Channels table");
            }
            
            
            sqlite3_step(statement);
            sqlite3_finalize(statement);

            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
    
}



- (NSMutableArray *)getChannels
{
    channels = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM channels";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *id = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        0))];
                NSLog(@"id:%@", id);
                NSString *name = [[NSString alloc]
                                 initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                       1))];
                NSLog(@"name:%@", name);
                NSString *Url = [[NSString alloc]
                                     initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                           2))];
                NSLog(@"Url:%@", Url);
                NSString *octo_js = [[NSString alloc]
                                      initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                            3))];
                NSLog(@"octo_js:%@", octo_js);
                NSString *vodUrl = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             4))];
                NSLog(@"vodUrl:%@", vodUrl);
                NSString *vod_octo_js = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    5))];
                NSLog(@"vod_octo_js:%@", vod_octo_js);
                NSString *imageUrl = [[NSString alloc]
                                    initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                          6))];
                NSLog(@"imageUrl:%@", imageUrl);
                NSString *meta_data = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    7))];
                NSLog(@"meta_data:%@", meta_data);
                NSString *meta_description = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    8))];
                
                NSLog(@"meta_description:%@", meta_description);
                NSString *status = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              9))];
                NSLog(@"status:%@", status);
            NSString *created_datetime = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              10))];
            NSLog(@"created_datetime:%@", created_datetime);
            NSString *updated_datetime = [[NSString alloc]
                                         initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                               11))];
                NSLog(@"updated_datetime:%@", updated_datetime);
                NSString *image2xUrl = [[NSString alloc]
                                      initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                            12))];
                
               NSString *image3xUrl = [[NSString alloc]
                                    initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                          13))];
                NSString *imagehdpiUrl = [[NSString alloc]
                                         initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                               14))];
                NSString *imageldpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                15))];
                NSString *imagemdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                16))];
                NSString *imagexhdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                17))];
            NSString *imagexxhdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                18))];
            NSString *imagexxxhdpiUrl = [[NSString alloc]
                                          initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                19))];
                NSString *downloadUrl = [[NSString alloc]
                                            initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                  20))];
                NSString *category = [[NSString alloc]
                                             initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                   21))];
                NSLog (@"channel:query result: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",id, name, Url, octo_js, vodUrl, vod_octo_js, imageUrl, meta_data, meta_description, status, created_datetime, updated_datetime, image2xUrl, image3xUrl,imagehdpiUrl ,imageldpiUrl, imagemdpiUrl, imagexhdpiUrl, imagexxhdpiUrl, imagexxxhdpiUrl, downloadUrl, category);
                
               // NSLog (@"query result: %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@ %@",id, name, Url, octo_js, vodUrl, vod_octo_js, imageUrl, meta_data, meta_description, status, created_datetime, updated_datetime);
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:id,@"id",name,@"name",
                    Url,@"Url",octo_js,@"octo_js",vodUrl,@"vodUrl",
                        vod_octo_js,@"vod_octo_js",
                        imageUrl,@"imageUrl",
                        meta_data,@"meta_data",meta_description,@"meta_description",
                        status,@"status",
                    created_datetime,@"created_datetime",
                    updated_datetime,@"updated_datetime",
                    image2xUrl, @"image2xUrl",
                    image3xUrl,@"image3xUrl",
                    imagehdpiUrl,@"imagehdpiUrl",
                    imageldpiUrl,@"imageldpiUrl",
                    imagemdpiUrl,@"imagemdpiUrl",
                    imagexhdpiUrl,@"imagexhdpiUrl",
                    imagexxhdpiUrl,@"imagexxhdpiUrl",
                    imagexxxhdpiUrl,@"imagexxxhdpiUrl",
                    downloadUrl,@"downloadUrl",
                    category,@"category", nil];
                
                [channels addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
//    NSLog(@"channels:%@", channels);
    return channels;
    
}

-(void)insertRecordIntoBouquet_vs_Channels:(NSMutableArray *)array
{
    NSLog(@"Database: enter insertRecordIntoBouquet_vs_Channels");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable = @"INSERT INTO bouquet_vs_channels (id, bouquet_id, channel_id, created_datetime, updated_datetime) VALUES (?, ?, ?, ?, ?)" ;
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_int(statement, 1, (int)[[array objectAtIndex:0] integerValue]);
            
            sqlite3_bind_int(statement, 2, (int)[[array objectAtIndex:1] integerValue]);
            
            sqlite3_bind_int(statement, 3, (int)[[array objectAtIndex:2] integerValue]);
            
            sqlite3_bind_text(statement, 4, [[array objectAtIndex:3] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 5, [[array objectAtIndex:4] UTF8String], -1, NULL);
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into bouquet_vs_channels table");
            }
            
            else {
                NSLog(@"failed to insert bouquet_vs_channels table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
}


- (NSMutableArray *)getBouquetChannels
{
    bouquetChannels = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM bouquet_vs_channels";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                
                NSString *id = [[NSString alloc]
                                initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                      1))];
                NSString *bouquet_id = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              2))];
                NSString *channel_id = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              3))];
                NSString *created_datetime = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    4))];
                
                NSString *updated_datetime = [[NSString alloc]
                                              initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                                    5))];
                //CREATE TABLE IF NOT EXISTS %@ (id INTEGER, bouquet_id INTEGER NOT NULL, channel_id INTEGER NOT NULL, created_datetime TEXT, updated_datetime TEXT)"];
                NSLog (@"bouquet_vs_channels:query result: %@ %@ %@ %@ %@", id, bouquet_id, channel_id, created_datetime, updated_datetime);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:
                                            id, @"id", bouquet_id,@"bouquet_id",
                                            channel_id,@"channel_id",created_datetime,@"created_datetime"
                                            , updated_datetime, @"updated_datetime", nil];
                
                [bouquetChannels addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return bouquetChannels;
}

- (NSMutableArray *)getBouquet_vs_Channels
{
    NSMutableArray *bouquetChannelsArray = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM bouquet_vs_channels";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                

                NSString *bouquet_id = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              1))];
                NSString *channel_id = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              2))];
                
                //CREATE TABLE IF NOT EXISTS %@ (id INTEGER, bouquet_id INTEGER NOT NULL, channel_id INTEGER NOT NULL, created_datetime TEXT, updated_datetime TEXT)"];
               // NSLog (@"bouquet_vs_channels:query result: %@ %@ ", bouquet_id, channel_id);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:
                                             bouquet_id,@"bouquet_id",
                                            channel_id,@"channel_id", nil];
                
                [bouquetChannelsArray addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return bouquetChannelsArray;

}

- (NSMutableArray *)getBouquetDetails:(NSMutableArray *)array
{
    NSMutableArray *bouquetsArray = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    for (int index=0; index<array.count; index++) {
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT name, imageUrl, downloadUrl FROM bouquets where id = '%@' ", [array objectAtIndex:index]];
//        NSString *selectSql = @"SELECT name, imageUrl, downloadUrl FROM bouquets where id = 4 ";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                
                
                NSString *name = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              0))];
                NSString *imageUrl = [[NSString alloc]
                                        initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                              1))];
                NSString *downloadUrl = [[NSString alloc]
                                      initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                            2))];
                
                NSLog (@"bouquets:query result: %@ %@ %@", name, imageUrl, downloadUrl);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:
                                            name,@"name",
                                            imageUrl,@"imageUrl", downloadUrl,@"downloadUrl", nil];
                
                [bouquetsArray addObject: channelInfo];
                
            }
            }
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return bouquetsArray;

}



-(void)insertRecordIntoVersioning:(NSMutableArray *)array
{
    NSLog(@"Database: enter insertRecordIntoVersioning");
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        
        NSString *insertDetailTable = @"INSERT INTO versioning (tablename, version) VALUES (?, ?)" ;
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"inserted into versioning table");
            }
            
            else {
                NSLog(@"failed to insert versioning table");
            }
            
            // sqlite3_finalize(statement);
            
            sqlite3_step(statement);
            sqlite3_close(sqliteDB);
        }else {
            NSLog(@"prepare failed");
        }
        
    }
    
}

- (NSMutableArray *)getVersioningInfo
{
    versionArray = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM versioning";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                //  (id INTEGER PRIMARY KEY AUTOINCREMENT, tablename TEXT,   version TEXT)
                NSString *tablename = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             1))];
                NSString *version = [[NSString alloc]
                                     initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                           2))];
                
                
 //               NSLog (@"versioning result: %@ %@", tablename, version);
                
                NSDictionary *channelInfo =[NSDictionary dictionaryWithObjectsAndKeys:
                                            tablename,@"tablename",
                                            version,@"version",nil];
                
                [versionArray addObject: channelInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return versionArray;
}


-(NSMutableArray *)getChannelIdBasedonBouquetId:(NSString *)bouquet_Id
{
   NSMutableArray *chaneelIDListArray = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK)
    {
        NSString *selectSql = [NSString stringWithFormat:@"SELECT * FROM bouquet_vs_channels where bouquet_id = '%d'",[bouquet_Id intValue]];
        
        if (sqlite3_prepare_v2(sqliteDB, [selectSql UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *channelID = [[NSString alloc]
                                       initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                             2))];
                
                NSLog(@" %@ ",channelID);
                
                [chaneelIDListArray addObject:channelID];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    
    return chaneelIDListArray;
}

@end
