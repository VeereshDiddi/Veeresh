//
//  Player.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef Player_h
#define Player_h

enum serverStatus {OK=1, ERROR, UNKNOWN};

struct Player {
    
    //NSString *urlLink;
    
    bool isPlaying;
    bool isPresented;
    
    bool isServerResponse;
    
    enum serverStatus isServerWorking;
    
    int appTimeOut;
    int appTimeOutDefault;
    float minVersionRequred;
    int updateInterval;
    
    
};


#endif /* Player_h */
