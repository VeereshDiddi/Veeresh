//
//  ChannelView.h
//  Qezy-TV
//
//  Created by ideabytes on 2016-05-09.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef ChannelView_h
#define ChannelView_h

#import <UIKit/UIKit.h>

@interface ChannelView : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *channelNames, *channelLinks;
    
}

- (IBAction)btnExitClick:(id)sender;

@end


#endif /* ChannelView_h */
