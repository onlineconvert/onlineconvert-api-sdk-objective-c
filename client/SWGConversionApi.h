#import <Foundation/Foundation.h>
#import "SWGConversion.h"
#import "SWGError.h"
#import "SWGObject.h"
#import "SWGApiClient.h"


@interface SWGConversionApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGConversionApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Get list of conversions defined for the current job.
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: NSArray<SWGConversion>*
 */
-(NSNumber*) jobsJobIdConversionsGetWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(NSArray<SWGConversion>* output, NSError* error))completionBlock;
    


/**

 Adds a new conversion to the given job.
 

 @param body information for the conversion.
 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 

 return type: SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsPostWithCompletionBlock :(SWGConversion*) body 
     token:(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
    
    completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock;
    


/**

 Get list of conversions defined for the current job.
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param conversionId Identifier for the job conversion.
 

 return type: SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsConversionIdGetWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
     conversionId:(NSString*) conversionId 
    
    completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock;
    


/**

 Removes the conversion for a job.
 

 @param token Token for authentication.
 @param key Api key for the user to filter.
 @param jobId ID of job that needs to be fetched
 @param conversionId Identifier for the job conversion.
 

 return type: SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsConversionIdDeleteWithCompletionBlock :(NSString*) token 
     key:(NSString*) key 
     jobId:(NSString*) jobId 
     conversionId:(NSString*) conversionId 
    
    completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock;
    



@end
