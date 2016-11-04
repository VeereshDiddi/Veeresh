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
    [self.txtConfirmPassword setDelegate:self];
//    self.btnRegister.backgroundColor = [UIColor redColor];
//    self.btnRegisterFacebook.backgroundColor = [UIColor blueColor];
//    self.signUpView.layer.borderColor = [[UIColor colorWithRed:33.0f/255.0f green:39.0f/255.0f blue:73.0f/255.0f alpha:1.0] CGColor];    self.signUpView.layer.masksToBounds = true;
    
    self.signUpView.layer.borderWidth = 1.0f;
    self.signUpView.layer.cornerRadius = 1.0f;
    
    [self.btnRegister setBackgroundColor:[UIColor colorWithRed:(209/255.0) green:(63/255.0) blue:(24/255.0) alpha:1]];
    
    self.txtUserName.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.txtEmailAddress.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];

    self.txtPhoneNumber.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];

    self.txtPassword.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.txtConfirmPassword.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    
    self.btnCheckbox.layer.borderColor=[[UIColor colorWithRed:119.0f/255.0f green:144.0f/255.0f blue:159.0f/255.0f alpha:1.0] CGColor];
    self.btnRegisterFacebook.delegate = self;
    self.btnRegisterFacebook.readPermissions = @[@"public_profile", @"email"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkboxSelected:(id)sender {
    if(self.isChecked ==NO){
        self.isChecked =YES;
        [self.btnCheckbox setImage:[UIImage imageNamed:@"Checkbox1.png"]
                          forState:UIControlStateNormal];
        
    }else{
        self.isChecked =NO;
        [self.btnCheckbox setImage:[UIImage imageNamed:@"UnCheckbox.png"]
                          forState:UIControlStateNormal];
    }

}

- (IBAction)createAccount:(id)sender {
    NSLog(@"SignUp: create new account");
    NSInteger success = 0;
    
    //if ([self.txtPassword.text isEqualToString:self.txtConfirmPassword.text]) {
        
    @try {
        
        //NSString *specialCharater = @"'@";
        //NSCharacterSet *specialCharacterSet = [NSCharacterSet characterSetWithCharactersInString:specialCharater];
        
        // NSString *invalidNumber = [[self.txtPhoneNumber text] stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
        
        //NSString *specialCharacterString = @"!~`@#$%^&*-+();:={}[],.<>?\\/\"\'";
        //NSCharacterSet *specialCharacterStringSet = [NSCharacterSet   characterSetWithCharactersInString:specialCharacterString];
        
        
        // Pattern Matching
        NSString *userName = [NSString stringWithFormat:@"%@", self.txtUserName.text];
        NSString *email = [NSString stringWithFormat:@"%@", self.txtEmailAddress.text];
        NSString *phoneNumber = [NSString stringWithFormat:@"%@", self.txtPhoneNumber.text];
        NSLog(@"----------PhoneNumber:%@", phoneNumber);
        NSString *password = [NSString stringWithFormat:@"%@", self.txtPassword.text];
        NSString *confirmPassword = [NSString stringWithFormat:@"%@", self.txtConfirmPassword.text];
        //[self.txtUserName.text rangeOfCharacterFromSet:specialCharacterStringSet].length !=0 &&
        if ([[self.txtUserName text] isEqualToString:@""] &&
            ![self validateUserName:userName]){
            
            [self alertStatus:@"Please enter User Name" :@"Sign up Failed!" :0];
            //[self.txtEmailAddress.text rangeOfCharacterFromSet:specialCharacterSet].length == 0 &&
        }else if ([[self.txtEmailAddress text] isEqualToString:@""]  &&  ![self validateEmail:email]){
            
            [self alertStatus:@"Please enter email" :@"Sign up Failed!" :0];
            
        }else if([[self.txtPhoneNumber text] isEqualToString:@""] && ![self validatePhoneNumber:phoneNumber]){
            
            [self alertStatus:@"Please enter phone number" :@"Sign up Failed!" :0];
            
        }else if([[self.txtPassword text] isEqualToString:@""] && ![self validatePassword:password]) {
            
            [self alertStatus:@"Please enter password" :@"Sign up Failed!" :0];
            
        }
        /*       else if ([invalidNumber length]){
         
         [self alertStatus:@"Invalid phone number" :@"Sign up Failed!" :0];
         
         } */
        
        else if([[self.txtConfirmPassword text] isEqualToString:@""] && ![self validateConfirmPassword:confirmPassword])
        {
            [self alertStatus:@"Please enter confirm password" :@"Sign up Failed!" :0];
        }
        else {
            if ([self.txtPassword.text isEqualToString:self.txtConfirmPassword.text]) {
                if(self.isChecked ==YES){
                
                NSLog(@"account infor  %@ %@ %@ %@",   self.txtUserName.text, self.txtEmailAddress.text, self.txtPhoneNumber.text, self.txtPassword.text);
                
 //               NSString *post =[[NSString alloc] initWithFormat:@"username=%@&phone=%@&email=%@&password=%@",[self.txtUserName text],[self.txtPhoneNumber text],[self.txtEmailAddress text],[self.txtPassword text]];
                    NSString *username = [self.txtUserName text];
                    NSString *phone = [self.txtPhoneNumber text];
                    NSString *email = [self.txtEmailAddress text];
                    NSString *password = [self.txtPassword text];
                    
                    NSDictionary *post = [NSDictionary dictionaryWithObjectsAndKeys:username, @"username",phone,@"phone", email, @"email",password, @"password", nil];
                //NSLog(@"PostData: %@",post);
                
                //NSURL *url=[NSURL URLWithString:@"http://ideabytestraining.com/newqezyplay/webservices/api.php?request=register"];
                    
                
                NSURL *url=[NSURL URLWithString:@"http://104.196.99.177:6363/api/Customers"];
                
 //               NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                     NSError *error;
                     NSData* postData = [NSJSONSerialization dataWithJSONObject:post options:kNilOptions error:&error];
                   // NSLog(@"postData:%@", postData);
//               NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
  
 /*               NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
                [request setHTTPBody:postData];
         */
                    
                    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                    [request setURL:url];
                    [request setHTTPMethod:@"POST"];
                    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                    [request setHTTPBody:postData];
                    
                    // print json:
                    NSLog(@"JSON summary: %@", [[NSString alloc] initWithData:postData
                                                                     encoding:NSUTF8StringEncoding]);

 //                   NSLog(@"account infor1  %@ %@ %@ %@",   self.txtUserName.text, self.txtEmailAddress.text, self.txtPhoneNumber.text, self.txtPassword.text);
                
//                NSError *error = nil;
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
                        NSLog(@"Sign up success, go to login page");
                        
                        [self alertStatus:@"Successfully Registration completed." :@"New Account Created!" :0];
                        
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                                             bundle:nil];
                        ViewController *controller = (ViewController *)
                        [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
                        [self presentViewController:controller animated:YES completion:nil];
                        
                    } else {
                        
                        NSString* errorMsg = [jsonData valueForKey:@"message"];
                        [self alertStatus:errorMsg :@"Sign up Failed!" :0];
                    }
                    
                } else {
                    
                    [self alertStatus:@"Connection Failed" :@"Sign up Failed!" :0];
                }
            }
            else
            {
                    [self alertStatus:@"Terms of Service and Privacy Policy" :@"Please check Terms of Service and Privacy Policy!" :0];
            }
            }
            else
            {
                [self alertStatus:@"Passwords don't match. Try again?" :@"Password is Wrong!" :0];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in Failed." :@"Error!" :0];
    }
}
/*
- (IBAction)backLogin:(id)sender {
    [self performSegueWithIdentifier:@"back_login" sender:self];
}
*/

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing:YES];
}

-(BOOL)validateUserName:(NSString *)userName
{
    NSString *userRegex = @"^(((?!_)[A-Za-z0-9])+[A-Za-z0-9_]*){4,10}$";
    
    NSPredicate *userTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", userRegex];
    return [userTest evaluateWithObject:userName];
}

- (BOOL)validateEmail:(NSString*)email
{
    NSString *emailRegex = @"^[a-zA-Z0-9.!#$%&Â’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+[\\.].[a-zA-Z0-9]+(?:\\.[a-zA-Z0-9-]+)*$";
    
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}


-(BOOL)validatePhoneNumber:(NSString *)phoneNumber
{
    NSString *phoneRegex = @"^\\+(?:[0-9] ?){6,14}[0-9]$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    
    return [phoneTest evaluateWithObject:phoneNumber];
    
}
-(BOOL)validatePassword:(NSString *)password
{
//    NSString *passwordRegex = @"^(?=.*\\d)(?=.*[A-Z])(?=.*[!@#$%^&*()?])[0-9A-Za-z!@#$%^&*()?]{8,50}$";
    NSString *passwordRegex = @"^.{8,16}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    
    return [passwordTest evaluateWithObject:password];
}
-(BOOL)validateConfirmPassword:(NSString *)password
{
    //    NSString *passwordRegex = @"^(?=.*\\d)(?=.*[A-Z])(?=.*[!@#$%^&*()?])[0-9A-Za-z!@#$%^&*()?]{8,50}$";
    NSString *passwordRegex = @"^.{8,16}$";
    NSPredicate *passwordTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", passwordRegex];
    
    return [passwordTest evaluateWithObject:password];
}

- (IBAction)termsOfServiceForRegister:(id)sender {
    
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)privacyPolicyForRegister:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)termsOfServiceForFacebook:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)privacyPolicyForFacebook:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}


// press return to hide keyboard
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    if(textField==self.txtUserName){
        [self.txtEmailAddress becomeFirstResponder];
    }else if(textField==self.txtEmailAddress){
        [self.txtPhoneNumber becomeFirstResponder];
    }else if(textField==self.txtPhoneNumber){
        [self.txtPassword becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
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
- (IBAction)backToLogin:(id)sender {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *controller = (ViewController *) [storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentViewController:controller animated:YES completion:nil];

}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView{
    //    self.lblLoginStatus.text = @"You are logged in.";
    
    //    [self toggleHiddenState:NO];
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user{
    NSLog(@"%@", user);
    //    self.profilePicture.profileID = user.id;
    //    self.lblUsername.text = user.name;
    //    self.lblEmail.text = [user objectForKey:@"email"];
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView{
    //    self.lblLoginStatus.text = @"You are logged out";
    //
    //    [self toggleHiddenState:YES];
}

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error{
    NSLog(@"%@", [error localizedDescription]);
}
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}              // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}


@end
