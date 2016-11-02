//
//  main.m
//  pract
//
//  Created by Panduranga Mallipudi on 06/05/16.
//  Copyright © 2016 Edu.Self. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        NSString *str = @"Asquare";
    
        NSString *cha = [NSString stringWithFormat:@"%hu",[str characterAtIndex:0]];
        NSLog(@"%@",cha);
        //Creation of a mutable string variable named pandu, allocating memory and initializing with string
    
        NSMutableString *pandu=[[NSMutableString alloc]initWithString:@"Pandu"];
        
        //Creation of immutable string variable named Siddu, storing of actual string contained in variable pandu and the appended string to Siddu
        
        NSString *Siddu =[pandu stringByAppendingString: @" Ranga"];
        //Printing the String value presented in the Siddu Variable
        
        NSLog(@"%@", Siddu);
        str = [str stringByAppendingString:@"Mobile Technologies"];
        
        
        //Creation of Dictionary Named avinash initializing the dictionary with Object and assigning key
        
        NSDictionary *anil = [NSDictionary dictionaryWithObject:@"Panduranga" forKey:@"First Name"];
        
        //printing of dictionary
        NSLog(@"%@", anil);
        
        //NSString *Ratnaji = [anil ];
        //declaring a string variable vamsi and storing the retreived string value for the corresponding key
        NSString *Vamsi = [anil valueForKey:@"First Name"];
        //printing of string value in Vamsi
        NSLog(@"%@", Vamsi);
       // NSLog(@"%@", Ratnaji);
        
        //Creation of Dictionary named multiObj for the sake of storing multiple objects, here the dictionary constists of two arrays one for stroing keys and the other for storing the values
        
        NSDictionary *multiObj = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:@"Panduranga", @"Mallipudi", @"9014269642", nil] forKeys:[NSArray arrayWithObjects:@"First Name", @"Initial", @"Mobie No.", nil]];
        
        //printing of Dictionary
        NSLog(@"%@", multiObj);
        
        //creation of another dictionary
        
        NSDictionary *multiObj1= [NSDictionary dictionaryWithObjects:[ NSArray arrayWithObjects:@"Ratnaji", @"Parimi", @"9640808185", nil] forKeys:[NSArray arrayWithObjects:@"First Name", @"Initial", @"Mobile Number", nil]];
        
        //assinging the dictionaries to the array
        
        NSMutableArray *arr= [NSMutableArray arrayWithObjects :multiObj, multiObj1, nil];
        
        //printing the array
        
        NSLog(@"%@", arr);
        NSArray*keys=[multiObj allKeys];
        
        //accessing the data from the array indexes
        NSLog(@"accessing array data::%@", [arr objectAtIndex:0]);
        NSString *lkj= [multiObj valueForKey:@"Name"];
        NSLog(@"test ::%@", lkj);
    
        //**************************************** ***********************************************************
        
        //printing of both the keys and values side by side
        
        NSDictionary *xyz = [NSDictionary dictionaryWithObjectsAndKeys:@"panduranga", @"First Name", @"Mallipudi", @"Surname", @"pandu.autpg@gmail.com", @"email id", nil];
        NSLog(@"%@", xyz);
    }
    return 0;
}