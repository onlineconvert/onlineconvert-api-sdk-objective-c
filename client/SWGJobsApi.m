#import "SWGJobsApi.h"
#import "SWGFile.h"
#import "SWGQueryParamCollection.h"
#import "SWGJob.h"
#import "SWGError.h"
#import "SWGThread.h"


@interface SWGJobsApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGJobsApi

static NSString * basePath = @"http://api2.akokine.de";

#pragma mark - Initialize methods

- (id) init {
    self = [super init];
    if (self) {
        self.apiClient = [SWGApiClient sharedClientFromPool:basePath];
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

- (id) initWithApiClient:(SWGApiClient *)apiClient {
    self = [super init];
    if (self) {
        if (apiClient) {
            self.apiClient = apiClient;
        }
        else {
            self.apiClient = [SWGApiClient sharedClientFromPool:basePath];
        }
        self.defaultHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

#pragma mark -

+(SWGJobsApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static SWGJobsApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[SWGJobsApi alloc] init];
        [singletonAPI addHeader:headerValue forKey:key];
    }
    return singletonAPI;
}

+(void) setBasePath:(NSString*)path {
    basePath = path;
}

+(NSString*) getBasePath {
    return basePath;
}

-(void) addHeader:(NSString*)value forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(void) setHeaderValue:(NSString*) value
           forKey:(NSString*)key {
    [self.defaultHeaders setValue:value forKey:key];
}

-(unsigned long) requestQueueSize {
    return [SWGApiClient requestQueueSize];
}


/*!
 * List of jobs active for the current user identified by the key.
 * It will return the list of jobs for the given user. In order to get the jobs a key or token must be provided:\n  - If the user key is provided all jobs for the current will be return.\n  - If one token is provided it will return the job assigned to that token if any.\n  \nThe request is paginated with an amount of 50 elements per page in any case.\n
 * \param status Filter the status of the job.
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param page Pagination for list of elements.
 * \returns NSArray<SWGJob>*
 */
-(NSNumber*) jobsGetWithCompletionBlock: (NSString*) status
         token: (NSString*) token
         key: (NSString*) key
         page: (NSNumber*) page
        
        completionHandler: (void (^)(NSArray<SWGJob>* output, NSError* error))completionBlock
         {

    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(status != nil) {
        
        queryParams[@"status"] = status;
    }
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    if(page != nil) {
        
        queryParams[@"page"] = page;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init];

    
    

    

    
    // response is in a container
        // array container response type
    return [self.apiClient dictionary: requestUrl 
                       method: @"GET" 
                  queryParams: queryParams 
                         body: bodyDictionary 
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    return;
                }
                
                if([data isKindOfClass:[NSArray class]]){
                    NSMutableArray * objs = [[NSMutableArray alloc] initWithCapacity:[data count]];
                    for (NSDictionary* dict in (NSArray*)data) {
                        
                        
                        SWGJob* d = [[SWGJob alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGJob>*)objs, nil);
                }
                
                
            }];
    


    

    
}

/*!
 * Creates a new Job with the user key.
 * 
 * \param key Api key for the user to filter.
 * \param body Content of the job.
 * \returns SWGJob*
 */
-(NSNumber*) jobsPostWithCompletionBlock: (NSString*) key
         body: (SWGJob*) body
        
        completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'key' is set
    NSAssert(key != nil, @"Missing the required parameter `key` when calling jobsPost");
    
    // verify the required parameter 'body' is set
    NSAssert(body != nil, @"Missing the required parameter `body` when calling jobsPost");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    id __body = body;

    if(__body != nil && [__body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)__body) {
            if([dict respondsToSelector:@selector(toDictionary)]) {
                [objs addObject:[(SWGObject*)dict toDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([__body respondsToSelector:@selector(toDictionary)]) {
        bodyDictionary = [(SWGObject*)__body toDictionary];
    }
    else if([__body isKindOfClass:[NSString class]]) {
        // convert it to a dictionary
        NSError * error;
        NSString * str = (NSString*)__body;
        NSDictionary *JSON =
            [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding: NSUTF8StringEncoding]
                                            options: NSJSONReadingMutableContainers
                                              error: &error];
        bodyDictionary = JSON;
    }
    
    

    

    

    
    // non container response

    

    
    // complex response
        
    // comples response type
    return [self.apiClient dictionary: requestUrl
                       method: @"POST"
                  queryParams: queryParams
                         body: bodyDictionary
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    
                    return;
                }
                SWGJob* result = nil;
                if (data) {
                    result = [[SWGJob  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Get information about a Job
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns SWGJob*
 */
-(NSNumber*) jobsJobIdGetWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init];

    
    

    

    

    
    // non container response

    

    
    // complex response
        
    // comples response type
    return [self.apiClient dictionary: requestUrl
                       method: @"GET"
                  queryParams: queryParams
                         body: bodyDictionary
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    
                    return;
                }
                SWGJob* result = nil;
                if (data) {
                    result = [[SWGJob  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Cancels a job created that haven't been started. (Allow to cancel jobs in process.)
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns SWGJob*
 */
-(NSNumber*) jobsJobIdDeleteWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdDelete");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init];

    
    

    

    

    
    // non container response

    

    
    // complex response
        
    // comples response type
    return [self.apiClient dictionary: requestUrl
                       method: @"DELETE"
                  queryParams: queryParams
                         body: bodyDictionary
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    
                    return;
                }
                SWGJob* result = nil;
                if (data) {
                    result = [[SWGJob  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Modifies the job identified by the id, allows to start a created job.
 * 
 * \param body Content of the job.
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns SWGJob*
 */
-(NSNumber*) jobsJobIdPatchWithCompletionBlock: (SWGJob*) body
         token: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(SWGJob* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'body' is set
    NSAssert(body != nil, @"Missing the required parameter `body` when calling jobsJobIdPatch");
    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdPatch");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    id __body = body;

    if(__body != nil && [__body isKindOfClass:[NSArray class]]){
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        for (id dict in (NSArray*)__body) {
            if([dict respondsToSelector:@selector(toDictionary)]) {
                [objs addObject:[(SWGObject*)dict toDictionary]];
            }
            else{
                [objs addObject:dict];
            }
        }
        bodyDictionary = objs;
    }
    else if([__body respondsToSelector:@selector(toDictionary)]) {
        bodyDictionary = [(SWGObject*)__body toDictionary];
    }
    else if([__body isKindOfClass:[NSString class]]) {
        // convert it to a dictionary
        NSError * error;
        NSString * str = (NSString*)__body;
        NSDictionary *JSON =
            [NSJSONSerialization JSONObjectWithData: [str dataUsingEncoding: NSUTF8StringEncoding]
                                            options: NSJSONReadingMutableContainers
                                              error: &error];
        bodyDictionary = JSON;
    }
    
    

    

    

    
    // non container response

    

    
    // complex response
        
    // comples response type
    return [self.apiClient dictionary: requestUrl
                       method: @"PATCH"
                  queryParams: queryParams
                         body: bodyDictionary
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    
                    return;
                }
                SWGJob* result = nil;
                if (data) {
                    result = [[SWGJob  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Get list of threads defined for the current job.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns NSArray<SWGThread>*
 */
-(NSNumber*) jobsJobIdThreadsGetWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(NSArray<SWGThread>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdThreadsGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/threads", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(key != nil) {
        
        queryParams[@"key"] = key;
    }
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    
    
    // HTTP header `Accept` 
    headerParams[@"Accept"] = [SWGApiClient selectHeaderAccept:@[]];
    if ([headerParams[@"Accept"] length] == 0) {
        [headerParams removeObjectForKey:@"Accept"];
    }

    // response content type
    NSString *responseContentType;
    if ([headerParams objectForKey:@"Accept"]) {
        responseContentType = [headerParams[@"Accept"] componentsSeparatedByString:@", "][0];
    }
    else {
        responseContentType = @"";
    }

    // request content type
    NSString *requestContentType = [SWGApiClient selectHeaderContentType:@[]];

    // Authentication setting
    NSArray *authSettings = @[];
    
    id bodyDictionary = nil;
    
    

    NSMutableDictionary * formParams = [[NSMutableDictionary alloc]init];

    
    

    

    
    // response is in a container
        // array container response type
    return [self.apiClient dictionary: requestUrl 
                       method: @"GET" 
                  queryParams: queryParams 
                         body: bodyDictionary 
                 headerParams: headerParams
                 authSettings: authSettings
           requestContentType: requestContentType
          responseContentType: responseContentType
              completionBlock: ^(NSDictionary *data, NSError *error) {
                if (error) {
                    completionBlock(nil, error);
                    return;
                }
                
                if([data isKindOfClass:[NSArray class]]){
                    NSMutableArray * objs = [[NSMutableArray alloc] initWithCapacity:[data count]];
                    for (NSDictionary* dict in (NSArray*)data) {
                        
                        
                        SWGThread* d = [[SWGThread alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGThread>*)objs, nil);
                }
                
                
            }];
    


    

    
}



@end



