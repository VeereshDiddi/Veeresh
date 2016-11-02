//
//  SettingsViewController.m
//  QezyPlay
//
//  Created by ideabytes on 2016-09-09.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "SettingsViewController.h"

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    settingsData = [[NSArray alloc] initWithObjects:@"About", @"MyAccount", @"Theme", @"Language", @"Subtitle", @"Alarm", @"Logout",nil];
    
    settingsImage = [[NSArray alloc] initWithObjects:@"about-hdpi.png", @"my-account-hdpi.png", @"theme-hdpi.png", @"language-hdpi.png", @"subtitleshdpi.png", @"alarm-hdpi.png", @"logout-hdpi.png",nil];
    
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
    return [settingsData count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"settingsCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = settingsData[indexPath.row];
    
    cell.imageView.image = [UIImage imageNamed:settingsImage[indexPath.row]];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
   // UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
}

@end
