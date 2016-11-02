//
//  ChannelView.m
//  Qezy-TV
//
//  Created by ideabytes on 2016-05-09.
//  Copyright © 2016 ideabytes. All rights reserved.
//

#import "ChannelView.h"
#import "VideoPlayer.h"
#import "VarGlobal.h"
#import "Player.h"

@interface ChannelView ()

@end

@implementation ChannelView

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    channelNames =[[NSMutableArray alloc]initWithObjects:@"Metro TV", @"DECCAN TV", @"NH9 NEWS", @"Garuda TV", @"Channel 10", @"CM TV", @"BN TV NEWS", @"HIGH NEWS", @"VOD", nil];
    
    channelLinks = [[NSMutableArray alloc]initWithObjects:@"octoshape://streams.octoshape.net/ideabytes/live/ib-ch4/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch5/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch7/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch11/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch12/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch18/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch32/auto", @"octoshape://streams.octoshape.net/ideabytes/live/ib-ch27/auto", @"octoshape://streams.octoshape.net/ideabytes/vod/IoT-Conference/1-Mr-Sushil-Kumar-Keynote-Address.flv", nil];
    
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
    
    VideoPlayer *videoPlayer = (VideoPlayer *)
    [storyboard instantiateViewControllerWithIdentifier:@"VideoPlayer"];
    
    videoPlayer.streamUrl = link;
    
    player->isPresented = true;
    player->isPlaying = true;
    player->isFromWeb = false;

    NSLog(@"Selected channel %@ %@", channel, link);
    
    //[self.navigationController pushViewController:player animated:YES];
    [self presentViewController:videoPlayer animated:YES completion:nil];
}


- (IBAction)btnExitClick:(id)sender {
    NSLog(@"ChannelView: button exit clicked");
    UIApplication *app = [UIApplication sharedApplication];
    [app performSelector:@selector(suspend)];
    
    //wait 2 seconds while app is going background
    [NSThread sleepForTimeInterval:2.0];
    
    //exit app when app is in background
    exit(0);
}
@end
