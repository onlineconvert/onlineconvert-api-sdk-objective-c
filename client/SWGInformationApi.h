#import <Foundation/Foundation.h>
#import "SWGConversion.h"
#import "SWGStatus.h"
#import "SWGObject.h"
#import "SWGApiClient.h"


@interface SWGInformationApi: NSObject

@property(nonatomic, assign)SWGApiClient *apiClient;

-(instancetype) initWithApiClient:(SWGApiClient *)apiClient;
-(void) addHeader:(NSString*)value forKey:(NSString*)key;
-(unsigned long) requestQueueSize;
+(SWGInformationApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key;
+(void) setBasePath:(NSString*)basePath;
+(NSString*) getBasePath;
/**

 Get a list of the valid conversions.
 Gets a list of the valid conversions that can be made with the API. For each conversion is also shown the available options for that specific type of conversion.\n\nThis conversions can be added to a Job through the specific endpoint or in the information given to create the new Job.\n

 @param category Category for the conversion.
 @param target Target for for the conversion.
 @param page Pagination for list of elements.
 

 return type: NSArray<SWGConversion>*
 */
-(NSNumber*) conversionsGetWithCompletionBlock :(NSString*) category 
     target:(NSString*) target 
     page:(NSNumber*) page 
    
    completionHandler: (void (^)(NSArray<SWGConversion>* output, NSError* error))completionBlock;
    


/**

 Get a list of the valid statuses.
 The endpoint provide a list of all available status that the Job may have during the process as a description of the status.

 

 return type: NSArray<SWGStatus>*
 */
-(NSNumber*) statusesGetWithCompletionBlock :
    (void (^)(NSArray<SWGStatus>* output, NSError* error))completionBlock;
    



@end
