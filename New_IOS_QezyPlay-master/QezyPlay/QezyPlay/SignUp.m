//
//  SignUp.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "SignUp.h"
#import "ViewController.h"

@interface SignUp ()

@end


@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.txtEmailAddress setDelegate:self];
    [self.txtUserName setDelegate:self];
    [self.txtPhoneNumber setDelegate:self];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createAccount:(id)sender {
    NSLog(@"SignUp: create new account");
    NSInteger success = 0;
    @try {
        
        NSString *specialCharater = @"'@";
        NSCharacterSet *specialCharacterSet = [NSCharacterSet
                                               characterSetWithCharactersInString:specialCharater];
        
        NSString *invalidNumber = [[self.txtPhoneNumber text] stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        
        
        if([[self.txtEmailAddress text] isEqualToString:@""] || [[self.txtUserName text] isEqualToString:@""] || [[self.txtPhoneNumber text] isEqualToString:@""]) {
            
            [self alertStatus:@"Please enter all required field" :@"Sign up Failed!" :0];
            
        }
        else if([self.txtEmailAddress.text rangeOfCharacterFromSet:specialCharacterSet].length == 0) {
            
            [self alertStatus:@"Invalid email address" :@"Sign up Failed!" :0];
        }
        else if ([invalidNumber length]){
            [self alertStatus:@"Invalid phone number" :@"Sign up Failed!" :0];
        }
        else {
            NSLog(@"account infor %@ %@ %@", self.txtEmailAddress.text, self.txtUserName.text, self.txtPhoneNumber.text);
            
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&phone=%@&email=%@",[self.txtUserName text],[self.txtPhoneNumber text], [self.txtEmailAddress text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://ideabytestraining.com/newqezyplay/webservices/api.php?request=register"];
            
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
            
            NSDictionary *headerInfo = [response allHeaderFields];
            NSString* errorMsg = headerInfo[@"error"];
            
            NSLog(@"Response code and error message: %ld, %@", (long)[response statusCode], errorMsg);
            
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
                    NSLog(@"Sign up success, go to login page");
                    
                    [self alertStatus:@"Please check email to validate it" :@"New Account Created!" :0];
                    
                    
                    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                         bundle:nil];
                    ViewController *controller = (ViewController *)
                    [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
                    [self presentViewController:controller animated:YES completion:nil];
                    
                } else {
                    
                    [self alertStatus:errorMsg :@"Sign up Failed!" :0];
                }
                
            } else {
                
                [self alertStatus:@"Connection Failed" :@"Sign up Failed!" :0];
            }
            
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
    
}

- (IBAction)backLogin:(id)sender {
    [self performSegueWithIdentifier:@"back_login" sender:self];
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
