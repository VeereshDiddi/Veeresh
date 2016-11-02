//
//  ViewController.h
//  NSNotificationCenterDemo
//
//  Created by AsquareMobileTechnologies on 6/22/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    
    NSInteger selectedRow;
}

@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property (strong,nonatomic) NSMutableArray *dataArr;
- (IBAction)addBtnClicked:(id)sender;
@end

