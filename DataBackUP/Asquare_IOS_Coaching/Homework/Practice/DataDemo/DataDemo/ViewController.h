//
//  ViewController.h
//  DataDemo
//
//  Created by MacBook Pro on 01/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSInteger selectedIndex;
}

@property(nonatomic, strong)NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
- (IBAction)saveButtonCilcked:(id)sender;
- (void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex;
- (IBAction)viewData:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

