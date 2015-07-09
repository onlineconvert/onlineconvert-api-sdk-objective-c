#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGStatus
@end
  
@interface SWGStatus : SWGObject

/* Status code identifier. 
 */
@property(nonatomic) NSString* code;
/* Description of the status code. 
 */
@property(nonatomic) NSString* info;

@end
