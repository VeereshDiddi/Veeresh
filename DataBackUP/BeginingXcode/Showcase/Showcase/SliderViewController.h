//
//  SliderViewController.h
//  Showcase
//
//  Created by MacBook Pro on 12/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SliderViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UISlider *redSlider;
@property (weak, nonatomic) IBOutlet UISlider *greenSlider;
@property (weak, nonatomic) IBOutlet UISlider *blueSlider;


@property (weak, nonatomic) IBOutlet UITextField *redValue;
@property (weak, nonatomic) IBOutlet UITextField *greenValue;
@property (weak, nonatomic) IBOutlet UITextField *blueValue;


- (IBAction)changeRed:(id)sender;
- (IBAction)changeGreen:(id)sender;
- (IBAction)changeBlue:(id)sender;





@end

