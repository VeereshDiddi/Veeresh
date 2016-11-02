//
//  main.m
//  NSMutableStringProblem1
//
//  Created by MacBook Pro on 24/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
/*        // Normal String
        NSMutableString *mString = @"Hello Veeresh";
        NSLog(@"%@", mString);  */
        
//        NSMutableString *teststring = [[NSMutableString alloc]init];
/*        NSMutableString *teststring = [NSMutableString string];
        [teststring appendString:@"hey"];
        NSLog(teststring);   */
/*        //Creating Mutable Strings
        NSMutableString *car = [NSMutableString stringWithString:@"Porsche 911"];
        NSLog(@"instance value is:%@", car);
        [car setString:@"Porche Boxster"];
        NSLog(@"set String is:%@", car);   */
/*        //Expanding Mutable Strings
        NSMutableString *car = [NSMutableString stringWithCapacity:20];
        NSString *model = @"458 Spider";
        [car setString:@"Ferrari"];
        [car appendString:model];
        NSLog(@"%@", car);
        [car setString:@"Ferrari"];
        [car appendFormat:@" %@", model];
        NSLog(@"%@", car);
        
        [car setString:@"Ferrari Spider"];
        [car insertString:@"458 " atIndex:8];
        NSLog(@"%@", car);   */
        
/*        //Replacing/Deleting Substrings

        NSMutableString *car = [NSMutableString stringWithCapacity:50];
        [car setString:@"Lotus Elise"];
        [car replaceCharactersInRange:NSMakeRange(6, 5) withString:@"Exige"];
        NSLog(@"%@", car);
        [car deleteCharactersInRange:NSMakeRange(5, 3)];
        NSLog(@"%@", car);   */
        
/*        //When To Use Mutable Strings
        NSString *indices = @"";
        for (int i = 0; i <10; i++) {
            indices = [indices stringByAppendingFormat:@"%d", i];
            NSLog(@"%@", indices);
        }   */
        
/*        NSMutableString *indices = [NSMutableString stringWithCapacity:1];
        for (int i=0; i<10; i++) {
            [indices appendFormat:@"%d", i];
            NSLog(@"%@", indices);
        }    */
/*        //stringWithCapacity:
        NSMutableString *mutableString = [NSMutableString stringWithCapacity:5];
        NSLog(@"Empty:%@", mutableString);   */
/*        //initWithCapacity:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        NSLog(@"Empty:%@", mutableString);   */
/*        //appendFormat:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString appendFormat:@"%d %@", 1, @"Eezy"];
        NSLog(@"%@", mutableString);  */
/*        //appendString:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString appendString:@"Eezy"];
        NSLog(@"%@", mutableString);   */
/*        //deleteCharactersInRange:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString appendString:@"Eezy"];
        [mutableString deleteCharactersInRange:NSMakeRange(2, 2)];
        NSLog(@"%@", mutableString);  */
/*        //insertString:atIndex:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString appendString:@"Eezy"];
        [mutableString insertString:@"iOS " atIndex:0];
        NSLog(@"%@", mutableString);  */
/*        //replaceCharactersInRange:withString:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:10];
        [mutableString appendString:@"Eezy"];
        [mutableString replaceCharactersInRange:NSMakeRange(0, 2) withString:@"Tutorial"];
        NSLog(@"%@", mutableString);   */
/*        //replaceOccurrencesOfString: withString: options: range:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString appendString:@"Eezy"];
        [mutableString replaceOccurrencesOfString:@"E" withString:@"V" options:NSCaseInsensitiveSearch range:NSMakeRange(0, 4)];
        NSLog(@"%@", mutableString);  */
        //setString:
        NSMutableString *mutableString = [[NSMutableString alloc] initWithCapacity:5];
        [mutableString setString:@"VeereshsaaCADVAFDVFSVAFEWFWRFVVFdfafvsdfvdgbrhtyj"];
        NSLog(@"%@", mutableString);
    }
    return 0;
}
