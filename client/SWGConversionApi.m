#import "SWGConversionApi.h"
#import "SWGFile.h"
#import "SWGQueryParamCollection.h"
#import "SWGError.h"
#import "SWGConversion.h"


@interface SWGConversionApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGConversionApi

static NSString * basePath = @"http://api2.online-convert.com";

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

+(SWGConversionApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static SWGConversionApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[SWGConversionApi alloc] init];
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
 * Get list of conversions defined for the current job.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns NSArray<SWGConversion>*
 */
-(NSNumber*) jobsJobIdConversionsGetWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(NSArray<SWGConversion>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdConversionsGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/conversions", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    if(key != nil)
        headerParams[@"key"] = key;
    
    
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
                        
                        
                        SWGConversion* d = [[SWGConversion alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGConversion>*)objs, nil);
                }
                
                
            }];
    


    

    
}

/*!
 * Adds a new conversion to the given job.
 * 
 * \param body information for the conversion.
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsPostWithCompletionBlock: (SWGConversion*) body
         token: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'body' is set
    NSAssert(body != nil, @"Missing the required parameter `body` when calling jobsJobIdConversionsPost");
    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdConversionsPost");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/conversions", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    if(key != nil)
        headerParams[@"key"] = key;
    
    
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
                SWGConversion* result = nil;
                if (data) {
                    result = [[SWGConversion  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Get list of conversions defined for the current job.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param conversionId Identifier for the job conversion.
 * \returns SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsConversionIdGetWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
         conversionId: (NSString*) conversionId
        
        completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdConversionsConversionIdGet");
    
    // verify the required parameter 'conversionId' is set
    NSAssert(conversionId != nil, @"Missing the required parameter `conversionId` when calling jobsJobIdConversionsConversionIdGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/conversions/{conversion_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"conversion_id", @"}"]] withString: [SWGApiClient escape:conversionId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    if(key != nil)
        headerParams[@"key"] = key;
    
    
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
                SWGConversion* result = nil;
                if (data) {
                    result = [[SWGConversion  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Removes the conversion for a job.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param conversionId Identifier for the job conversion.
 * \returns SWGConversion*
 */
-(NSNumber*) jobsJobIdConversionsConversionIdDeleteWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
         conversionId: (NSString*) conversionId
        
        completionHandler: (void (^)(SWGConversion* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdConversionsConversionIdDelete");
    
    // verify the required parameter 'conversionId' is set
    NSAssert(conversionId != nil, @"Missing the required parameter `conversionId` when calling jobsJobIdConversionsConversionIdDelete");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/conversions/{conversion_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"conversion_id", @"}"]] withString: [SWGApiClient escape:conversionId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(token != nil)
        headerParams[@"token"] = token;
    if(key != nil)
        headerParams[@"key"] = key;
    
    
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
                SWGConversion* result = nil;
                if (data) {
                    result = [[SWGConversion  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}



@end



