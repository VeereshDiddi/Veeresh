#import <Foundation/Foundation.h>
#import "OCAuthentication.h"
#import "OCEvent.h"
#import "OCEventTypes.h"
#import "OCSeekTypeInfoEvent.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <CFNetwork/CFNetwork.h>
#import <netinet/in.h>
#import <stdint.h>

@class OCOctoshapeSystem;

/**
 * Controls retrieval and playback for one particular stream.
 * <p>
 * Implementations of this interface can be retrieved from
 * <see cref="OCOctoshapeSystem::createStreamPlayer:"/>.
 * </p>
 * <p>
 * After creating the object, you should install observers for any notifications/events
 * you need to react to. At a minimum this ought to include
 * <see cref="OCSeekTypeInfoEvent"/>, <see cref="OCUrlEvent"/>, and
 * <see cref="OCProblemEvent"/>.
 * </p>
 * <p>
 * After setting up observers, you can call one of the <see cref="play"/> methods to
 * start streaming, or <see cref="initialize:"/> to retrieve information about the
 * stream without retrieving the stream itself.
 * </p>
 * <p>
 * At any point in time the <see cref="OCStreamPlayer"/> object is on one of the
 * states described by the <see cref="StreamPlayerStatus"/> enumeration.
 * </p>
 *
 * <p>This class can generate the following events:
 * <code>OCCurrentStreamInfoEvent</code>,
 * <code>OCDurationChangedEvent</code>,
 * <code>OCMultiStreamInfoEvent</code>,
 * <code>OCProblemEvent</code>,
 * <code>OCSeekTypeInfoEvent</code>,
 * <code>OCStatusUpdateEvent</code>,
 * <code>OCStreamConfigEvent</code>,
 * <code>OCTimeInfoEvent</code>,
 * <code>OCTimeInfoLiveEvent</code>,
 * <code>OCTimeInfoOnDemandEvent</code>,
 * <code>OCUMetaEvent</code>,
 * <code>OCUrlEvent</code>.
 *
 * </p>
 */
@interface OCStreamPlayer : NSObject

/**
 * The octolink this object was created with.
 */
@property (retain, nonatomic, readonly) NSString* octolink;

/**
 * If this property is true then the <code>OCStreamPlayer</code> ensures that an <code>OCTimeInfoEvent</code>
 * is sent on every key frame.
 *
 * @see OCTimeInfoEvent
 */
@property (nonatomic) BOOL timeInfoOnEveryKeyFrame;

/**
 * Enumeration defining states of <see cref="OCStreamPlayer"/> objects.
 *
 * <p> <code>uninitialized</code> -  Not initialized.
 * Either the <see cref="initialize:"/> method has never been called, or some problem occurred. </p>
 * <p> <code>initializing</code> - Currently initializing. </p>
 * <p> <code>ready</code> - Initialized, but not asked to play yet.
 * Calling one of the <see cref="play"/> methods should fairly quickly result in call
 * to the observer of <see cref="OCUrlEvent"/></p>
 * <p> <code>playInitializing</code> - Preparing to play.
 * A <see cref="play"/> method has been called,	but the request has not resulted in a
 * media player URL	(or a problem) yet. </p>
 * <p> <code>playing</code> - Currently playing.
 * The <see cref="OCStreamPlayer"/> has reported a media player URL to be played via
 * the observer of <see cref="OCUrlEvent"/>. In this state it is expected that the app
 * will be streaming data.</p>
 * <p> <code>closed</code> -  Closed and deallocated.
 * The <see cref="close"/> method have been called, which means that this object cannot
 * be used again.</p>
 *
 * @see OCStreamPlayer:status.
 */
typedef enum {uninitialized, initializing, ready, playInitializing, playing, closed} StreamPlayerStatus;

/**
 * Begin initialization of the stream player without actually playing just yet.
 * <p>
 *  Any observers you need to register should be registered before calling this method.
 * </p>
 * <p>
 * If the stream player is already initialized, or currently in the process of
 * initializing, calling this method has no effect. Otherwise the status will go to
 * <code>initializing</code> and finally to <code>ready</code>.
 * </p>
 * <p>
 * 	NB: Currently there may be some special cases where setting <code>getEarlyInfo</code>
 * 	to true has no effect, such that the information will only be ready after a request
 * 	to play has been made. This is currently the case for on-demand files that are stored
 * 	on the Octoshape servers in FLV format.
 * </p>
 * <p>
 * Calling any of the <see cref="play"/> methods will implicitly initialize the stream
 * player object (with <code>getEarlyInfo</code> set to false) if this method has not yet
 * been called.
 * </p>
 * <p>
 * Beware that the initialization cannot complete until <see cref="OCOctoshapeSystem::open"/>
 * is called. It is permitted to call this method before <see cref="OCOctoshapeSystem::open"/>,
 * but the object can only move out of the <code>initializing</code> state after
 * <see cref="OCOctoshapeSystem::open"/> is called.
 * </p>
 *
 * @param getEarlyInfo Set this to true to indicates that stream information that is
 * normally only available	after beginning to play the stream should be retrieved
 * already during the initialization phase. This entails a slight additional overhead.
 * If this is false, most information about the stream will be retrieved only right
 * before the stream player	begins to play for the first time, i.e., after calling one
 * of the play methods, but just before the URL callback is called.
 *
 */
-(void) initialize:(BOOL)getEarlyInfo;

/**
 * Start playing the stream.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data "in the ordinary way". For on-demand streams, this
 * means to play the stream from the beginning. For live streams, the stream will play
 * the most recent data the Octoshape system can provide.
 * </p>
 * <p>
 * In order to start at other positions in the stream, see
 * <see cref="playLiveTimePosition:"/> and <see cref="playLiveWithLatency:"/>
 * for live streams, or <see cref="playOnDemandTimePosition:"/>,
 * <see cref="playOnDemandMediaTimePosition:"/>, and
 * <see cref="playOnDemandPermilPosition:"/> for on-demand streams.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent as
 * soon as the initialization ends.
 * </p>
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) play;


/**
 * Start playing the stream with a given extra latency.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data from point the indicated amount of time in the past,
 * provided that sufficiently long DVR has been set up for the stream in the Octoshape
 * server complex.
 * </p>
 * <p>
 * This is the same as <see cref="playLiveTimePosition:"/>, except that the starting
 * position is specified by the amount of time delay rather than at an absolute past
 * timestamp.
 * </p>
 * <p>
 * Note that the latency parameter is IN ADDITION to the default distribution latency set
 * up for the stream in the Octoshape server complexes, so there is no exact way for the
 * user of the libary to know which <see cref="playLiveTimePosition:"/> timestamp
 * corresponds to a given amount of extra latency or vice versa.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent as
 * soon as the initialization ends.
 * </p>
 * <p>
 * Note that before to call this method it's necessary to stop the Media Player first, and then resume it again
 * once the new m3u8 playlist has been received from the backend through <see cref="OCUrlEvent"/>.
 * </p>
 *
 * @param latency  The extra latency in milliseconds.
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) playLiveWithLatency:(int64_t)latency;

/**
 * Start playing the stream at a given position.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data from a specified point in the past, provided that
 * sufficiently long DVR has been set up for the stream in the Octoshape server complex.
 * </p>
 * <p>
 * This is the same as <see cref="playLiveWithLatency:"/>, except that the starting
 * position is specified as an absolute point in time rather than so-and-so long time ago.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent as
 * soon as the initialization ends.
 * </p>
 *
 * @param startPosition The start position in milliseconds since the beginning of 1970,
 * UTC.
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) playLiveTimePosition:(int64_t)startPosition;

/**
 * Start playing at a given original timestamp.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data from a point in an on-demand stream, expressed as
 * the absolute point in time when the on-demand data were captured from a live source.
 * </p>
 * <p>
 * This only makes sense for some types of on-demand stream, and (of course) only when
 * the Octoshape servers have information about when the stream was captured. Contact
 * Octoshape for details before you use this option.
 * </p>
 * <p>
 * For other ways to specify the starting position in an on-demand stream, see
 * <see cref="playOnDemandMediaTimePosition:"/> and
 * <see cref="playOnDemandPermilPosition:"/>.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent
 * as soon as the initialization ends.
 * </p>
 *
 * @param startPosition The start position in OctoTime.
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) playOnDemandTimePosition:(int64_t)startPosition;

/**
 * Start playing at a given media time position.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data from a point in an on-demand stream expressed as a
 * certain amount of time after the beginning of the stream.
 * </p>
 * <p>
 * For other ways to specify the starting position in an on-demand stream, see
 * <see cref="playOnDemandTimePosition:"/> and
 * <see cref="playOnDemandPermilPosition:"/>.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent
 * as soon as the initialization ends.
 * </p>
 *
 * @param startPosition Time relative to start of stream in milliseconds.
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) playOnDemandMediaTimePosition:(int64_t)startPosition;

/**
 * Start playing at a given fractional position.
 * <p>
 * This method returns nothing; the playback is started asynchronously. The caller can
 * expect that either the observer for <see cref="OCUrlEvent"/> or the observer for
 * <see cref="OCProblemEvent"/> will eventually be called to indicate success or
 * failure.
 * </p>
 * <p>
 * This method starts streaming data from a point in an on-demand stream expressed as a
 * fraction of the entire duration of the stream.
 * </p>
 * <p>
 * For other ways to specify the starting position in an on-demand stream,
 * see <see cref="playOnDemandTimePosition:"/> and
 * <see cref="playOnDemandMediaTimePosition:"/>.
 * </p>
 * <p>
 * Calling this method will initialize the stream player, if that has not already been
 * done. If the stream player is currently initializing, the play request will be sent as
 * soon as the initialization ends.
 * </p>
 *
 * @param permilPosition The position as a value from 0 to 1000.
 *
 * @see OCStreamPlayer#initialize:
 */
-(void) playOnDemandPermilPosition:(int)permilPosition;

/**
 * Abort the current play session.
 * <p>
 * This method causes the <see cref="OCStreamPlayer"> to stop fetching media data from
 * the network and sending them to the media player. Streaming can be resumed later by
 * calling one of the <see cref="play"/> methods.
 * </p>
 * <p>
 * Calling this method will generate a {'userstop', 'normal'} problem event, unless
 * another play method is called immediately (or at least before the current play session
 * is finished).
 * </p>
 * <p>
 * Playback of this stream will be implicitly aborted if you call <see cref="play"/> on
 * this or a different StreamType object, so there is no need to call
 * <see cref="abortPlayback"/> explicitly simply to switch between streams or to move to
 * a different position in the current stream.
 * </p>
 * <p>
 * (This automatic abort can be suppressed by using special options in the octolinks used
 * to create the <see cref="OCStreamPlayer"/>s, but this is not covered by this
 * documentation).
 * </p>
 */
-(void) abortPlayback;

/**
 * Request an <code>OCTimeInfoEvent</code> for the currently playing stream.
 * <p>
 * If we are not currently playing, then calling this will have no effect.
 * Otherwise <code>OCTimeInfoEvent</code> will be sent one time, when the
 * information is ready.
 * </p>
 *
 * @see OCTimeInfoEvent
 */
-(void) getTimeInfo;

/**
 * Closes and discards the <see cref="OCStreamPlayer"/>.
 *
 * <p>
 * This method destroys the <see cref="OCStreamPlayer"/> and releases all resources
 * the library has allocated in connection with it, including caches of
 * data that are being kept in anticipation of a future play session.
 * </p>
 * <p>
 * After this method has been called, the effect of calling any other
 * methods on the <see cref="OCStreamPlayer"/> object is undefined and unpredictable.
 * </p>
 * <p>
 * Beware that it is possible to receive callbacks after this method
 * has been called; it does NOT block until all the library's internal
 * worker threads have been notified about the closure.
 * </p>
 */
-(void) close;

/**
 * Install obtained authentication credentials.
 *
 * <p>
 * This method should be called in response to a
 * <see cref="setAuthenticationEventListener"/> registered callback if the user code
 * manages to produce appropriate credentials for playing. The
 * Octoshape library will check that the provided credentials
 * are valid; if they are not, a suitable <see cref="OCProblemEvent"/>
 * will be reported.
 * </p>
 * <p>
 * The precise format of the credentials is not documented here;
 * typically the application will get them wholesale from a server run by
 * the content provider using a protocol not specified by Octoshape.
 * </p>
 *
 * @param authentication The authentication that has been obtained.
 */
-(void) setAuthentication:(OCAuthentication*)authentication;

/**
 * Returns the URL of the thumbnail closest to the provided argument live latency.
 * <p>
 * 		This method will return null if this stream is not configured to contain thumbnails,
 *	or no OCUrlEvent has been processed yet for this stream.
 * </p>
 * <p>
 * 		Note that if the provided live latency is not valid for this stream,
 * 		this method will still return an URL, but that URL will then not reference an actual thumbnail.
 * </p>
 * <p>
 * 		This method works by approximating the OctoTime from the given latency, so it may less
 * 		precise than the {@link #getThumbnailUrlForTimePosition:} method.
 * </p>
 * @param extraLatency The live latency of the thumbnail to get.
 * @return The URL of a thumbnail, or null.
 */
-(NSString*) getThumbnailUrlForLatency:(int)extraLatency;

/**
 * Returns the URL of the thumbnail closest to the provided argument octoTime.
 * <p>
 * 		This method will return null if this stream is not configured to contain thumbnails,
 * 		or no OCUrlEvent has been processed yet for this stream.
 * </p>
 * <p>
 * 		Note that if the provided octotime is not valid for this stream,
 * 		this method will still return an URL, but that URL will then not reference an actual thumbnail.
 * </p>
 * @param octoTime The time of the thumbnail to get, in octoTime.
 * @return The URL of a thumbnail, or null.
 */
-(NSString*) getThumbnailUrlForTimePosition:(int64_t)octoTime;

/**
 * Setting arbitrary low-level Octoshape link option.
 * <p>
 * 		Note that this method must be called before calling
 * 		<code>initialize()</code> or any of the <code>requestPlay..</code> methods, for instance
 * 		immediately after construction.
 * <p>
 * 		This method should not be used unless explicitly being told to do by an Octoshape developer.
 * 		If an unknown option is set, or the value of a known option is not given in correct format,
 * 		the session may close and playing may not be possible.
 * </p>
 * @param option
 * @param value
 */
-(void) setOctoLinkOption:(NSString*)option withValue:(NSString*)value;

/**
 * Setting arbitrary low-level open attribute .
 * <p>
 * 		Note that this method must be called before calling
 * 		<code>initialize()</code> or any of the <code>requestPlay..</code> methods, for instance
 * 		immediately after construction.
 * <p>
 * 		This method should not be used unless explicitly being told to do by an Octoshape developer.
 * 		If an unknown attribute is set, or the value of a known attribute is not given in correct format,
 * 		the session may close and playing may not be possible.
 * </p>
 * @param attribute
 * @param value
 */
-(void) setOpenAttribute:(NSString*)attribute withValue:(NSString*)value;

/**
 * If this stream is configured to require player validation, then the method and secret must be set here.
 * <p>
 * 		This method must be called before initializing or playing.
 * </p>
 * @param method
 * @param playerSecret
 */
- (void)setPlayerValidation:(NSString*) method withSecret:(NSString*)playerSecret;

/**
 * Adds a clip to be played in the next play session created.
 * <p>
 * 		If a play session closes down (i.e. the problem listener is called with a non-normal problem),
 * 		then all added clips are cleared.
 * </p>
 * @param clip
 */
- (void)addClip:(NSString*)clip;

@end