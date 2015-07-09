#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGInputFile
@end
  
@interface SWGInputFile : SWGObject

/* Unique identifier for the file. [optional]
 */
@property(nonatomic) NSString* _id;
/* How the file has been generated. [optional]
 */
@property(nonatomic) NSString* type;
/* The source of the file to be used that can be either, an external url. An identifier for an uploaded file to the server or an identifier for another job. 
 */
@property(nonatomic) NSString* source;
/* Filename of the file. [optional]
 */
@property(nonatomic) NSString* filename;
/* Size of the file in bytes. [optional]
 */
@property(nonatomic) NSNumber* size;
/* Date and time when the job was created. [optional]
 */
@property(nonatomic) NSDate* createdAt;
/* Date and time when the job was last modified. [optional]
 */
@property(nonatomic) NSDate* modifiedAt;

@end
