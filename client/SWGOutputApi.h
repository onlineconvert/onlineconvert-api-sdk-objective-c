#import <Foundation/Foundation.h>
#import "SWGError.h"
#import "SWGOutputFile.h"
#import "SWGObject.h"
#import "SWGApiClient.h"


@interface SWGOutputApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGOutputApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Get list of converted.
 

 @param conversionId 
 @param inputId 
 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputGetWithCompletionBlock :(NSString*) conversionId 
     inputId:(NSString*) inputId 
     xOcToken:(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock;
    


/**

 Get information about an output file source.
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param fileId Id of the file to download
 

 return type: NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputFileIdGetWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
     fileId:(NSString*) fileId 
    
    completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock;
    


/**

 Deletes a file from the output.
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param fileId Id of the file to download
 

 return type: NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputFileIdDeleteWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
     fileId:(NSString*) fileId 
    
    completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock;
    



@end
