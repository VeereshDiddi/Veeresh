#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>
#import "OCEvent.h"
#import <stdint.h>
	
/**
 * The Octoshape client is ready to play and it sent this URL to be played in a media player.
 *
 * <p>This event can be triggered by <code>OCStreamPlayer</code>.</p>
 */
@interface OCUrlEvent : OCEvent
	
/**
 * The URL to play
 */
@property(readonly) NSString* url;
	
/** 
 * This property will only be set for osa-seek streams (on-demand or live DVR), 
 * (i.e. where an <code>OCSeekTypeInfoEvent</code> event has been received where
 * <code>OCSeekTypeInfoEvent:seekType</code> is <code>osaSeek</code>), and 
 * only if the play request that triggered this URL event 
 * was a request to play from a specific position in the stream, like for instance 
 * <code>OCStreamPlayer#playOnDemandMediaTimePosition</code> or 
 * <code>OCStreamPlayer#playLiveWithLatency</code>.
 *
 * <p>The value is the actual seek offset / extra latency in milliseconds or -1 if unknown</p>
 */
@property(readonly) int64_t seekOffset;
	
/** If true, the URL should not be played right away, 
 *   but only after the current media player buffer has finished playing.
 */
@property(readonly) BOOL waitForPlayerIdle;		

/**
 * On this listener a MPMoviePlayerController reference must be registered, before the url is passed to the MPMoviePlayerController.
 * <p>Note tha a strong reference must be created for the provided OCEvent.</p>
 */

-(void) registerMPMoviePlayerController:(MPMoviePlayerController*) mp;

@end
