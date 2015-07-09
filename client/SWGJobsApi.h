#import <Foundation/Foundation.h>
#import "SWGJob.h"
#import "SWGError.h"
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
 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param page Pagination for list of elements.
 

 return type: NSArray<SWGJob>*
 */
-(NSNumber*) jobsGetWithCompletionBlock :(NSString*) status 
     token:(NSString*) token 
     key:(NSString*) key 
     page:(NSNumber*) page 
    
    completionHandler: (void (^)(NSArray<SWGJob>* output, NSError* error))completionBlock;
    


/**

 Creates a new Job with the user key.
 

 @param key Api key for the user to filter.
 @param body Content of the job.
 

 return type: SWGJob*
 */
-(NSNumber*) jobsPostWithCompletionBlock :(NSString*) key 
     body:(SWGJob*) body 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Get information about a Job
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdGetWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Cancels a job created that haven't been started. (Allow to cancel jobs in process.)
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdDeleteWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Modifies the job identified by the id, allows to start a created job.
 

 @param body Content of the job.
 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGJob*
 */
-(NSNumber*) jobsJobIdPatchWithCompletionBlock :(SWGJob*) body 
     token:(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock;
    


/**

 Get list of threads defined for the current job.
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: NSArray<SWGThread>*
 */
-(NSNumber*) jobsJobIdThreadsGetWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(NSArray<SWGThread>* output, NSError* error))completionBlock;
    



@end
