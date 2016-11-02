//
//  main.c
//  FunctionsSample
//
//  Created by AsquareMobileTechnologies on 4/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#include <stdio.h>
int sum();
//global variable
int g;
int add(int a,int b);
int main(int argc, const char * argv[]) {
    // insert code here...
//    printf("Hello, World!\n");
//    
//    g=10;
//    
//    int fgdfgd=  sum();
//    //int g=30;
//    g=g-10;
//    printf("G value is::%d\n",g);
//    int val =fgdfgd+5;
//    val =val+5;
//    
//    printf("Value Is ::%d\n",val);
    g=0;
    
    int aa,b,c,d;
    printf("Enter a, b\n");
    scanf("%d",&aa);
    scanf("%d",&b);
  int a=  add(aa, b);
  int bb=  add(30, 40);
    
    
    printf("Sum of two persons is::%d--g is::%d\n",a+b,g);
    
    return 0;
}


int sum(){

    int a =10,b=20;
    
    int c =a+b;
    g=20;
    
    printf("Sum is::%d\n",c);
    return c;

}

int add(int a,int b){

    int c =a+b;
    
    printf("Func params value::%d\n",c);
    g++;
    return c;
    
}