//
//  ViewController.h
//  UITextfield
//
//  Created by Asquare on 5/25/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    UITextField *nameTF;
    UIButton *addBtn;
    int i;
    int xVal;
    int yVal;
}
@property(nonatomic,strong)NSMutableArray *dataArr;


@end

