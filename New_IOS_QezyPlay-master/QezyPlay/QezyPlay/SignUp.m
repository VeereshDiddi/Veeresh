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
{
    IBOutlet UIScrollView *scrollViewObj;
}
@end


@implementation SignUp

- (void)viewDidLoad {
    [super viewDidLoad];
    
    countriesListArray = [NSMutableArray new];
    
    // Do any additional setup after loading the view, typically from a nib.

    
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
    
    UIImage *leftbuttonImage = [UIImage imageNamed:@"qezy-logo-.png"];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage:leftbuttonImage forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 75, 75);
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = customBarleftItem;
    
    scrollViewObj.contentSize=CGSizeMake(0, self.btnRegister.frame.origin.y+self.btnRegister.frame.size.height+80);
    
    [self pickerDropDown];
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
        if ([[self.txtUserName text] isEqualToString:@""]){
            
            [self alertStatus:@"Please enter User Name" :@"Sign up Failed!" :0];
            //[self.txtEmailAddress.text rangeOfCharacterFromSet:specialCharacterSet].length == 0 &&
        }
        else if (self.txtUserName.text.length<4)
        {
            [self alertStatus:@"Username must be minimum 4-15 characters" :@"Sign up Failed!" :0];
        }
        else if ([[self.txtEmailAddress text] isEqualToString:@""]){
            
            [self alertStatus:@"Please enter email" :@"Sign up Failed!" :0];
            
        }
        else if (![self validateEmail:email]) {
            [self alertStatus:@"Please enter valid email" :@"Sign up Failed!" :0];
        }
        else if([self.countryCodeTF text].length==0){
            
            [self alertStatus:@"Please choose Country Code" :@"Sign up Failed!" :0];
        }
        else if([[self.txtPhoneNumber text] isEqualToString:@""]){
            
            [self alertStatus:@"Please enter phone number" :@"Sign up Failed!" :0];
        }
        else if([[self.txtPassword text] isEqualToString:@""]) {
            
            [self alertStatus:@"Please enter password" :@"Sign up Failed!" :0];
            
        }
        else if (self.txtPassword.text.length<8)
        {
            [self alertStatus:@"Password must be minimum 8-16 characters" :@"Sign up Failed!" :0];
        }
        /*       else if ([invalidNumber length]){
         
         [self alertStatus:@"Invalid phone number" :@"Sign up Failed!" :0];
         
         } */
        
        else if([[self.txtConfirmPassword text] isEqualToString:@""])
        {
            [self alertStatus:@"Please enter confirm password" :@"Sign up Failed!" :0];
        }
        else if (self.txtConfirmPassword.text.length<8)
        {
            [self alertStatus:@"Confirm Password must be minimum 8-16 characters" :@"Sign up Failed!" :0];
        }
        else if (![self.txtPassword.text isEqualToString:self.txtConfirmPassword.text]) {
            [self alertStatus:@"Passwords didn't match" :@"Sign up Failed!" :0];
        }
        else if(self.isChecked == NO){
            [self alertStatus:@"Please check the Terms-and-service check box" :@"Sign up Failed!" :0];
        }
        else {
            
                NSLog(@"account infor  %@ %@ %@ %@",   self.txtUserName.text, self.txtEmailAddress.text, self.txtPhoneNumber.text, self.txtPassword.text);
                
                NSString *phone = [NSString stringWithFormat:@"%@%@",self.countryCodeTF.text,[self.txtPhoneNumber text]];

                NSDictionary *post = [NSDictionary dictionaryWithObjectsAndKeys:[self.txtUserName text], @"username",phone,@"phone", [self.txtEmailAddress text], @"email",[self.txtPassword text], @"password", nil];
            
                NSURL *url=[NSURL URLWithString:registrationSC];
                
                //               NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
                NSError *error;
                NSData* postData = [NSJSONSerialization dataWithJSONObject:post options:kNilOptions error:&error];
                
                NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
                [request setURL:url];
                [request setHTTPMethod:@"POST"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
                [request setHTTPBody:postData];
                
                // print json:
                NSLog(@"JSON summary: %@", [[NSString alloc] initWithData:postData
                                                                 encoding:NSUTF8StringEncoding]);
            
                NSHTTPURLResponse *response = nil;
                NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
                NSLog(@" %ld ",(long)[response statusCode]);
            
                if ([response statusCode] == 200 && [response statusCode] != 0)
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
                        
                        [self alertStatus:@"To Activate Your Account ,Please click on activation link which is sent to your Email Id." :@"Registration Success!" :0];
                        
                        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
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
    
    [self performSegueWithIdentifier:@"goto_termsOfSErvice" sender:self];
}

- (IBAction)privacyPolicyForRegister:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
}

- (IBAction)termsOfServiceForFacebook:(id)sender {
    [self performSegueWithIdentifier:@"goto_termsOfSErvice" sender:self];
}

- (IBAction)privacyPolicyForFacebook:(id)sender {
    [self performSegueWithIdentifier:@"goto_webView" sender:self];
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
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
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


#pragma mark - TEXTFIELD DELEGATE METHODS
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}              // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString *newString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    if (textField==self.txtUserName){
        
        NSCharacterSet *myCharSet = [NSCharacterSet characterSetWithCharactersInString:@"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"];
        for (int i = 0; i < [string length]; i++)
        {
            unichar c = [string characterAtIndex:i];
            if (![myCharSet characterIsMember:c])
            {
                [self alertStatus:@"Username allows only letters and numbers" :@"Sign up Failed!" :0];
                return NO;
            }
        }
        
        if (newString.length>15) {
            [self alertStatus:@"Username must be min 4-15 characters" :@"Sign up Failed!" :0];
            return NO;
        }
    }
    
    if (textField==self.txtEmailAddress){
        if (newString.length>75) {
            return NO;
        }
    }
    
    if (textField==self.txtPassword||textField==self.txtConfirmPassword) {
        if (newString.length>16) {
            [self alertStatus:@"Password not exceed 16 digits" :@"Sign up Failed!" :0];
            return NO;
        }
    }
    
    if (textField==self.txtPhoneNumber) {
        if (newString.length>10) {
            [self alertStatus:@"Mobile number not exceed 10 digits" :@"Sign up Failed!" :0];
            return NO;
        }
        
        if ([string rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet].invertedSet].location != NSNotFound)
        {
            // BasicAlert(@"", @"This field accepts only numeric entries.");
            return NO;
        }
    }
    
    return YES;
}



// press return to hide keyboard
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    if(textField==self.txtUserName){
        [self.txtEmailAddress becomeFirstResponder];
    }else if(textField==self.txtEmailAddress){
        [self.countryCodeTF becomeFirstResponder];
    }else if(textField==self.countryCodeTF){
        [self.txtPhoneNumber becomeFirstResponder];
    }
    else if(textField==self.txtPhoneNumber){
        [self.txtPassword becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    
    return YES;
}

-(void)pickerDropDown
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"countries" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSArray *array = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    countriesListArray = [array mutableCopy];
    
    UIView *dropDownView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREENHEIGHT-260, SCREENWIDTH, 260)];
    
    UIButton *doneButtn = [UIButton buttonWithType:UIButtonTypeCustom];
    doneButtn.frame=CGRectMake(SCREENWIDTH-100, 5, 80, 35);
    [doneButtn setTitle:@"Done" forState:UIControlStateNormal];
    doneButtn.backgroundColor=[UIColor lightGrayColor];
    [doneButtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [doneButtn addTarget:self action:@selector(doneTapped:) forControlEvents:UIControlEventTouchDown];
    doneButtn.layer.cornerRadius=5.0f;
    [dropDownView addSubview:doneButtn];
    
    UIPickerView *dropDownPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 44, dropDownView.frame.size.width, 216)];
    dropDownPickerView.dataSource=self;
    dropDownPickerView.delegate=self;
    dropDownPickerView.backgroundColor=[UIColor whiteColor];
    [dropDownView addSubview:dropDownPickerView];
    
    self.countryCodeTF.inputView = dropDownView;
}

-(IBAction)doneTapped:(id)sender
{
    [self.countryCodeTF resignFirstResponder];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return  countriesListArray.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [[countriesListArray objectAtIndex:row] valueForKey:@"name"];
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    self.countryCodeTF.text = [[countriesListArray objectAtIndex:row] valueForKey:@"dial_code"];
}

@end
