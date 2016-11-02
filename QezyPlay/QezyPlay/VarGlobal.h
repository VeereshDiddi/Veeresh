//
//  VarGlobal.h
//  QezyPlay
//
//  Created by ideabytes on 2016-08-24.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#ifndef VarGlobal_h
#define VarGlobal_h

#import "player.h"

#define TIMER_INTERVAL 1*30
#define DEFAULT_TIMEOUT 30*60
#define TIME_CHECK_INTERVAL 1*60


//#define ORIENTATION_CHANGE

extern OCOctoshapeSystem *octoshapeSystem;

extern struct Player *player;

extern NSTimer *updateTimer;
extern NSTimer *playTimer;


#endif /* VarGlobal_h */
