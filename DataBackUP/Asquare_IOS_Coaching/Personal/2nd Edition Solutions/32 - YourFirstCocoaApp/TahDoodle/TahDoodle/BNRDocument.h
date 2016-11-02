//
//  BNRDocument.h
//  TahDoodle
//
//  Created by Michael L Ward on 2/9/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BNRDocument : NSDocument <NSTableViewDataSource>

@property (nonatomic) NSMutableArray *tasks;
@property (nonatomic) IBOutlet NSTableView *taskTable;
- (IBAction)addTask:(id)sender;

@end
