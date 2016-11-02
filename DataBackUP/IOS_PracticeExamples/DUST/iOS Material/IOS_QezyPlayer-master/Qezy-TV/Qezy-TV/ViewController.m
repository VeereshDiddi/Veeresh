//
//  ViewController.m
//  Qezy-TV
//
//  Created by ideabytes on 2016-03-23.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ViewController.h"
#import "VideoPlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    channelNames =[[NSMutableArray alloc]initWithObjects:@"Metro TV", @"DECCAN TV", @"NH9 NEWS", @"Garuda TV", @"Channel 10", @"CM TV", @"Key NEWS", @"HIGH NEWS", nil];
    
    channelLinks = [[NSMutableArray alloc]initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch7/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch11/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch18/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch19/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch27/auto", nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [channelNames count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = channelNames[indexPath.row];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main"
                                                         bundle:nil];
    
    NSString *channel = [channelNames objectAtIndex:indexPath.row];
    NSString *link = [channelLinks objectAtIndex:indexPath.row];
    
    VideoPlayer *player = (VideoPlayer *)
    [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
    
    player.streamUrl = link;
    
    NSLog(@"Selected channel %@ %@", channel, link);
    
    //[self.navigationController pushViewController:player animated:YES];
    [self presentViewController:player animated:YES completion:nil];
}

@end
