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

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    profileName = [[NSMutableArray alloc] initWithObjects:@"Profile1", @"Profile2", @"Profile3", nil];
    
    profileImage = [[NSMutableArray alloc] initWithObjects:@"Telugu1.jpeg", @"Telugu2.jpeg", @"Telugu3.jpeg", nil];
    
    allProfileImage = [[NSMutableArray alloc] initWithObjects:@"Telugu1.jpeg", @"Telugu2.jpeg", @"Telugu3.jpeg", @"Game1.jpeg", @"Game2.png", @"Game3.jpeg", nil];
    
    profileImagesSelected = [[NSMutableArray alloc] init];
    profileLinksSelected = [[NSMutableArray alloc] init];
    
}

-(void) viewWillAppear:(BOOL)animated{
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
    
    NSLog(@"all available profile: %@ ...", profileName);
    
/*    for (NSString *key in profileName) {
        if ([key isEqualToString:profileSelected]) {
           // profileImagesSelected = [profileDictImages valueForKey:key];
           // profileLinksSelected = [profileDictLinks valueForKey:key];
            
            
        }
    }*/
    
    [self performSegueWithIdentifier:@"goto_profileDetail" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier]isEqualToString:@"goto_profileDetail"]) {
        
        ProfileDetailController *profileObj = [segue destinationViewController];
        //profileObj.allImages =packageImagesSelected;
       // profileObj.allLinks = packageLinksSelected;
        profileObj.currentProfileName = profileSelected;
        
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
    
    if([profileName indexOfObject:profileNameTextField.text] != NSNotFound)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot add" message:@"Profile name already exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    
    [profileName  addObject:profileNameTextField.text];
    
    //int index = (profileName.count -1) % allProfileImage.count;
    //randomly pick up a logo image
    int index = arc4random_uniform(allProfileImage.count);
    
    NSString* imageName = [allProfileImage objectAtIndex:index];
    [profileImage  addObject:imageName];
    
    NSLog(@"ProfileViewController add new profile %@ %@", profileNameTextField.text, imageName);
        
    [self.collectionView reloadData];
    
    
}

-(void) deleteProfileFromCollectionView{
    if([profileName indexOfObject:profileNameTextField.text] == NSNotFound)
    {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Cannot delete" message:@"Profile name not exists" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
        
        alert.tag = 3;
        [alert show];
        
        return;
    }
    
    int index = [profileName  indexOfObject:profileNameTextField.text];
    
    [profileName removeObjectAtIndex:index];
    [profileImage removeObjectAtIndex:index];
    
    NSLog(@"ProfileViewController delete profile %d", index);
    
    [self.collectionView reloadData];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString* detailString = profileNameTextField.text;
    
    if ([profileNameTextField.text length] <= 0 || buttonIndex == 0){
        return; //If cancel or 0 length string the string doesn't matter
    }
    if (buttonIndex == 1 ){
        if(alertView.tag == 1) {
            
            NSLog(@"add new profile %@", detailString);
            [self addNewProfileIntoCollectionView];
             
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

@end
