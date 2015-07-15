#import <Foundation/Foundation.h>
#import "SWGError.h"
#import "SWGInputFile.h"
#import "SWGObject.h"
#import "SWGApiClient.h"


@interface SWGInputApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGInputApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Get list of binary source files for the conversion.hhh
 Description of the get for the inputs of a specific job.

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: NSArray<SWGInputFile>*
 */
-(NSNumber*) jobsJobIdInputGetWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(NSArray<SWGInputFile>* output, NSError* error))completionBlock;
    


/**

 Cretes a new input for the current job.
 

 @param body 
 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputPostWithCompletionBlock :(SWGInputFile*) body 
     xOcToken:(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock;
    


/**

 Get list of conversions defined for the current job.
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param fileId Id of the file to download
 

 return type: SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputFileIdGetWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
     fileId:(NSString*) fileId 
    
    completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock;
    


/**

 Removes the input for a job.
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param fileId Id of the file to download
 

 return type: SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputFileIdDeleteWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
     fileId:(NSString*) fileId 
    
    completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock;
    



@end
