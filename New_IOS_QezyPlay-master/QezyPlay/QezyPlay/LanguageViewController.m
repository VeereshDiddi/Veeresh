//
//  LanguageViewController.m
//  QezyPlay
//
//  Created by MacBook Pro on 18/10/16.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "LanguageViewController.h"

@interface LanguageViewController ()

@end

@implementation LanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //goto_languageView
    languageName = [[NSArray alloc] initWithObjects:@"Bengali", @"Telugu",  @"English",nil];
    
    languageCode = [[NSArray alloc] initWithObjects:@"bn-IN", @"te", @"en",nil];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    //remove seperator line between cells
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

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
    return [languageName count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"languageCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = languageName[indexPath.row];
    
    NSString *languageString = languageName[indexPath.row];
    //get localized string from appropriate strings file
    NSString *localizedString = NSLocalizedString(languageString, @"");
    cell.textLabel.text = localizedString;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedLanguage = [languageCode objectAtIndex:indexPath.row];
    
    [[NSUserDefaults standardUserDefaults] setObject:[NSArray arrayWithObjects:selectedLanguage, nil] forKey:@"AppleLanguages"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    
}

@end
