//
//  main.m
//  Structure1
//
//  Created by MacBook Pro on 03/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
//To access any member of a structure, use the dot operator ..
struct Books
{
   __unsafe_unretained NSString *title;
   __unsafe_unretained NSString *author;
   __unsafe_unretained NSString *subject;
    int id;
};

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        struct Books Book1;  /* Declare Book1 of type Book */
        Book1.title = @"Objective-C Programming";
        Book1.author = @"Veeresh";
        Book1.subject = @"Objective-C Programming Tutorial";
        Book1.id = 1;
        NSLog(@"Book title:%@\n", Book1.title);
        NSLog(@"Book author:%@\n", Book1.author);
        NSLog(@"Book subject:%@\n", Book1.subject);
        NSLog(@"Book id:%d\n", Book1.id);
        
        
    }
    return 0;
}
