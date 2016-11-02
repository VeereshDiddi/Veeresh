//
//  RecipeViewController.h
//  CollectionViewDemo
//
//  Created by MacBook Pro on 06/05/16.
//  Copyright © 2016 Appcoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *recipeImageView;
//@property (weak, nonatomic) NSString *recipeImageName;

- (IBAction)close:(id)sender;

@end
