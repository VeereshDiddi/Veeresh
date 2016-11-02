//
//  main.c
//  SampleCPrg
//
//  Created by AsquareMobileTechnologies on 4/27/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#include <stdio.h>
int reverse(int n);
void Hello();
int main(int argc, const char * argv[]) {
    // insert code here...
//    int a,b;
//    scanf("%d",&a);
//    scanf("%d",&b);
//    printf("The Sum of %d & %d is %d\n",a,b,a+b);
  int c=  reverse(123);
   // Hello();
    printf("Value Of C is::%d\n",c);
    return 0;
}
int reverse(int n){

    int rev=0,sum=0;
   
    while (n>0) {
        
        rev = n%10;
        sum = rev+sum;
        n=n/10;
    }
    Hello();
    printf("Rev Is::%d\n",sum);
    return sum;
    
}

void Hello(){

    printf("Welcome to Asquare\n");

}