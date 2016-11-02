//
//  DeleteViewController.h
//  ASquareExam
//
//  Created by MacBook Pro on 03/07/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface DeleteViewController : UIViewController
{
    NSInteger index;
}
@property(strong,nonatomic)ViewController *deleteViewObj;
@property(strong,nonatomic)NSMutableArray *detailsArray;
@property (strong, nonatomic) IBOutlet UITextField *nameTextF;
@property (strong, nonatomic) IBOutlet UITextField *stateTextF;
@property (strong, nonatomic) IBOutlet UITextField *cityTextF;

- (IBAction)deleteButtonClicked:(id)sender;

@end
