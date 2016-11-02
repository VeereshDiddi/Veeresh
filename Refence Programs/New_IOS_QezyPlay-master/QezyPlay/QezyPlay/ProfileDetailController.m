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


@implementation ProfileDetailController

-(void)viewDidLoad{
    self.navigationItem.title = self.currentProfileName;
    
    
    self.allImages = [[NSMutableArray alloc] initWithObjects:@"AppleTV.jpg", @"BBC.jpg", @"Discovery.jpg", nil];
    
    self.allLinks = [[NSMutableArray alloc] initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil];
    
    self.allChannelDescriptions = [[NSMutableArray alloc] initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //remove seperator line between cells
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
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
    
    [self.allImages removeObjectAtIndex:indexPath.row];
    [self.allLinks removeObjectAtIndex:indexPath.row];
    [self.allChannelDescriptions removeObjectAtIndex:indexPath.row];
        
        
        
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
    if([profileName indexOfObject:newProfileNameTextField.text] != NSNotFound)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot change profile name" message:@"Profile name already exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    int index = [profileName indexOfObject:self.currentProfileName];
    
    [profileName replaceObjectAtIndex:index withObject:newProfileNameTextField.text];
    
    self.navigationItem.title = newProfileNameTextField.text;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* detailString = newProfileNameTextField.text;
    
    if ([newProfileNameTextField.text length] <= 0 || buttonIndex == 0){
        return; //If cancel or 0 length string the string doesn't matter
    }
    if (buttonIndex == 1 ){
        if(alertView.tag == 1) {
            
            NSLog(@"rename profile %@", detailString);
            [self changeProfileName];
            
        }
        
        else {
            NSLog(@"do nothing");
        }
    }
}


- (IBAction)lockProfile:(id)sender {
}
@end
