#import <Foundation/Foundation.h>
#import "SWGError.h"
#import "SWGJob.h"
#import "SWGThread.h"
#import "SWGObject.h"
#import "SWGApiClient.h"


@interface SWGJobsApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGJobsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 List of jobs active for the current user identified by the key.
 It will return the list of jobs for the given user. In order to get the jobs a key or token must be provided:\n  - If the user key is provided all jobs for the current will be return.\n  - If one token is provided it will return the job assigned to that token if any.\n  \nThe request is paginated with an amount of 50 elements per page in any case.\n

 @param status Filter the status of the job.
 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param page Pagination for list of elements.
 

 return type: NSArray<SWGJob>*
 */
-(NSNumber*) jobsGetWithCompletionBlock :(NSString*) status 
     xOcToken:(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     page:(NSNumber*) page 
    
    completionHandler: (void (^)(NSArray<SWGJob>* output, NSError* error))completionBlock;
    


/**

 Creates a new Job with the user key.
 

 @param xOcApiKey Api key for the user to filter.
 @param body Content of the job.
 

 return type: SWGJob*
 */
-(NSNumber*) jobsPostWithCompletionBlock :(NSString*) xOcApiKey 
     body:(SWGJob*) body 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Get information about a Job
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdGetWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Cancels a job created that haven't been started. (Allow to cancel jobs in process.)
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdDeleteWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Modifies the job identified by the id, allows to start a created job.
 

 @param body Content of the job.
 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdPatchWithCompletionBlock :(SWGJob*) body 
     xOcToken:(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Get list of threads defined for the current job.
 

 @param xOcToken Token for authentication for the current job
 @param xOcApiKey Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: NSArray<SWGThread>*
 */
-(NSNumber*) jobsJobIdThreadsGetWithCompletionBlock :(NSString*) xOcToken 
     xOcApiKey:(NSString*) xOcApiKey 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(NSArray<SWGThread>* output, NSError* error))completionBlock;
    



@end
