//
//  SettingsViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-09-09.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "SettingsViewController.h"
#import "AboutViewController.h"
#import "LanguageViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    settingsData = [[NSArray alloc] initWithObjects:@"About", @"MyAccount", @"Theme", @"Language", @"Subtitle", @"Alarm", @"Logout",nil];
    
    settingsImage = [[NSArray alloc] initWithObjects:@"About.png", @"MyAccount.png", @"Theme.png", @"Language.png", @"Subtitles.png", @"Alarm.png", @"Logout.png",nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //remove seperator line between cells
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
//    self.settingsView.layer.borderColor = [UIColor blackColor].CGColor;
//    self.settingsView.layer.masksToBounds = true;
    self.settingsView.layer.borderWidth = 1.0f;
    self.settingsView.layer.cornerRadius = 1.0f;

    UIImage *leftbuttonImage = [UIImage imageNamed:@"qezy-logo-.png"];
    UIButton *leftbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftbutton setImage:leftbuttonImage forState:UIControlStateNormal];
    leftbutton.frame = CGRectMake(0, 0, 65, 65);
    UIBarButtonItem *customBarleftItem = [[UIBarButtonItem alloc] initWithCustomView:leftbutton];
    self.navigationItem.leftBarButtonItem = customBarleftItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [settingsData count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"settingsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = settingsData[indexPath.row];
    
    NSString *settingsString = settingsData[indexPath.row];
    //get localized string from appropriate strings file
    NSString *localizedString = NSLocalizedString(settingsString, @"");
    cell.textLabel.text = localizedString;
    cell.imageView.image = [UIImage imageNamed:settingsImage[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *about = [settingsData objectAtIndex:indexPath.row];
    if ([about isEqualToString:@"About"]) {
        [self performSegueWithIdentifier:@"goto_aboutMenu" sender:self];
    }
    NSString *name = [settingsData objectAtIndex:indexPath.row];
    if ([name isEqualToString:@"Language"]) {
        [self performSegueWithIdentifier:@"goto_languageView" sender:self];
    }

    
    NSString *logout = [settingsData objectAtIndex:indexPath.row];
    if ([logout isEqualToString:@"Logout"]) {
        [self dismissViewControllerAnimated:YES completion:nil];        
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier]isEqualToString:@"goto_aboutMenu"]) {
        AboutViewController *aboutObj = [segue destinationViewController];
    }
    if ([[segue identifier]isEqualToString:@"goto_languageView"]) {
        LanguageViewController *languageObj = [segue destinationViewController];
    }
}


@end
