//
//  ViewController.h
//  UIPickerViewDemo
//
//  Created by AsquareMobileTechnologies on 6/11/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{
    int selectedRow;
    NSString *playerStr,*dummyStr;
}

@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong,nonatomic)UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@end

