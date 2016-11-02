#import <Foundation/Foundation.h>
#import "OCEvent.h"
#import <stdint.h>

/**
 * The Octoshape client has received a StreamSignal.
 *
 * <p>This event may be triggered by during <code>OCStreamPlayer</code>.</p>
 */
@interface OCStreamSignalEvent : OCEvent
	
/**
 * The stream signal type
 */
@property(readonly) NSString* signalType;
	
/**
 * The signal XML data
 */
@property(readonly) NSString* signalXML;

@end
	