//
//  main.m
//  NSStringProblem1
//
//  Created by MacBook Pro on 23/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        
        //Creating Strings
        
/*        NSString *make = @"Porsche";
        NSString *model = @"911";
        int year = 1968;
        NSString *message = [NSString stringWithFormat:@"That's a %@ %@ from %d!", make, model, year];
        NSLog(@"%@", message);
        
        //Enumerating Strings
        
        for (int i=0; i<[make length]; i++) {
            char letter = [make characterAtIndex:i];
            //Unicode decimal number for the character.
            unichar letter1 = [make characterAtIndex:i];
            NSLog(@"%d: %c", i, letter);
            NSLog(@"%d: %hu", i, letter1);
            
        }
        //Comparing Strings
        NSString *car = @"Porsche Boxster";
        if ([car isEqualToString:@"Porsche Boxster"]) {
            NSLog(@"Equal");
        }
        if ([car hasPrefix:@"Porsche"]) {
            NSLog(@"Thet car is a Porsche Prefix");
        }
        if ([car hasSuffix:@"Carrera"]) {
            NSLog(@"This is Suffix");
        }
        else
        {
            NSLog(@"This is not Suffix");
        }
        
        NSString *otherCar = @"QFerrari";
//        NSComparisonResult result = [car compare:otherCar];
        NSComparisonResult  result = [car caseInsensitiveCompare:otherCar];
        if (result == NSOrderedAscending) {
            NSLog(@"The letter 'P' comes before 'F");
        }
        else if (result == NSOrderedSame)
        {
            NSLog(@"We're comparing the same string");
        }
        else if (result == NSOrderedDescending)
        {
            NSLog(@"The letter 'P' comes after 'F'");
        }     */
        
/*        //Combining Strings
        
        NSString *make = @"Ferrari";
        NSString *model = @"458 Spider";
        NSString *car = [make stringByAppendingString:model];
        NSLog(@"%@", car);
        car = [make stringByAppendingFormat:@"%@", model];
        NSLog(@"%@", car);    */
        
/*        //Searching Strings
        NSString *car = @"Maserati GranCabrio";
        NSRange searchResult = [car rangeOfString:@"Cabrio"];
        if (searchResult.location == NSNotFound) {
            NSLog(@"Searching string was not found");
        }
        else
        {
            NSLog(@"'Cabrio' starts at index %lu and is %lu characters long", searchResult.location, searchResult.length);
        }     */
/*        //Subdividing Strings
        NSString *car = @"Maserati GranTurismo";
        NSLog(@"%@", [car substringToIndex:8]);
        NSLog(@"%@", [car substringFromIndex:9]);
        NSRange range = NSMakeRange(9, 4);
        NSLog(@"%@", [car substringWithRange:range]);
        
        
        NSString *models = @"Porsche,Ferrari,Maserati";
        NSArray *modelsAsArray = [models componentsSeparatedByString:@","];
        NSLog(@"%@", [modelsAsArray objectAtIndex:1]);    */
        
/*        //Replacing Substrings
        NSString *elise = @"Lotus Elise";
        NSRange range = NSMakeRange(6, 5);
        NSString *exige = [elise stringByReplacingCharactersInRange:range withString:@"Exige"];
        NSLog(@"%@", exige);
        NSString *evora = [exige stringByReplacingOccurrencesOfString:@"Exige" withString:@"Evora"];
        NSLog(@"%@", evora);     */
        
/*        //Changing Case
        NSString *car = @"lotUs beSpoKE";
        NSLog(@"%@", [car lowercaseString]);
        NSLog(@"%@", [car uppercaseString]);
        NSLog(@"%@", [car capitalizedString]);   */
        
/*        //Numerical Conversions
        NSString *year = @"2012";
        BOOL asBool = [year boolValue];
        int asInt = [year intValue];
        NSInteger asInteger = [year integerValue];
        long long asLongLong = [year longLongValue];
        float asFloat = [year floatValue];
        double asDouble = [year doubleValue];
        NSLog(@"String Value is:%@", year);
        NSLog(@"BOOL Value is:%i", asBool);
        NSLog(@"int value is:%d", asInt);
        NSLog(@"NSInteger value is:%lu", asInteger);
        NSLog(@"Long Long value is:%llu", asLongLong);
        NSLog(@"float value is:%f", asFloat);
        NSLog(@"double value is:%f", asDouble);  */
        
/*        //compare:options
        NSString *requiredVersion = @"1.2.0";
        NSString *actualVersion = @"1.1.5";
        if ([requiredVersion compare:actualVersion options:NSNumericSearch] == NSOrderedDescending) {
            NSLog(@"actual<required");
        }  */
        
/*        //objective c compare range intersect
        NSRange a = NSMakeRange(10, 90);
        NSRange b = NSMakeRange(60, 10);
        NSRange intersection = NSIntersectionRange(a, b);
        if (intersection.length <= 0) {
            NSLog(@"Ranges do not intersect");
        }
        else
        {
            NSLog(@"Intersection = %@", NSStringFromRange(intersection));
        }    */
        
/*    //localizedCompare
 NSString *str1 = [NSString stringWithString:NSLocalizedString(@"string", @"")];
        NSString *str2 = [NSString stringWithString:NSLocalizedString(@"strings", @"")];
        switch ([str1 localizedCompare:str2]) {
            case NSOrderedAscending:
                NSLog(@"NSOrderedAScending");
                break;
            case NSOrderedSame:
                NSLog(@"NSOrderedSame");
                break;
            case NSOrderedDescending:
                NSLog(@"NSOrderedDescending");
                break;
                
            default:
                NSLog(@"Not Selected");
                break;
        }     */
        
/*        //commonPrefixWithString
        NSString *str1 = [NSString stringWithString:@"abcdefg"];
        NSString *str2 = [NSString stringWithString:@"abcdeee"];
        NSLog([str1 commonPrefixWithString:str2 options:NSCaseInsensitiveSearch]);   */
/*        //containsString
        NSString *string = @"hello bla bla";
        if ([string containsString:@"bla"]) {
            NSLog(@"string contains bla!");
        }
        else
        {
            NSLog(@"string does not contain bla");
        }   */
        
/*        //rangeOfString
        NSString *string = @"hello bla bla";
        if ([string rangeOfString:@"bla"].location  == NSNotFound) {
            NSLog(@"string does not contain bla");
        }
        else
        {
            NSLog(@"string contains bla!");
        }   */
        
/*        NSArray *allName = @[@"does jenny work", @"JENNy works", @"works with JEnny", @"ram", @"jhon"];
        NSMutableArray *results = [NSMutableArray new];
        for (NSString *name in allName) {
            if ([name rangeOfString:@"jenny" options:NSCaseInsensitiveSearch range:NSMakeRange(0, name.length) locale:[NSLocale currentLocale]].location != NSNotFound) {
                [results addObject:name];
            }
        }
        NSLog(@"results : >%@<", results);   */
 /*       //rangeOfComposedCharacterSequenceAtIndex:
        NSString *aString = [[NSString alloc] initWithString:@"abcdefghijklmnopqrstuvwxyzab\rcabcdefghijklmnopqrstuvwxyzzbczbcdefg"];
        NSRange aRange = [aString rangeOfComposedCharacterSequenceAtIndex:1];
        NSLog(@"test070 %lu-%lu", aRange.location, aRange.length);   */
        
        //rangeOfComposedCharacterSequencesForRange:
        NSString *comm = @"audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set audio session category set ";
        NSLog(@"%lu",(unsigned long) [comm length]);
        NSRange range = [comm rangeOfComposedCharacterSequencesForRange:(NSRange){71, [comm length]-71}];
        NSString *truncString = [comm substringWithRange:range];
        NSLog(@"Welcome=%@", truncString);
        
    }
    return 0;
}
