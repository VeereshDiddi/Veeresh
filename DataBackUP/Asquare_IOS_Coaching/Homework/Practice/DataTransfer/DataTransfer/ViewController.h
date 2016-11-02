//
//  ViewController.h
//  DataTransfer
//
//  Created by MacBook Pro on 30/06/16.
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
@property (weak, nonatomic) IBOutlet UITextField *mailTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
- (IBAction)saveButtonClicked:(id)sender;

- (IBAction)viewData:(id)sender;

-(void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex;


@end

