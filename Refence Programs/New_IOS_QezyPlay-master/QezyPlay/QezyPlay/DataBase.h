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

- (NSMutableArray *)getFavoritesChannelList;
- (void)insertRecordIntoFavorites:(NSMutableArray *)array;
-(void) deleteRecordFromFavorites:(NSString*) imageName;
-(void) deleteTable: (NSString*) tableName;

@end

#endif /* Database_h */