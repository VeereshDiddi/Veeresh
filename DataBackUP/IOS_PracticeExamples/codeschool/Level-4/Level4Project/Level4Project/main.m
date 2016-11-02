//
//  main.m
//  Level4Project
//
//  Created by MacBook Pro on 21/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MsitPhone.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        MsitPhone *iphone = [[MsitPhone alloc] init];
        iphone.phoneName = @"Virsys";
        iphone.modelNumber = @"V6S";
        
        NSLog(@"main-->Phone Name is:%@", iphone.phoneName);
        NSLog(@"main-->Model Number is:%@", iphone.modelNumber);
        
        [iphone speak];
        NSString *sp1 = [iphone speak1];
        NSLog(@"speak1 calling in main.m is:%@", sp1);
        
        NSArray *sp2 = [iphone speak2];
        NSLog(@"speak2 calling in main.m is:%@", sp2);
        
        NSString *sp3 = [iphone speak3:@"Veeresh"];
        NSLog(@"sp3 argument passing return type in main.m is:%@",sp3);
        
        [iphone reportBatteryLife:@100];
        
        //        iphone.lastName = @"Diddi";
        
        [iphone changeLastName:@"Diddi"];
        
    }
    return 0;
}
