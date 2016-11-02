//
//  ViewController.h
//  UITextFieldSample
//
//  Created by AsquareMobileTechnologies on 5/21/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate>
{
    UITextField *userFld;
    UILabel *lbl;
    UIButton *btn;
}
@property (weak, nonatomic) IBOutlet UITextField *passFld;

@end

