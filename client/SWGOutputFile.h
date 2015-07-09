#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGOutputFile
@end
  
@interface SWGOutputFile : SWGObject

/* Unique identifier for the file. [optional]
 */
@property(nonatomic) NSString* _id;
/* Sources for the files including the input files and conversion used. 
 */
@property(nonatomic) NSObject* source;
/* Url for downloading the file. [optional]
 */
@property(nonatomic) NSString* uri;
/* Filename of the file. [optional]
 */
@property(nonatomic) NSString* filename;
/* Size of the file in bytes. [optional]
 */
@property(nonatomic) NSNumber* size;
/* Date and time when the job was created. [optional]
 */
@property(nonatomic) NSDate* createdAt;

@end
