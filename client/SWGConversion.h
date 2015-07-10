#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGConversion
@end
  
@interface SWGConversion : SWGObject

/* Identifier for the job conversion. [optional]
 */
@property(nonatomic) NSString* _id;
/* Identifier for the job conversion type. 
 */
@property(nonatomic) NSString* target;
/* Category for the conveted file. [optional]
 */
@property(nonatomic) NSString* category;
/* Type of conversion to perform with the file. [optional]
 */
@property(nonatomic) NSObject* options;

@end
