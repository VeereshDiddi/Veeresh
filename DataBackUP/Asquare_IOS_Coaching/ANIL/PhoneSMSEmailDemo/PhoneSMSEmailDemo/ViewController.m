//
//  ViewController.m
//  PhoneSMSEmailDemo
//
//  Created by AsquareMobileTechnologies on 6/28/16.
//  Copyright © 2016 AsquareMobileTechnologies. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
  
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callBtnClicked:(id)sender {
//    NSString *urlStr = @"https://www.google.co.in/";
    NSString *phoneNo = @"9642487879";
    NSString *call = [@"tel://" stringByAppendingString:phoneNo];
//    NSString *call = [NSString stringWithFormat:@"tel://%@",phoneNo];
    NSURL *url = [NSURL URLWithString:call];
    if ([[UIApplication sharedApplication]canOpenURL:url]) {
        [[UIApplication sharedApplication]openURL:url];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Unable to open" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}

- (IBAction)smsBtnClicked:(id)sender {
    MFMessageComposeViewController *messageController = [[MFMessageComposeViewController alloc]init];
    NSArray *contatcsArr = @[@"1234567890",@"0987654321"];
    messageController.body = @"Hello World";
    messageController.recipients = contatcsArr;
    messageController.delegate = self;
    messageController.subject = @"Test";
    if ([MFMessageComposeViewController canSendText]){
        [self presentViewController:messageController animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Unable to open SMS app" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];
    }
}
- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MessageComposeResultSent:
            NSLog(@"Sent");
            break;
        case MessageComposeResultFailed:
            NSLog(@"Failed");
            break;
        default:
            break;
    }
}
- (IBAction)emailBtnClicked:(id)sender {
    
    MFMailComposeViewController *mailController = [[MFMailComposeViewController alloc]init];
    mailController.delegate = self;
    [mailController setToRecipients:@[@"info@asquareit.com",@"test@gmail.com"]];
     [mailController setCcRecipients:@[@"info@asquareit.com",@"test@gmail.com"]];
    [mailController setSubject:@"Test Mail"];
    [mailController setMessageBody:@"Hello World" isHTML:NO];
    if ([MFMailComposeViewController canSendMail]) {
        [self presentViewController:mailController animated:YES completion:nil];
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Unable to open Email app" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alert show];

    }
}
- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(nullable NSError *)error{
    if (error) {
        NSLog(@"error :%@",[error localizedDescription]);
        return;
    }
    [self dismissViewControllerAnimated:controller completion:nil];
    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Cancelled");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Saved");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Sent");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Failed");
            break;
        default:
            break;
    }
}

@end
