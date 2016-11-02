//
//  main.m
//  NSArrayProblem1
//
//  Created by MacBook Pro on 24/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
/*        //Creating Arrays
        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi", @"Diddi"];
        NSArray *ukMakes = [NSArray arrayWithObjects:@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley", nil];
        NSLog(@"First German make:%@", germanMakes[0]);
        NSLog(@"First U K make:%@", [ukMakes objectAtIndex:0]);  */
/*        //Enumerating Arrays

        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
        //With fast enumeration
        for (NSString *item in germanMakes) {
            NSLog(@"%@", item);
        }
        NSLog(@"------------------------------");
        
        for (int i=0; i < [germanMakes count]; i++) {
            NSLog(@"%@", germanMakes[i]);
        }   */
/*        //Comparing Arrays
        NSArray *germanMakes = @[@"MErcedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
        NSArray *sameGermanMakes = [NSArray arrayWithObjects:@"MErcedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi", nil];
        if ([germanMakes isEqualToArray:sameGermanMakes]) {
            NSLog(@"Oh, good, literal arrays are the same as NSArrays");
        }   */
/*        //Membership Checking

        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
        //BOOL Checking
        if ([germanMakes containsObject:@"BMW"])  {
            NSLog(@"BMW is a German auto maker");
        }
        //Index Checking
        NSUInteger index = [germanMakes indexOfObject:@"BMW"];
        if (index == NSNotFound) {
            NSLog(@"Well that's not quite right...");
            
        }
        else
        {
            NSLog(@"BMW is a Germa auto maker and is at index:%ld", index);
        }   */
/*        //Sorting Arrays
        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
        NSArray *sortedMakes = [germanMakes sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2)
                                {
                                    if ([obj1 length] < [obj2 length]) {
                                        return NSOrderedAscending;
                                    }
                                    else if ([obj1 length] > [obj2 length])
                                    {
                                        return NSOrderedDescending;
                                    }
                                    else
                                    {
                                        return NSOrderedSame;
                                    }
                                    
                                }];
        NSLog(@"%@", sortedMakes);   */
        
        
        
        
         /*       //Filtering Arrays
        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkswagen", @"Audi"];
        NSPredicate *beforeL = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings)
                                {
                                    NSComparisonResult result = [@"L" compare:evaluatedObject];
                                    if (result == NSOrderedDescending) {
                                        return YES;
                                    }
                                    else
                                    {
                                        return NO;
                                    }
                                }];
        NSArray *makesBeforeL = [germanMakes filteredArrayUsingPredicate:beforeL];
        NSLog(@"%@", makesBeforeL);  */
/*        //Subdividing Arrays
        NSArray *germanMakes = @[@"MErcedes-Benz", @"BMW", @"Porsche", @"Opel", @"Diddi", @"Virsys", @"Volkswagen", @"Audi"];
        NSArray *lastTwo = [germanMakes subarrayWithRange:NSMakeRange(4, 2)];
        NSLog(@"%@", lastTwo);   */
/*        //Combining Arrays
        NSArray *germanMakes = @[@"Mercedes-Benz", @"BMW", @"Porsche", @"Opel", @"Volkawagen", @"Audi"];
        NSArray *ukMakes = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
        NSArray *allMakes = [germanMakes arrayByAddingObjectsFromArray:ukMakes];
        NSLog(@"%@", allMakes);  */
        
/*        //String Conversion

        NSArray *ukMakes = @[@"Aston Martin", @"Lotus", @"Jaguar", @"Bentley"];
        NSLog(@"%@", [ukMakes componentsJoinedByString:@", "]);   */
/*        //Modern Objective C Array notations.
        NSArray *array = @[@"Eezy", @"Tutorials"];
        NSString *value = array[0];
        NSLog(@"%@", value);  */
/*        //array
        NSArray *array = [NSArray array];
        NSLog(@"%@", array);  */
/*        //arrayWithObject:
        NSArray *array = [NSArray arrayWithObject:@"Eezy"];
        NSLog(@"%@", array);  */
/*        //arrayWithObjects:
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", nil];
        NSLog(@"%@", array);   */
/*        //arrayWithArray:
        
        NSArray *tempArray = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", nil];
        NSLog(@"%@", tempArray);
        NSArray *array = [NSArray arrayWithArray:tempArray];
        NSLog(@"%@", array);
        NSArray *tempArray = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", nil];
        NSLog(@"%@", tempArray);
        NSArray *array = [[NSArray alloc] initWithArray:tempArray];
        NSLog(@"%@", array);  */
        
/*        //arrayWithContentsOfURL:
        NSURL *url = [NSURL URLWithString:@"http://ios.eezytutorials.com/sample-array-plist.plist"];
        NSArray *array = [NSArray arrayWithContentsOfURL:url];
        NSLog(@"%@", array);  */
/*        //arrayWithObjects:count:
        NSString *values[3];
        values[0] = @"Eezy";
        values[1] = @"Tutorials";
        values[2] = @"Website";
        NSArray *array = [NSArray arrayWithObjects:values count:2];
        NSLog(@"%@", array);  */
/*        //Initializing an Array
        NSArray *array = [[NSArray alloc] init];
        NSLog(@"%@", array);
        NSArray *array1 = [NSArray array];
        NSLog(@"%@", array1);  */
        
/*        //initWithArray:copyItems:
        NSArray *tempArray = [NSArray arrayWithObjects:@"Eezy",@"Tutorials", nil];
        NSArray *array = [[NSArray alloc] initWithArray:tempArray copyItems:YES];
        NSLog(@"%@", array);   */
        
/*        //count
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", nil];
        NSLog(@"Count: %d", (unsigned int)[array count]);  */
/*        //getObjects:range:
        NSArray *tempArray = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        id *array;
        NSRange range = NSMakeRange(1, 2);
        objects = malloc(sizeof(id)*range.length);
        [tempArray getObjects:array range:range];
        for (index = 0; index < range.length; index++) {
            NSLog(@"Array object index %d: %@", index, objects[index]); 
        }*/
        
/*        // firstObject
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSLog(@"First Object:%@",[array firstObject] );  */
/*        //lastObject
        NSArray *array = [NSArray arrayWithObjects:@"Eezt", @"Tutorials", @"Website", nil];
        NSLog(@"Last Object:%@", [array lastObject]);  */
/*        //objectAtIndex
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSLog(@"Object at index is:%@", [array objectAtIndex:1]);  */
/*        //objectAtIndexedSubscript
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSLog(@"object at indexed subscript:%@", [array objectAtIndexedSubscript:2]);
        NSLog(@"object at indexed subscript:%@", [array objectAtIndexedSubscript:4]);  */
/*        //objectAtIndexex
        NSArray *tempArray = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSArray *array = [tempArray objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, 2)]];
        NSLog(@"%@", array);   */
/*        //objectEnumerator
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSEnumerator *enumerator = [array objectEnumerator];
        id anObject;
        while (anObject = [enumerator nextObject]) {
            NSLog(@"%@", anObject); 
        }*/
/*        //reverseObjectEnumerator
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSEnumerator *enumerator = [array reverseObjectEnumerator];
        id anObject;
        while (anObject = [enumerator nextObject]) {
            NSLog(@"%@", anObject);
        
        }   */
/*        //indexOfObject
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        NSLog(@"iundex of object is:%d", [array indexOfObject:@"Website"]);    */
/*       // indexOfObject
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", @"Eezy", nil];
        NSRange range = NSMakeRange(1, 3);
        NSLog(@"Index of Eezy in range 1,3 is %d", [array indexOfObject:@"Eezy" inRange:range]);
        range = NSMakeRange(0, 3);
        NSLog(@"Index of Eezy in range 0,3 is %d", [array indexOfObject:@"Eezy" inRange:range]);   */
/*        //indexOfObjectIdenticalTo
        NSString *str = @"Eezy";
        NSArray *array = [NSArray arrayWithObjects:str,@"Tutorials", @"Website", nil];
        NSLog(@"Index of Eezy identical:%d", [array indexOfObject:str]);
        NSLog(@"Index of Eezy identical:%d", [array indexOfObject:@"Eezy"]);  */
/*        //indexOfObjectIdenticalTo
        NSString *str = @"Eezy";
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", @"Eezy", nil];
        NSRange range = NSMakeRange(1, 3);
        NSLog(@"Index of Eezy identical:%d",[array indexOfObject:str inRange:range] );
        range = NSMakeRange(0, 3);
        NSLog(@"Index of Eezy identical:%d", [array indexOfObject:str inRange:range]);  */
/*        //indexOfObjectPassingTest
        NSArray *array = [NSArray arrayWithObjects:@"Eezy", @"Tutorials", @"Website", nil];
        int index = [array indexOfObjectPassingTest:^BOOL(id element, NSUInteger idx, BOOL *stop)
                     {
                         return [(NSArray *)element containsObject:@"Eezy"];
                     }];
        NSLog(@"Index is %d", index);
        if (index >= 0 && index <[arrayWithArray count]){
            [arrayWithArray removeObjectAtIndex:index];
        }  */
        
/*        //removeLastObject
        NSMutableArray *elements = [NSMutableArray array];
        [elements addObject:@"Helium"];
        [elements addObject:@"Neon"];
        [elements addObject:@"ABC"];
        [elements addObject:@"Argon"];
        [elements removeObject:@"Neon"];
        [elements removeObjectAtIndex:2];
        [elements removeLastObject];
        NSLog(@"%@", elements);  */
        //replaceObjectAtIndex
        NSMutableArray *elements = [NSMutableArray array];
        [elements insertObject:@"Helium" atIndex:0];
        [elements insertObject:@"Neon" atIndex:1];
        [elements insertObject:@"Argon" atIndex:2];
        [elements removeObjectAtIndex:1];
        [elements removeLastObject];
        [elements replaceObjectAtIndex:0 withObject:@"Diddi"];
        NSLog(@"%@", elements);
        
        
        
        
    }
    return 0;
}
