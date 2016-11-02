//
//  ViewController.h
//  GetWebserviceDemo
//
//  Created by AsquareMobileTechnologies on 7/9/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property(strong,nonatomic)NSMutableArray *dataArr;

@property (weak, nonatomic) IBOutlet UITableView *tblView;
@property(strong,nonatomic)NSMutableData *responseData;

@end

