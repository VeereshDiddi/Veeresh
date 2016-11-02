//
//  main.m
//  NSArray-namesChallenge
//
//  Created by John Gallagher on 1/4/14.
//  Copyright (c) 2014 bignerdranch.com. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // Read in proper names file and make an array of names
        NSString *nameString = [NSString stringWithContentsOfFile:@"/usr/share/dict/propernames"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        NSArray *names = [nameString componentsSeparatedByString:@"\n"];

        // Read in words file and make an array of words
        NSString *wordString = [NSString stringWithContentsOfFile:@"/usr/share/dict/words"
                                                         encoding:NSUTF8StringEncoding
                                                            error:NULL];
        NSArray *words = [wordString componentsSeparatedByString:@"\n"];

        // Loop over all names and print ones that are also common words
        for (NSString *name in names) {
            // Lower-case the name
            NSString *lowerCaseName = [name lowercaseString];

            if ([words containsObject:lowerCaseName]) {
                NSLog(@"%@", name);
            }
        }
    }
    return 0;
}

