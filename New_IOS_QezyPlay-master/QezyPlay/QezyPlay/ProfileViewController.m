//
//  ProfileViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-09-05.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ProfileViewController.h"
#import "ProfileCell.h"
#import "ProfileDetailController.h"
#import "ProfileData.h"
#import "UserData.h"


@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //profileIsLock = [[NSMutableArray alloc] initWithObjects:[NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], [NSNumber numberWithBool:NO], nil];
    
    //profilePasswords = [[NSMutableArray alloc] initWithObjects:@"0", @"0", @"0", @"0", @"0", nil];
    
//    self.profileView.layer.borderColor = [UIColor blackColor].CGColor;
//    self.profileView.layer.masksToBounds = true;
//    self.profileView.layer.borderWidth = 10.0f;
    
    allProfileImage = [[NSMutableArray alloc] initWithObjects:@"profile-kid1.png", @"profile-kid2.png", @"profile-men1.png", @"profile-men2.png", @"profile-women2.png", nil];
    
    profileImagesSelected = [[NSMutableArray alloc] init];
    profileLinksSelected = [[NSMutableArray alloc] init];
    
    UIImage *leftbuttonImage = [UIImage imageNamed:@"qezy-logo-.png"];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage:leftbuttonImage forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 65, 65);
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = customBarleftItem;
}

-(void) viewWillAppear:(BOOL)animated{
    //NSLog(@"ProfileViewController: current profile list %@", profileName);
    [self.collectionView reloadData];
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [profileName count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"profileCell";
    
    ProfileCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    NSString *imageName = [profileImage objectAtIndex:indexPath.row];
    cell.imgCell.image = [UIImage imageNamed:imageName];
    
    cell.lblCell.text = [profileName objectAtIndex:indexPath.row];
    
    NSLog(@"profile name in cell %@", cell.lblCell.text);
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    profileSelected = [profileName objectAtIndex:[indexPath row]];
    
    profileSelectedIndex = [indexPath row];
    
    NSLog(@"all available profile: %@ ...", profileName);
       
    [self performSegueWithIdentifier:@"goto_profileDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier]isEqualToString:@"goto_profileDetail"]) {
        
        ProfileDetailController *profileObj = [segue destinationViewController];
        profileObj.currentProfileName = profileSelected;
        profileObj.profileIndex = profileSelectedIndex;
        
    }
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return CGSizeMake(150.0, 200.0);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(5,5,5,5);
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)addNewProfile:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Add new Profile" message:@"Please enter profile name\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    if(profileNameTextField == nil)
        profileNameTextField = [[UITextField alloc] init];
    
    profileNameTextField = [alert textFieldAtIndex:0];
    profileNameTextField.keyboardType = UIAlertViewStylePlainTextInput;
    profileNameTextField.placeholder = @"Enter profile name";
    
    alert.tag = 1;
    [alert show];
    
}

- (IBAction)deleteProfile:(id)sender {
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Delete a Profile" message:@"Please enter the profile name you want to delete\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    if(profileNameTextField == nil)
        profileNameTextField = [[UITextField alloc] init];
    
    profileNameTextField = [alert textFieldAtIndex:0];
    profileNameTextField.keyboardType = UIAlertViewStylePlainTextInput;
    profileNameTextField.placeholder = @"Enter profile name";
    
    alert.tag = 2;
    [alert show];
}


-(void) addNewProfileIntoCollectionView{
    NSLog(@"ProfileViewController: profile list: %@", profileName);
    
    NSString * profileNameCap = [profileNameTextField.text uppercaseString];
    
    if([profileName indexOfObject:profileNameCap] != NSNotFound && profileName.count)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot add" message:@"Profile name already exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    NSString *specialCharacterString = @"!~`@#$%^&*-+();:={}[],.<>?\\/\"\'";
    NSCharacterSet *specialCharacterStringSet = [NSCharacterSet
                                                 characterSetWithCharactersInString:specialCharacterString];
    
    unichar firstLetter = [profileNameCap characterAtIndex:0];
    
    //NSLog(@"first letter of profile name %hu", firstLetter);
    
    if( [profileNameCap rangeOfCharacterFromSet:specialCharacterStringSet].length !=0  ||
       (firstLetter >= '0' && firstLetter <= '9') ) {
        
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Invalid profile name" message:@"Profile name can't start with a number and contain any special character" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    [profileName  addObject:profileNameCap];
    
    //int index = (profileName.count -1) % allProfileImage.count;
    //randomly pick up a logo image
    int index = arc4random_uniform(allProfileImage.count);
    
    NSString* imageName = [allProfileImage objectAtIndex:index];
    [profileImage  addObject:imageName];
    
    [profileIsLock addObject:@"NO"];
    [profilePasswords addObject:@"0"];
    
    NSMutableArray * profileInfo = [[NSMutableArray alloc] init];
    
    [profileInfo addObject:profileNameCap];
    [profileInfo addObject:imageName];
    
     //user default value for isLocked and password
    
    if(![deviceDB isTableExist:@"Profile"]){
        NSLog(@"Profile table not exit, create a one");
        [deviceDB createTable:@"Profile" :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, profileName TEXT, imagePath TEXT, isLocked TEXT DEFAULT 'NO', password TEXT DEFAULT '0')"];
    }
    
    [deviceDB insertRecordIntoProfile:profileInfo];
    
    [deviceDB createTable:profileNameCap :@"CREATE TABLE IF NOT EXISTS %@ (id INTEGER PRIMARY KEY AUTOINCREMENT, imageName TEXT, link TEXT, channelDescription TEXT)"];
    NSLog(@"ProfileViewController add new profile %@ %@", profileNameCap, imageName);
        
    [self.collectionView reloadData];
    
    
}

-(void) deleteProfileFromCollectionView{
    
    NSString * profileNameCap = [profileNameTextField.text uppercaseString];
    
    if([profileName indexOfObject:profileNameCap] == NSNotFound)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot delete" message:@"Profile name not exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    int index = [profileName  indexOfObject:profileNameCap];
    
    [profileName removeObjectAtIndex:index];
    [profileImage removeObjectAtIndex:index];
    [profileIsLock removeObjectAtIndex:index];
    [profilePasswords removeObjectAtIndex:index];
    
    //[deviceDB deleteRecordFromProfile:profileNameTextField.text];
    [deviceDB deleteRecordFromTable: @"Profile" : @"profileName" : profileNameCap];
    [deviceDB deleteTable:profileNameTextField.text];
    NSLog(@"ProfileViewController delete profile %d", index);
    
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Delete Profile" message:@"Profile is successfully deleted" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    alert.tag = 3;
    [alert show];
    
    [self.collectionView reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* detailString = profileNameTextField.text;
    
    if ([profileNameTextField.text length] <= 0 || buttonIndex == 0){
        return; //If cancel or 0 length string the string doesn't matter
    }
    if (buttonIndex == 1 ){
        if(alertView.tag == 1) {
            if ([detailString isEqualToString:@""]) {
                [self alertStatus:@"Please enter Profile Name" :@"Profile Name Failed!" :0];
                NSLog(@"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
            }
            else
            {
                NSLog(@"add new profile %@", detailString);
            [self addNewProfileIntoCollectionView];
            }
        }
        else if (alertView.tag ==2){
            
            NSLog(@"delete profile %@", detailString);
            [self deleteProfileFromCollectionView];
        }
        else {
            NSLog(@"do nothing");
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


@end
