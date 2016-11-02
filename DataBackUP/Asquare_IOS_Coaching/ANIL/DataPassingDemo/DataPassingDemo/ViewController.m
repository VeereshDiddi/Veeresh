//
//  ViewController.m
//  DataPassingDemo
//
//  Created by AsquareMobileTechnologies on 6/4/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"
#import "DetailsViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    self.dataArr  = [[NSMutableArray alloc]initWithCapacity:0];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonCliked:(id)sender {
    NSString *nameStr = self.nameTF.text;
    NSString *mobileNoStr =  self.mobileTF.text;
    NSString *emailStr  = self.emailTF.text;
    NSString *pwdStr  = self.pwdTF.text;
    if ([nameStr length] == 0) {
        [self showAlertMsg:@"Warning" andMsg:@"Please enter name"];
    }else if ([mobileNoStr length]== 0){
        [self showAlertMsg:@"Warning" andMsg:@"Please enter mobile"];
    }else if ([emailStr length]==0){
        [self showAlertMsg:@"Warning" andMsg:@"Please enter email"];
    }else if ([pwdStr length]== 0){
        [self showAlertMsg:@"Warning" andMsg:@"Please enter password"];
    }else{
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]initWithCapacity:0];
        [dic setObject:nameStr forKey:@"name"];
        [dic setObject:mobileNoStr forKey:@"mobile"];
        [dic setObject:emailStr forKey:@"email"];
        [dic setObject:pwdStr forKey:@"pwd"];
        if ([[[sender titleLabel]text]isEqualToString:@"Update"]) {
            [self.dataArr replaceObjectAtIndex:selectedIndex withObject:dic];
            [self.btn setTitle:@"Save" forState:UIControlStateNormal];
        }else{
            [self.dataArr addObject:dic];
        }
        [self clearAllFields];
        [self performSegueWithIdentifier:@"detailsView" sender:self];
        
    }
}
-(void)showAlertMsg:(NSString*)ttl andMsg:(NSString*)msg{
    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:ttl message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}
-(void)clearAllFields{
    self.nameTF.text =@"";
    self.mobileTF.text = @"";
    self.emailTF.text = @"";
    self.pwdTF.text =@"";
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier]isEqualToString:@"detailsView"]) {
        DetailsViewController *detailsViewObj = [segue destinationViewController];
        detailsViewObj.viewObj = self;
    }
}
- (IBAction)viewData:(id)sender {
    [self performSegueWithIdentifier:@"detailsView" sender:self];
}
-(void)updateData:(NSDictionary*)dic andSelectedIndex:(NSInteger)sIndex{
        selectedIndex = sIndex;
        self.nameTF.text = [dic objectForKey:@"name"];
        self.mobileTF.text = [dic objectForKey:@"mobile"];
        self.emailTF.text = [dic objectForKey:@"email"];
        self.pwdTF.text = [dic objectForKey:@"pwd"];
    [self.btn setTitle:@"Update" forState:UIControlStateNormal];
}
@end
