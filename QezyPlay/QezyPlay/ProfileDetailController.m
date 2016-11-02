//
//  ProfileDetailController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-09-13.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ProfileDetailController.h"
#import "VideoPlayer.h"
#import "VarGlobal.h"
#import "ProfileData.h"
#import "UserData.h"


@implementation ProfileDetailController

-(void)viewDidLoad{
    NSLog(@"ProfileDetailController: viewDidLoad %@ %ld", self.currentProfileName, (long) self.profileIndex);
    self.navigationItem.title = self.currentProfileName;
    
    isProfileOpen = NO;
   // self.allImages = [[NSMutableArray alloc] initWithObjects:@"AppleTV.jpg", @"BBC.jpg", @"Discovery.jpg", nil];
    
  //  self.allLinks = [[NSMutableArray alloc] initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil];
    
  //  self.allChannelDescriptions = [[NSMutableArray alloc] initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil];
    
    self.allImages = [[NSMutableArray alloc] init];
    self.allLinks = [[NSMutableArray alloc] init];
    self.allChannelDescriptions = [[NSMutableArray alloc] init];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //remove seperator line between cells
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear: Profile isLock %@ password %@", [profileIsLock objectAtIndex:self.profileIndex], [profilePasswords objectAtIndex:self.profileIndex]);
    
    if ([[profileIsLock objectAtIndex:self.profileIndex] boolValue]) {
        NSLog(@"profile is locked");
        
        self.image.image=[UIImage imageNamed:@"pwdImage.jpeg"];
        [self.view addSubview:self.image];
        
    }
    else {
        
        isProfileOpen = YES;
    }
    
    
    if (channelList == nil)
        channelList = [[NSMutableArray alloc] init];
    
    channelList = [deviceDB getProfileChannelList: self.currentProfileName];
    NSInteger numObj = channelList.count;
    //NSLog(@"query result for profile details: %@ %d", channelList, numObj);
    
    self.allImages = [[NSMutableArray alloc] init];
    self.allLinks = [[NSMutableArray alloc] init];
    self.allChannelDescriptions = [[NSMutableArray alloc] init];
    if(numObj >0){
        for (int index = 0; index < numObj; index++){
        
            NSString * imageName = [[channelList objectAtIndex:index] valueForKey:@"imageName"];
            NSString *link = [[channelList objectAtIndex:index] valueForKey:@"link"];
            NSString *description = [[channelList objectAtIndex:index] valueForKey:@"channelDescription"];
        
            [self.allImages addObject:imageName];
            [self.allLinks addObject:link];
            [self.allChannelDescriptions addObject:description];
        
        }
    }
    
    NSLog(@"ProfileDetailController -- Profile %@ channel list from database: %@", self.currentProfileName, self.allImages);
    
    [self.tableView reloadData];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.allImages count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"profileDetailCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = self.allChannelDescriptions[indexPath.row];
    cell.textLabel.numberOfLines=0;
    cell.textLabel.lineBreakMode=NSLineBreakByWordWrapping;
    
    //cell.imageView.image = [UIImage imageNamed:self.allImages[indexPath.row]];
    UIImage *thumbnail = [UIImage imageNamed:self.allImages[indexPath.row]];
    CGSize itemSize = CGSizeMake(50, 50);
    UIGraphicsBeginImageContext(itemSize);
    CGRect imageRect = CGRectMake(0.0, 0.0, itemSize.width, itemSize.height);
    [thumbnail drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
     if(isProfileOpen) {
         UIAlertController *options = [UIAlertController alertControllerWithTitle:@"Options"
                                                                     message:nil
                                                              preferredStyle:UIAlertControllerStyleAlert];
    
         [options addAction:[UIAlertAction actionWithTitle:@"Play"
                                                style:UIAlertActionStyleDefault
                                              handler:^(UIAlertAction *action) {
                                                  [self playStream:indexPath];
                                              }]];
    
         [options addAction:[UIAlertAction actionWithTitle:@"Delete"
                                                style:UIAlertActionStyleDestructive
                                              handler:^(UIAlertAction *action) {
                                                  [self deleteItem:indexPath];
                                              }]];
    
         [options addAction:[UIAlertAction actionWithTitle:@"Cancel"
                                                style:UIAlertActionStyleCancel
                                              handler:^(UIAlertAction *action) {
                                              }]];
    
         [self presentViewController:options animated:YES completion:nil];
     }
}

-(void) playStream:(NSIndexPath *)indexPath{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    NSString *link = [self.allLinks objectAtIndex:indexPath.row];
    
    NSLog(@"selected channel %@", link);
    
    VideoPlayer *videoPlayer = (VideoPlayer *)
    [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
    
    videoPlayer.streamUrl = link;
    
    player->isPresented = true;
    player->isPlaying = true;
    
    player->appTimeOut = DEFAULT_TIMEOUT;
    
    //[self.navigationController pushViewController:player animated:YES];
    [self presentViewController:videoPlayer animated:YES completion:nil];
}

-(void) deleteItem:(NSIndexPath *)indexPath{
    NSString *name = self.allImages[indexPath.row];
    
    [self.allImages removeObjectAtIndex:indexPath.row];
    [self.allLinks removeObjectAtIndex:indexPath.row];
    [self.allChannelDescriptions removeObjectAtIndex:indexPath.row];
    
    [deviceDB deleteRecordFromTable:self.currentProfileName : @"imageName" : name];
    NSLog(@"ProfileDetailController: delete channel %@", name);
    
    [self.tableView reloadData];
    
    
}

- (IBAction)renameProfile:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Rename Profile" message:@"Please enter new profile name\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    if(newProfileNameTextField == nil)
        newProfileNameTextField = [[UITextField alloc] init];
    
    newProfileNameTextField = [alert textFieldAtIndex:0];
    newProfileNameTextField.keyboardType = UIAlertViewStylePlainTextInput;
    newProfileNameTextField.placeholder = @"Enter profile name";
    
    alert.tag = 1;
    [alert show];
    
}

-(void) changeProfileName{
    
    NSString * newProfileNameCap = [newProfileNameTextField.text uppercaseString];
                                 
    if([profileName indexOfObject:newProfileNameCap] != NSNotFound)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot change profile name" message:@"Profile name already exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    NSString *specialCharacterString = @"!~`@#$%^&*-+();:={}[],.<>?\\/\"\'";
    NSCharacterSet *specialCharacterStringSet = [NSCharacterSet
                                                 characterSetWithCharactersInString:specialCharacterString];
    
    unichar firstLetter = [newProfileNameCap characterAtIndex:0];
    
    NSLog(@"first letter of profile name %hu", firstLetter);
    
    if( [newProfileNameCap rangeOfCharacterFromSet:specialCharacterStringSet].length !=0  ||
       (firstLetter >= '0' && firstLetter <= '9') ) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Invalid profile name" message:@"Profile name can't start with a number and contain any special character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }

    int index = (int) [profileName indexOfObject:self.currentProfileName];
    
    [profileName replaceObjectAtIndex:index withObject:newProfileNameCap];
    
    [deviceDB updateRecord: @"Profile" :  self.currentProfileName : newProfileNameCap];
    [deviceDB renameTable:self.currentProfileName :newProfileNameCap];
    self.currentProfileName = newProfileNameCap;
    self.navigationItem.title = self.currentProfileName;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* detailString = newProfileNameTextField.text;
    
    if ([newProfileNameTextField.text length] <= 0 || buttonIndex == 0){
        return; //If cancel or 0 length string the string doesn't matter
    }
    if (buttonIndex == 1 ){
        if(alertView.tag == 1) {
            
            newProfileNameTextField = [alertView textFieldAtIndex:0];
            if([[newProfileNameTextField text] isEqualToString:@""] ) {
                
                [self alertStatus:@"Please enter Profile Password" :@"Profile Lock Failed!" :0];
            }
            else
            {
                NSLog(@"rename profile %@", detailString);
                [self changeProfileName];
            }
        }
        
        else {
            NSLog(@"do nothing");
        }
    }
}


- (IBAction)lockProfile:(id)sender {
    
    if ([[profileIsLock objectAtIndex:self.profileIndex] boolValue]) {
        
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Unlock Profile" message:@" Please enter Password \n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", @"Change Password", @"Unlock",nil];
        alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
        
        alert.tag = 20;
        [alert show];
    }
    else
    {
        if (self.allImages.count) {
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Lock Profile" message:@"Please enter  password to lock profile\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
            alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
        
            alert.tag = 10;
            [alert show];
        }
        else {
            
            UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Can't lock Profile" message:@"Profile is empty\n\n" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }
    }
    
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"alerview buttonIndex %ld", (long) buttonIndex);
    
    if (alertView.tag == 10) {
        if (buttonIndex == 1)
        {
            newProfileLockTextField = [alertView textFieldAtIndex:0];
            if([[newProfileLockTextField text] isEqualToString:@""] ) {
                
                [self alertStatus:@"Please enter Profile Password" :@"Profile Lock Failed!" :0];
            }
            else
            {
                
            NSString *pass = newProfileLockTextField.text;
            [profilePasswords replaceObjectAtIndex:self.profileIndex withObject:pass];
            [profileIsLock replaceObjectAtIndex:self.profileIndex withObject:[NSNumber numberWithBool:YES]];
            
            [deviceDB updateRecordInTable:@"Profile" :self.currentProfileName :@"password": pass];
            [deviceDB updateRecordInTable:@"Profile" :self.currentProfileName :@"isLocked": @"YES"];
            
            self.image.hidden = NO;
            self.image.image=[UIImage imageNamed:@"pwdImage.jpeg"];
            isProfileOpen = NO;
            [self.view addSubview:self.image];
            }
        }
    }
    if (alertView.tag == 20)
    {
        newProfileUnLockTextField = [alertView textFieldAtIndex:0];
        if (buttonIndex ==1){
            
            if (isProfileOpen){
               
                UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Open Profile" message:@"Profile already opened\n\n" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                
                [alert show];
            
            } else {
                
                if ([[profilePasswords objectAtIndex:self.profileIndex] isEqualToString:newProfileUnLockTextField.text]){
                
                    NSLog(@"open profile");
                    isProfileOpen = YES;
                    self.image.hidden = YES;
                
                } else {
                    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"In-correct profile password" message:@"Please re-enter password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", @"Change Password", @"Unlock", nil];
                    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                    alert.tag = 20;
                    [alert show];
                }
            }
        }
        
        if (buttonIndex ==2 || buttonIndex ==3){
            //newProfileUnLockTextField = [alertView textFieldAtIndex:0];
            
            if ([[profilePasswords objectAtIndex:self.profileIndex] isEqualToString:newProfileUnLockTextField.text]) {
                if (buttonIndex == 2){
                    
                    NSLog(@"change password");
                    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Change Password" message:@"Please enter new password\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
                    alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                    
                    alert.tag = 5;
                    [alert show];
                    
                }else if (buttonIndex == 3){
                    
                    NSLog(@"unlock profile");
                    self.image.hidden = YES;
                    [profilePasswords replaceObjectAtIndex:self.profileIndex withObject:@"0"];
                    [profileIsLock replaceObjectAtIndex:self.profileIndex withObject:[NSNumber numberWithBool:NO]];
                    
                    [deviceDB updateRecordInTable:@"Profile" :self.currentProfileName :@"password": @"0"];
                    [deviceDB updateRecordInTable:@"Profile" :self.currentProfileName :@"isLocked": @"NO"];
                    
                    
                    /*UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Unlock Profile" message:@"Profile unlocked\n\n" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
                   
                    [alert show];*/
                    
                    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Unlock  Profile" message:@"Profile is unlocked." preferredStyle:UIAlertControllerStyleAlert];
                    
                    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                    [alertController addAction:ok];
                    
                    [self presentViewController:alertController animated:NO completion:nil];
                    
                }
                
            } else {
                UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"In-correct profile password" message:@"Please re-enter password" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Open", @"Change Password", @"Unlock", nil];
                alert.alertViewStyle = UIAlertViewStyleSecureTextInput;
                
                alert.tag = 20;
                [alert show];
                
            }
            
        }
    
    }
        
    if (alertView.tag == 5)
    {
        if (buttonIndex == 1)
        {
            newProfileUnLockTextField = [alertView textFieldAtIndex:0];
            NSString *newPassword = newProfileUnLockTextField.text;
            [profilePasswords replaceObjectAtIndex:self.profileIndex withObject:newPassword];
            
            [deviceDB updateRecordInTable:@"Profile" :self.currentProfileName :@"password": newPassword];
            
           
            NSLog(@"Changed Password::%@", newPassword);
            
           /* UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Change Password" message:@"Profile password changed\n\n" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            
            [alert show];*/
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Change Password" message:@"Profile password changed." preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:ok];
            
            [self presentViewController:alertController animated:NO completion:nil];
        }
    }
    
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


- (IBAction)addChannel:(id)sender {
    
    self.tabBarController.selectedIndex = 0;
}
@end
