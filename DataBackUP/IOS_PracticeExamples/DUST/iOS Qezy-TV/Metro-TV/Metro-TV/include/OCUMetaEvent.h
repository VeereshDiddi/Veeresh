#import <Foundation/Foundation.h>
#import "OCEvent.h"

/**
 * Octoshape u-meta data for the currently playing stream.
 *
 * <p>This event can be triggered by <code>OCStreamPlayer</code>.</p>	 
 */
@interface OCUMetaEvent : OCEvent		

/**
 * XML string or <code>nil</code>.
 */
@property(readonly) NSString* xmlString;

/**
 * Bytes of the u-meta data or <code>nil</code>.
 */	
@property(readonly) NSData* data;

@end