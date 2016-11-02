//
//  ViewController.h
//  CustomizingKeyboard4
//
//  Created by MacBook Pro on 15/04/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    
    IBOutlet UITextField *phoneNumber;
   
}
@property (retain, nonatomic) IBOutlet UITextField *phoneNumber;


- (IBAction)screentouch:(id)sender;


@end

