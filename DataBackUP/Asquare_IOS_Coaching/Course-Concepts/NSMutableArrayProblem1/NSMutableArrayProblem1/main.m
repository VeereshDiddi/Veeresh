//
//  main.m
//  NSMutableArrayProblem1
//
//  Created by MacBook Pro on 25/05/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
    
/*        //Creating Mutable Arrays
        NSMutableArray *array = [NSMutableArray
                                 arrayWithObjects:@"Audi",@"BMW",@"abc xyz", @"def", nil];
        NSLog(@"%@", array);   */
/*        //Adding and Removing Objects
        NSMutableArray
        *brokenCars = [NSMutableArray arrayWithObjects:@"Audi A6", @"BMW Z3", @"Audi Quattro", nil];
        NSLog(@"%@", brokenCars);
        [brokenCars addObject:@"BMW F25"];
        NSLog(@"%@", brokenCars);
        [brokenCars removeLastObject];
        NSLog(@"%@", brokenCars);
        
        [brokenCars insertObject:@"BMW F25" atIndex:0];
        NSLog(@"%@", brokenCars);
        [brokenCars removeObjectAtIndex:0];
        [brokenCars removeObject:@"Audi Quattro"];
        NSLog(@"%@", brokenCars);
        [brokenCars replaceObjectAtIndex:1 withObject:@"Audi Q5"];
        NSLog(@"%@",brokenCars); */
/*        //setArray
        NSMutableArray *array = [NSMutableArray array];
        [array setArray:@[@"Eezy", @"Tutorials", @"Website"]];
        NSLog(@"%@", array);  */
        
/*        //Create NSMutableArray
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"Eezy", @"Tutorials", @"Website"]];
        NSLog(@"%@", array);   */
/*        //arrayWithCapacity:
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:1];
        [array addObject:@"Eezy"];
        [array addObject:@"Tutorials"];
        [array addObject:@"Website"];
        NSLog(@"%@", array);   */
/*        //init
        NSMutableArray *array = [[NSMutableArray alloc] init];
        NSLog(@"%@", array);   */
/*        //addObject
        NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:1];
        [array addObject:@"Eezy"];
        [array addObject:@"Tutorials"];
        [array addObject:@"Website"];
        NSLog(@"%@", array);   */
/*        //addObjectsFromArray
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObject:@"Website"];
        [array addObjectsFromArray:@[@"Eezy", @"Tutorials"]];
        NSLog(@"%@", array);  */
/*        //insertObject:atIndex
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array addObjectsFromArray:@[@"Eezy", @"Tutorials"]];
        [array insertObject:@"Website" atIndex:1];
        NSLog(@"%@", array);  */
/*        //insertObjects:atIndexes
        NSMutableArray *array = [[NSMutableArray alloc] init];
        [array insertObjects:@[@"Eezy", @"Tutorials",@"Website"] atIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, 3)]];
        NSLog(@"%@", array);  */
/*        //removeAllObjects
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"Eezy", @"Tutorials", @"Website"]];
        [array removeAllObjects];
        NSLog(@"%@", array);  */
/*        //removeLastObject
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"Eezy", @"Tutorials", @"Website"]];
        [array removeLastObject];
        NSLog(@"%@", array);  */
/*        //removeObject
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"Eezy", @"Tutorials", @"Eezy"]];
        [array removeObject:@"Eezy"];
        NSLog(@"%@", array);  */
/*        //removeObject:inRange
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:@[@"Eezy", @"Tutorials", @"Eezy",@"Website"]];
        [array removeObjectsInRange:NSMakeRange(0, 1)];
        NSLog(@"%@", array);  */
/*        //removeObjectAtIndex
        NSMutableArray *array = [[NSMutableArray alloc]initWithArray:@[@"Eezy", @"Tutorials", @"Website"]];
        [array removeObjectAtIndex:1];
        NSLog(@"%@", array);  */
/*        //removeObjectsAtIndexes:
        NSMutableArray *array = [[NSMutableArray alloc] initWithArray:@[@"Eezy",@"Tutorials", @"Website"]];
        [array removeObjectsAtIndexes:[NSIndexSet indexSetWithIndex:1]];
        NSLog(@"%@",array);  */
/*        //removeObjectIdenticalTo
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Eezy", @"Tutorials", @"Eezy", nil];
        [array removeObjectIdenticalTo:@"Eezy"];
        NSLog(@"%@", array);  */
/*        //removeObjectIdenticalTo:inRange
        NSMutableArray *array = [[NSMutableArray alloc] initWithObjects:@"Eezy", @"Tutorials", @"Eezy", @"Eezy", nil];
        [array removeObjectIdenticalTo:@"Eezy" inRange:NSMakeRange(1, 2)];
        NSLog(@"%@", array);  */
        //removeObjectsInArray
        
            }
    return 0;
}
