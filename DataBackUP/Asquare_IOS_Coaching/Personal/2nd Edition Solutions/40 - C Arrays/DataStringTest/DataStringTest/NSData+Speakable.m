//
//  SpeakableBytes.m
//  DataStringTest
//
//  Created by Aaron Hillegass on 9/23/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import "NSData+Speakable.h"

static NSArray *words = nil;

void initializeWords()
{
    words = @[@"camry", @"nikon", @"apple", @"ford",
             @"audi", @"google", @"nike", @"amazon",
             @"honda", @"mazda", @"buick", @"fiat",
             @"jeep", @"lexus", @"volvo", @"fuji",
             @"sony", @"delta", @"focus", @"puma",
             @"samsung", @"tivo", @"halo", @"sting",
             @"shrek", @"avatar", @"shell", @"visa",
             @"vogue", @"twitter", @"lego", @"pepsi"];
}

void appendByteToString(unsigned char b, NSMutableString *str)
{
    // Get the three most significant bits as a number 0 - 7
    unsigned char digit = b >> 5;
    
    // Move to 2 - 9
    digit = digit + 2;
    
    // Get five least significant bits as a number 0 - 31
    unsigned char index = b & 0x1F;
    if (!words) {
        initializeWords();
    }
    
    // Get the appropriate word
    NSString *word = words[index];
    
    //NSLog(@"made %02x into %d %@", b, digit, word);

    [str appendFormat:@"%d %@", digit, [word capitalizedString]];
}

BOOL byteForDigitWord(unsigned char i, NSString *word, unsigned char *cPtr)
{
    // digit must be in 0 - 7
    unsigned char digit = i - 2;

    // Does the array exist?
    if (!words) {
        initializeWords();
    }
    
    // What is the index of the word?
    NSUInteger index = [words indexOfObject:word];
    if (index == NSNotFound) {
        return NO;
    }
    
    // Put the digit and index into one byte
    *cPtr = ((unsigned char)index) | (digit << 5);
    
    //NSLog(@"made %02x for %d %@", *cPtr, i, word);
    
    return YES;
}

// Assumes the string is lowercase and has no spaces or tabs
// Trims consumed string from beginning
BOOL firstByteForString(NSMutableString *str, unsigned char *cPtr)
{
    // This will hold the characters '2' - '9'
    static NSCharacterSet *digits = nil;
    
    // Initialize digits if necessary
    if (!digits) {
        NSMutableCharacterSet *digitsMutable = [[NSCharacterSet decimalDigitCharacterSet] mutableCopy];
        [digitsMutable removeCharactersInString:@"01"];
        digits = digitsMutable;
    }
    
    // Get the number at the beginning of the string
    int i = [str intValue];
    
    // Check to make sure it is legit
    if ((i < 2) || (i > 9)) {
        return NO;
    }
        
    // Skip the first character (a digit) and search for the next digit
    NSRange searchRange = NSMakeRange(1, [str length] - 1);
    NSRange nextDigitRange = [str rangeOfCharacterFromSet:digits
                                          options:NSLiteralSearch
                                            range:searchRange];
    NSRange wordRange;
    // Are we at the end?
    if (nextDigitRange.length == 0) {
        
        // Return the rest of the string
        wordRange = NSMakeRange(1, [str length] - 1);
    } else {
        
        // Return everything between the two digits
        wordRange = NSMakeRange(1, nextDigitRange.location - 1);
    }
    
    // Get the substring
    NSString *word = [str substringWithRange:wordRange];
    
    // The digit and the substring off the front of str
    [str replaceCharactersInRange:NSMakeRange(0, wordRange.length + 1)
                       withString:@""];
    
    // Return the appropriate byte of data
    return byteForDigitWord((unsigned char)i, word, cPtr);
}

@implementation NSData (Speakable)


- (NSString *)encodeAsSpeakableString
{
    // Create a string to append to
    NSMutableString *str = [[NSMutableString alloc] init];
    
    // Get a pointer to the bytes in the NSData
    unsigned char *dataPtr = (unsigned char *)[self bytes];
    NSUInteger size = [self length];
    
    // Step through the bytes, append each to str
    for (NSUInteger i = 0; i < size; i++) {
        
        // Is this not the first pass?
        if (i != 0) {
            
            // Add a space to separate things
            [str appendString:@" "];
        }
        
        // Append the digit and string
        appendByteToString(dataPtr[i], str);
    }
    return str;
}

+ (NSData *)dataWithSpeakableString:(NSString *)s
                              error:(NSError **)e;
{
    // Make string lowercase
    NSString *lower = [s lowercaseString];
    
    // Remove spaces and tabs
    NSMutableString *string = [lower mutableCopy];
    [string replaceOccurrencesOfString:@" "
                            withString:@""
                               options:NSLiteralSearch
                                 range:NSMakeRange(0, [string length])];
    
    [string replaceOccurrencesOfString:@"\t"
                            withString:@""
                               options:NSLiteralSearch
                                 range:NSMakeRange(0, [string length])];
    
    // Create a mutable data that we will append bytes to
    NSMutableData *d = [[NSMutableData alloc] init];
    
    // Append bytes and trim the string from the front until it is gone
    while ([string length] > 0) {
        unsigned char c;
        BOOL success = firstByteForString(string, &c);
        
        // Did the parse fail?
        if (!success) {
            
            // Did the caller give me a place to put the error?
            if (e) {
                NSDictionary *userInfo = @{NSLocalizedDescriptionKey : @"Unable to parse"};
                *e = [NSError errorWithDomain:@"SpeakableBytes"
                                         code:1
                                     userInfo:userInfo];
                return nil;
            }
        }
        
        // Add the byte to the end of the data
        [d appendBytes:&c length:1];
    }
    
    return d;
}

@end
