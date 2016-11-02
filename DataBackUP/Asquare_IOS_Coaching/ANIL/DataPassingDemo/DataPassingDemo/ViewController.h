//
//  ViewController.h
//  DataPassingDemo
//
//  Created by AsquareMobileTechnologies on 6/4/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    NSInteger selectedIndex;
}

@property (nonatomic,strong)NSMutableArray *dataArr;
@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *mobileTF;
@property (weak, nonatomic) IBOutlet UITextField *emailTF;
@property (weak, nonatomic) IBOutlet UITextField *pwdTF;
- (IBAction)viewData:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn;
- (IBAction)buttonCliked:(id)sender;
-(void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex;
@end

