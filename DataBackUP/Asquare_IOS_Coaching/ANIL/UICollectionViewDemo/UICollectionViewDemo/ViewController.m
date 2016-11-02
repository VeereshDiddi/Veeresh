//
//  ViewController.m
//  UICollectionViewDemo
//
//  Created by AsquareMobileTechnologies on 6/9/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 20;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    UIImageView *imgView = (UIImageView*)[cell viewWithTag:20];
    UILabel *lbl = (UILabel*)[cell viewWithTag:10];
    lbl.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row+indexPath.section];
    imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%ld.jpeg",indexPath.row+1]];
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
