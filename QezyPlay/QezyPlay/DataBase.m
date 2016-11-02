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
        
        NSString *insertDetailTable = @"INSERT INTO Bouquets (name, bouquetID, imageName, downloadUrl) VALUES (?, ?, ?, ?)" ;
        
        sqlite3_stmt *statement;
        
        if (sqlite3_prepare_v2(
                               sqliteDB,
                               [insertDetailTable cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            
            sqlite3_bind_text(statement, 1, [[array objectAtIndex:0] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 2, [[array objectAtIndex:1] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 3, [[array objectAtIndex:2] UTF8String], -1, NULL);
            
            sqlite3_bind_text(statement, 4, [[array objectAtIndex:3] UTF8String], -1, NULL);
            
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
    bouquets = [[NSMutableArray alloc] init];
    
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB) == SQLITE_OK) {
        NSString *selectSql = @"SELECT * FROM Bouquets";
        
        if (sqlite3_prepare_v2(
                               sqliteDB, [selectSql cStringUsingEncoding:NSUTF8StringEncoding], -1,
                               &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                NSString *name = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        1))];
                NSString *bouquetID = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        2))];
                NSString *imageName = [[NSString alloc]
                                  initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                        3))];
                
                NSString *downloadUrl = [[NSString alloc]
                                   initWithUTF8String:(const char *)(sqlite3_column_text(statement,
                                                                                         4))];
                
                NSLog (@"query result: %@ %@ %@ %@", name, bouquetID, imageName, downloadUrl);
                
                NSDictionary *bouquetInfo =[NSDictionary dictionaryWithObjectsAndKeys:name,@"name",
                                            bouquetID,@"bouquetID", imageName,@"imageName", downloadUrl, @"downloadUrl",nil];
                
                [bouquets addObject: bouquetInfo];
                
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
    return bouquets;
    
}
@end
