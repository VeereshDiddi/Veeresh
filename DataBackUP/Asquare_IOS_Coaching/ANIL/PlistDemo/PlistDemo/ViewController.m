//
//  ViewController.m
//  PlistDemo
//
//  Created by AsquareMobileTechnologies on 6/16/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    NSMutableArray *plistDataArr =[self getArrayPlistDataFromDocumentsDirectory];
//    NSArray *dataArr = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];

    NSLog(@"Plist Data :%@",plistDataArr);
    [self addArrayDataToPlist:plistDataArr];

    // Do any additional setup after loading the view, typically from a nib.
    [self addDictionaryDataToPlist];
    [self getPlistDataFromBundleDirectory];
}
-(NSString*)getFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"asquare.plist"];
    return filePath;
}
-(NSString*)getFilePath1{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"asquare1.plist"];
    return filePath;
}
-(void)addArrayDataToPlist:(NSArray*)dataArr{
    
//    NSArray *dataArr = [NSArray arrayWithObjects:@"a",@"b",@"c",@"d", nil];
    [dataArr writeToFile:[self getFilePath] atomically:YES];
}

-(void)addDictionaryDataToPlist{
    
    NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithCapacity:0];
    [dic setObject:@"asquare" forKey:@"name"];
    [dic setObject:@"1234567890" forKey:@"mobile"];
    [dic setObject:@"ino@asquareit.com" forKey:@"email"];
    [dic setObject:@"S.R Nagar" forKey:@"address"];
    [dic writeToFile:[self getFilePath1] atomically:YES];
    NSLog(@"Dictionary:%@", dic);
}

-(NSMutableArray*)getArrayPlistDataFromDocumentsDirectory{
   
    return [NSMutableArray arrayWithContentsOfFile:[self getFilePath]];
}
-(NSDictionary*)getDictionaryPlistDataFromDocumentsDirectory{
    
    return [NSDictionary dictionaryWithContentsOfFile:[self getFilePath]];
}
-(void)getPlistDataFromBundleDirectory{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"test" ofType:@"plist"];
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        [dic setObject:@"S.R Nagar" forKey:@"address"];
        [dic setObject:@"Hyderabad" forKey:@"city"];
        [dic writeToFile:filePath atomically:YES];
        NSLog(@"Dic test.plist :%@",dic);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
