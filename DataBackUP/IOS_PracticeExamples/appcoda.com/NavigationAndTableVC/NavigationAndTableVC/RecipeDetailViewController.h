//
//  RecipeDetailViewController.h
//  NavigationAndTableVC
//
//  Created by MacBook Pro on 02/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *recipeLabel;
@property (nonatomic, strong) NSString *recipeName;

@end
