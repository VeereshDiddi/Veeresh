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
        NSString *filePath = [[[NSBundle mainBundle] resourcePath]
                              stringByAppendingPathComponent:@"DataBase.sqlite"];
        
        [[NSFileManager defaultManager] copyItemAtPath:filePath
                                                toPath:writablePath
                                                 error:nil];
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
                NSLog(@"%@ table can not be created", tableName);
            }
            
        }
        else {
            NSLog(@"Can not open database");
        }
        
        sqlite3_close(sqliteDB);
    }else {
        NSLog(@"file not at the path");
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
       
            NSLog(@"fill data");
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

-(void) deleteRecordFromFavorites:(NSString*) imageName
{
   
    sqlite3_stmt *statement;
    
    if (sqlite3_open([dataBasepath UTF8String], &sqliteDB)==SQLITE_OK) {
        NSString *deleteSql=[NSString stringWithFormat:@"DELETE from Favorites WHERE imageName = '%@'",imageName];
        
        if (sqlite3_prepare_v2(sqliteDB, [deleteSql cStringUsingEncoding:NSUTF8StringEncoding], -1, &statement, NULL)==SQLITE_OK) {
            
            
            if (sqlite3_step(statement)==SQLITE_DONE) {
                NSLog(@"deleted row for %@", imageName);
            }
            else{
                NSLog(@"cann't delet record");
            }
            
            sqlite3_finalize(statement);
            sqlite3_close(sqliteDB);
        }
    }
}


@end
