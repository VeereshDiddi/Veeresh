//
//  AboutViewController.m
//  QezyPlay
//
//  Created by MacBook Pro on 18/10/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    aboutImage = [[NSArray alloc] initWithObjects:@"menu-aboutus.png", @"menu-contactus.png", @"menu-privacy.png", @"menu-terms.png", @"menu-feedback.png",nil];
    aboutData = [[NSArray alloc] initWithObjects:@"About Us", @"Contact Us", @"Privacy Policy", @"Terms of Service", @"Feedback Form",nil];
    
    
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
    return [aboutData count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"aboutCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.imageView.image = [UIImage imageNamed:aboutImage[indexPath.row]];
    cell.textLabel.text = aboutData[indexPath.row];
    
    NSString *languageString = aboutData[indexPath.row];
    //get localized string from appropriate strings file
    NSString *localizedString = NSLocalizedString(languageString, @"");
    cell.textLabel.text = localizedString;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
}

@end
