//
//  ViewController.h
//  ProtocalAndDelegate
//
//  Created by MacBook Pro on 17/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SampleProtocal.h"

@interface ViewController : UIViewController<SampleProtocolDelegate>
{
    IBOutlet UILabel *myLabel;
}


@end

