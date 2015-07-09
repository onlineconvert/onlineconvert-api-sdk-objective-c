#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGThread
@end
  
@interface SWGThread : SWGObject

/* Unique identifier of the thread. [optional]
 */
@property(nonatomic) NSString* hash;
/* Status of the thread. [optional]
 */
@property(nonatomic) NSNumber* status;
/* Extra information. [optional]
 */
@property(nonatomic) NSString* info;
/* Date and time when the job was created. [optional]
 */
@property(nonatomic) NSDate* createdAt;
/* Date and time when the job was last modified. [optional]
 */
@property(nonatomic) NSDate* modifiedAt;

@end
