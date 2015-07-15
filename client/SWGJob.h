#import <Foundation/Foundation.h>
#import "SWGObject.h"
#import "SWGInputFile.h"
#import "SWGConversion.h"
#import "SWGStatus.h"


@protocol SWGJob
@end
  
@interface SWGJob : SWGObject

/* Unique identifier for the job. [optional]
 */
@property(nonatomic) NSString* _id;
/* Token to identify client allowed to run the job. [optional]
 */
@property(nonatomic) NSString* token;
/* Type of the job created. 
 */
@property(nonatomic) NSString* type;
/* Current status for the job [optional]
 */
@property(nonatomic) SWGStatus* status;
/* Determine if the job must be processed as soon as it is ready. [optional]
 */
@property(nonatomic) BOOL process;
/* Type of conversion or conversions to be carried out. [optional]
 */
@property(nonatomic) NSArray<SWGConversion>* conversion;
/* Source or sources of the files to be converted. [optional]
 */
@property(nonatomic) NSArray<SWGInputFile>* input;
/* Callback url to the the status updates [optional]
 */
@property(nonatomic) NSString* callback;
/* Server assigned for file uploads and downloads [optional]
 */
@property(nonatomic) NSString* server;
/* Date and time when the job was created. [optional]
 */
@property(nonatomic) NSDate* createdAt;
/* Date and time when the job was last modified. [optional]
 */
@property(nonatomic) NSDate* modifiedAt;

@end
