//
//  ViewController.m
//  LoginForm
//
//  Created by MacBook Pro on 09/08/16.
//  Copyright © 2016 MacBook Pro. All rights reserved.
//

#import "ViewController.h"
#define ACCEPTABLE_CHARECTERS @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.@"
#define ACCEPTABLE_CHARECTERS1 @"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789.!@#$&"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self copyDataBase];
    
    NSString *insertQuery = @"INSERT INTO qezytv(name, password) VALUES('Veer502', '12345')";
    [self executeQuery:insertQuery];
    NSString *selectQery = @"select *from qezytv";
    arr = [[NSMutableArray alloc] initWithCapacity:0];
    arr = [self fetchData:selectQery];
    NSLog(@"Qezy-TV is:%@", arr);
    
}
-(NSMutableArray *)fetchData:(NSString *)qry
{
    NSMutableArray *dataArr = [[NSMutableArray alloc] initWithCapacity:0];
    sqlite3 *dbObj = nil;
    sqlite3_stmt *statement = nil;
    NSString *dbPath = [self getDBPath];
    if (sqlite3_open([dbPath UTF8String], &dbObj) == SQLITE_OK) {
        if (sqlite3_prepare_v2(dbObj, [qry UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                NSMutableDictionary *dic = [[NSMutableDictionary alloc] initWithCapacity:0];
                NSString *name = [NSString stringWithFormat:@"%s", sqlite3_column_text(statement,0)];
                NSString *pwd = [NSString stringWithFormat:@"%s", sqlite3_column_text(statement, 1)];
                [dic setObject:name forKey:@"user"];
                [dic setObject:pwd forKey:@"password"];
                [dataArr addObject:dic];
                //[dataArr addObject:pwd];
                
            }
        }
        else
        {
                NSLog(@"Qery Preparation %s", sqlite3_errmsg(dbObj));
        }
        
        }
    else
    {
        NSLog(@"Database Connection Error %s", sqlite3_errmsg(dbObj));
    }
    return dataArr;

}

-(void)executeQuery:(NSString *)qry
{
    sqlite3 *dbObj = nil;
    sqlite3_stmt *statement = nil;
    NSString *dbPath = [self getDBPath];
    if (sqlite3_open([dbPath UTF8String], &dbObj) == SQLITE_OK) {
        if (sqlite3_prepare_v2(dbObj, [qry UTF8String], -1, &statement, NULL) == SQLITE_OK) {
            if (sqlite3_step(statement) == SQLITE_DONE) {
                NSLog(@"Executed Successfully");
            }
            else
            {
                NSLog(@"Query Execution Error %s",sqlite3_errmsg(dbObj));
            }
        }
        else
        {
            NSLog(@"Qery Preparation %s", sqlite3_errmsg(dbObj));
        }
    }
    else
    {
        NSLog(@"DB Connection Error %s", sqlite3_errmsg(dbObj));
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginActionButton:(id)sender {
    
    if ([self.userNameTextField.text length]>0  &&  [self.passwordTextField.text length]>0) {
        NSString *userName = self.userNameTextField.text;
        NSString *password = self.passwordTextField.text;
        if ([userName isEqualToString:@"Veer502"] && [password isEqualToString:@"12345"])
        {
            NSLog(@"Valid User Name and Password");
        }
        
    }else{
        
        NSLog(@"Please Enter Valid UserName or Password");
    }
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    if (textField.tag==1) {
        textField.backgroundColor = [UIColor greenColor];
    }else if(textField.tag == 2){
        textField.backgroundColor = [UIColor greenColor];
    }
    
    return YES;
}        // return NO to disallow editing.
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
}           // became first responder
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    
    return YES;
}          // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
- (void)textFieldDidEndEditing:(UITextField *)textField{
    textField.backgroundColor = [UIColor redColor];
}             // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField.tag==1) {
        
        if (textField.text.length>9) {
            return NO;
        }
        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
        
    }else if (textField.tag == 2){
        if (textField.text.length>9) {
            return NO;
        }

        NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARECTERS1] invertedSet];
        
        NSString *filtered = [[string componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
        
        return [string isEqualToString:filtered];
    }
    
    return YES;
}   // return NO to not change text

- (BOOL)textFieldShouldClear:(UITextField *)textField{
    
    return YES;
}              // called when clear button pressed. return NO to ignore (no notifications)
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    return YES;
}

- (void)copyDataBase
{
    NSString *filePath = [self getDBPath];
    if (![[NSFileManager defaultManager]fileExistsAtPath:filePath]) {
        NSString *bundleFilePath = [[NSBundle mainBundle]pathForResource:@"qezy" ofType:@"sqlite"];
        [[NSFileManager defaultManager]copyItemAtPath:bundleFilePath toPath:filePath error:nil];
    }
}
-(NSString *)getDBPath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:@"qezy.sqlite"];
    return filePath;
}

@end
