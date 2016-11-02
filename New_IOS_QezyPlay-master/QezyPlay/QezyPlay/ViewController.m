//
//  ViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-08-16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.txtUsername setDelegate:self];
    [self.txtPassword setDelegate:self];
    
    self.txtUsername.text = @"Qezymedia5";
    self.txtPassword.text = @"Qezymedia@5";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgetPassword:(id)sender {
    
    [self performSegueWithIdentifier:@"goto_forgetpassword" sender:self];
}

- (IBAction)logIn:(id)sender {
    NSLog(@"ViewController: Enter logIn");
    
    self.spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    
    self.spinner.transform = CGAffineTransformMakeScale(2.50, 2.50);
    
    [self.spinner setCenter:self.view.center];
    [self.view addSubview:self.spinner];
    [self.spinner startAnimating];
    
    NSInteger success = 0;
    @try {
        
        if([[self.txtUsername text] isEqualToString:@""] || [[self.txtPassword text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Please enter User name or Email address and Password" :@"Login Failed!" :0];
            
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.txtUsername text],[self.txtPassword text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@"http://ideabytestraining.com/newqezyplay/webservices/api.php?request=login"];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
            //[NSURLRequest setAllowsAnyHTTPSCertificate:YES forHost:[url host]];
            
            NSError *error = nil;
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSDictionary *headerInfo = [response allHeaderFields];
            
            //NSLog(@"Response code: %ld %@", (long)[response statusCode], response);
            
            NSString* errorMsg = headerInfo[@"error"];
            
            NSLog(@"Response code and error code: %ld %@", (long)[response statusCode], errorMsg);
            
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
                    NSLog(@"Login SUCCESS, enter home page");
                   
                    [self performSegueWithIdentifier:@"login_success" sender:self];
                    
                } else {
                    
                    [self alertStatus:errorMsg: @"Login Failed" :0];
                   
                }
                
            } else {
                
                [self alertStatus:@"Can not connect to server" :@"Login Failed!" :0];
            }
            
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Login Failed." :@"Error!" :0];
    }
    
}

- (IBAction)signUp:(id)sender {
    [self performSegueWithIdentifier:@"goto_signup" sender:self];
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

- (void)alertView:(UIAlertView *)theAlert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"The %@ button was tapped.", [theAlert buttonTitleAtIndex:buttonIndex]);
    [self.spinner stopAnimating];
    [self.spinner removeFromSuperview];
}

@end
