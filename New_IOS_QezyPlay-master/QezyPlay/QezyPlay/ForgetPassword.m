//
//  ForgetPassword.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ForgetPassword.h"
#import "ViewController.h"

@interface ForgetPassword ()

@end


@implementation ForgetPassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.txtEmailAddress setDelegate:self];
//    self.view.layer.borderColor = [[UIColor colorWithRed:33.0f/255.0f green:39.0f/255.0f blue:73.0f/255.0f alpha:1.0] CGColor];
//    self.forgetPasswordView.layer.masksToBounds = true;
    self.forgetPasswordView.layer.borderWidth = 1.0f;
    self.forgetPasswordView.layer.cornerRadius = 1.0f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)requestPassword:(id)sender {
    
    NSLog(@"ForgetPassword: requestPassword");
    NSInteger success = 0;
    @try {
        
        NSString *specialCharater = @"'@";
        NSCharacterSet *specialCharacterSet = [NSCharacterSet
                                               characterSetWithCharactersInString:specialCharater];
        
        
        if([[self.txtEmailAddress text] isEqualToString:@""]) {
            
            [self alertStatus:@"Please enter email address" :@"Request Password Failed!" :0];
            
        }
        else if([self.txtEmailAddress.text rangeOfCharacterFromSet:specialCharacterSet].length == 0) {
            
            [self alertStatus:@"Invalid email address" :@"Request Password Failed!" :0];
        }
        
        else {
            NSLog(@"email address for request password %@", self.txtEmailAddress.text);
            
            NSString *post =[[NSString alloc] initWithFormat:@"email=%@",[self.txtEmailAddress text]];
            NSLog(@"PostData: %@",post);
            
            //NSURL *url=[NSURL URLWithString:@"http://ideabytestraining.com/newqezyplay/webservices/api.php?request=forgetpassword"];
            
            NSURL *url=[NSURL URLWithString:@"http://104.196.99.177:6363/api/Customers/reset"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            
            NSError *error = nil;
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            //NSDictionary *headerInfo = [response allHeaderFields];
            //NSString* errorMsg = headerInfo[@"error"];
            
            //NSLog(@"Response code and error message: %ld, %@", (long)[response statusCode], errorMsg);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                NSDictionary *jsonData = [NSJSONSerialization
                                          JSONObjectWithData:urlData
                                          options:NSJSONReadingMutableContainers
                                          error:&error];
                
                success = [jsonData[@"status"] integerValue];
                NSLog(@"Success: %ld",(long)success);
                
                if(success == 1)
                {
                    NSLog(@"Requess password success");
                    
                    self.txtEmailAddress.text = @"";
                    
                    [self alertStatus:@"Please check your email to reset password" :@"Request Password!" :0];
                    
                    
                } else {
                    
                    NSString* errorMsg = [jsonData valueForKey:@"message"];
                    [self alertStatus:errorMsg :@"Request Password Failed!" :0];
                }
                
            } else {
                
                [self alertStatus:@"Could not connect to server" :@"Request Password Failed!" :0];
            }
            
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Request Password Failed." :@"Error!" :0];
    }
    
    
}

- (IBAction)backToLogin:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *controller = (ViewController *) [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:controller animated:YES completion:nil];
}


- (IBAction)backgroundTap:(id)sender {
    
    [self.view endEditing:YES];
}

// press return to hide keyboard
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}
@end
