//
//  ViewController.h
//  ArraImageView
//
//  Created by MacBook Pro on 28/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic)    NSMutableArray *array;

@property (strong, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)previousButtonAction:(id)sender;

- (IBAction)nextButtonAction:(id)sender;



@end

