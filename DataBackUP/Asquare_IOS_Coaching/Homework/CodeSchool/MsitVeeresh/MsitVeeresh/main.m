//
//  main.m
//  MsitVeeresh
//
//  Created by MacBook Pro on 18/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface MsitVeeresh:NSObject
@property NSString *mobileName;
@property NSString *modelNumber;
-(void)speak;
-(NSString *)speak1;
-(NSArray *)speak2;
@end

@implementation MsitVeeresh
-(void)speak;
{
    NSLog(@"Hello Veeeresh");
    NSLog(@"Self Variable:%@",self);
    NSLog(@"Phone Name:%@", _mobileName);
};
-(NSString *)speak1
{
    return [NSString stringWithFormat:@"%@ %@", self.mobileName, self.modelNumber];
}
-(NSArray *)speak2
{
//    return @[_mobileName, _modelNumber];
    return @[self.mobileName, self.modelNumber];
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        MsitVeeresh *msitVeeresh = [[MsitVeeresh alloc] init];
        msitVeeresh.mobileName = @"Virsys";
        msitVeeresh.modelNumber = @"J0022";
        NSLog(@"%@", msitVeeresh.mobileName);
        NSLog(@"%@", msitVeeresh.modelNumber);
        [msitVeeresh speak];
        NSString *str = [msitVeeresh speak1];
        NSLog(@"Return Type String:%@", str);
        NSLog(@"Return Typpe String2:%@", [msitVeeresh speak1]);
        NSLog(@"Return Type Array:%@", [msitVeeresh speak2]);
    }
    return 0;
}
