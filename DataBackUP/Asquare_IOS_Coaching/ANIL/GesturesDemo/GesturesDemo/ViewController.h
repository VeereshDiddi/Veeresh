//
//  ViewController.h
//  GesturesDemo
//
//  Created by AsquareMobileTechnologies on 6/30/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

