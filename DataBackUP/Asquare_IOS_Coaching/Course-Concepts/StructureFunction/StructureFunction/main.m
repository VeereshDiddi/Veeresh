//
//  main.m
//  StructureFunction
//
//  Created by MacBook Pro on 03/06/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>
//You can pass a structure as a function argument.

struct Books
{
    __unsafe_unretained NSString *title;
    __unsafe_unretained NSString *author;
    __unsafe_unretained NSString *subject;
    int id;
};

@interface SampleClass:NSObject
- (void) printBook: (struct Books) book;
@end

@implementation SampleClass

- (void) printBook: (struct Books) book
{
    NSLog(@"Book title : %@\n", book.title);
    NSLog(@"Book author : %@\n", book.author);
    NSLog(@"Book subject : %@\n", book.subject);
    NSLog(@"Book id : %d\n", book.id);
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        struct Books Book1;
        Book1.title = @"Objective-C Programming";
        Book1.author = @"Veeresh";
        Book1.subject = @"Objective-C Programming Tutorial";
        Book1.id = 1;
        SampleClass *sampleClass = [[SampleClass alloc] init];
        [sampleClass printBook: Book1];
    }
    return 0;
}
