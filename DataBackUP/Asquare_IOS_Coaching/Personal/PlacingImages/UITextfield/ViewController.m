//
//  ViewController.m
//  UITextfield
//
//  Created by Asquare on 5/25/16.
//  Copyright © 2016 Asquare. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    xVal = 10;
    self.dataArr = [[NSMutableArray alloc]initWithCapacity:0];
    nameTF=[[UITextField alloc]initWithFrame:CGRectMake(10,20,200, 35)];
    nameTF.borderStyle=UITextBorderStyleRoundedRect;
    nameTF.backgroundColor=[UIColor redColor];
    nameTF.placeholder=@"please enter name";
    [self.view addSubview:nameTF];
    
    yVal = nameTF.frame.origin.y +nameTF.frame.size.height;
    
    addBtn=[[UIButton alloc]initWithFrame:CGRectMake(230, 20,90, 35)];
    addBtn.backgroundColor=[UIColor greenColor];
    [addBtn setTitle:@"Add" forState:UIControlStateNormal];
    [addBtn addTarget:self action:@selector(addAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:addBtn];
    
        
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)addAction:(UIButton *)sender{
    if ([nameTF.text length]==0) {
        NSLog(@"Textfield is empty");
        return;
    }
    i++;
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithCapacity:0];
    [dic setValue:nameTF.text forKey:@"name"];
    [dic setValue:[NSString stringWithFormat:@"%d.jpeg",i] forKey:@"image"];
    [self.dataArr addObject:dic];
    [self addImageAndLabelToView];
}

-(void)addImageAndLabelToView{
    NSMutableDictionary *dic = [self.dataArr objectAtIndex:(i-1)];

    UIImageView *imgView = [[UIImageView alloc]initWithFrame:CGRectMake(xVal, yVal+20, 135, 100)];
    UIImage *img = [UIImage imageNamed:[dic objectForKey:@"image"]];
    imgView.image = img;
    [self.view addSubview:imgView];
    
    UILabel *nameLbl = [[UILabel alloc]initWithFrame:CGRectMake(xVal, imgView.frame.origin.y+imgView.frame.size.height, imgView.frame.size.width, 20)];
    nameLbl.textAlignment =NSTextAlignmentCenter;
    nameLbl.text = [dic objectForKey:@"name"];
    [self.view addSubview:nameLbl];
    if (i%2) {
        xVal = xVal +imgView.frame.size.width +20;
        
    }else{
        xVal = 0;
        yVal = yVal +nameLbl.frame.size.height+nameLbl.frame.origin.y;
    }
    nameTF.text = @"";
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
