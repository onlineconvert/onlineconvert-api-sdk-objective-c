#import "SWGInputApi.h"
#import "SWGFile.h"
#import "SWGQueryParamCollection.h"
#import "SWGError.h"
#import "SWGInputFile.h"


@interface SWGInputApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGInputApi

static NSString * basePath = @"http://api2.online-convert.com/";

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

+(SWGInputApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static SWGInputApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[SWGInputApi alloc] init];
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
 * Get list of binary source files for the conversion.hhh
 * Description of the get for the inputs of a specific job.
 * \param xOcToken Token for authentication for the current job
 * \param xOcApiKey Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns NSArray<SWGInputFile>*
 */
-(NSNumber*) jobsJobIdInputGetWithCompletionBlock: (NSString*) xOcToken
         xOcApiKey: (NSString*) xOcApiKey
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(NSArray<SWGInputFile>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdInputGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/input", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(xOcToken != nil)
        headerParams[@"X-Oc-Token"] = xOcToken;
    if(xOcApiKey != nil)
        headerParams[@"X-Oc-Api-Key"] = xOcApiKey;
    
    
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
                        
                        
                        SWGInputFile* d = [[SWGInputFile alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGInputFile>*)objs, nil);
                }
                
                
            }];
    


    

    
}

/*!
 * Cretes a new input for the current job.
 * 
 * \param body 
 * \param xOcToken Token for authentication for the current job
 * \param xOcApiKey Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputPostWithCompletionBlock: (SWGInputFile*) body
         xOcToken: (NSString*) xOcToken
         xOcApiKey: (NSString*) xOcApiKey
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdInputPost");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/input", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(xOcToken != nil)
        headerParams[@"X-Oc-Token"] = xOcToken;
    if(xOcApiKey != nil)
        headerParams[@"X-Oc-Api-Key"] = xOcApiKey;
    
    
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
                SWGInputFile* result = nil;
                if (data) {
                    result = [[SWGInputFile  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Get list of conversions defined for the current job.
 * 
 * \param xOcToken Token for authentication for the current job
 * \param xOcApiKey Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param fileId Id of the file to download
 * \returns SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputFileIdGetWithCompletionBlock: (NSString*) xOcToken
         xOcApiKey: (NSString*) xOcApiKey
         jobId: (NSString*) jobId
         fileId: (NSString*) fileId
        
        completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdInputFileIdGet");
    
    // verify the required parameter 'fileId' is set
    NSAssert(fileId != nil, @"Missing the required parameter `fileId` when calling jobsJobIdInputFileIdGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/input/{file_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"file_id", @"}"]] withString: [SWGApiClient escape:fileId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(xOcToken != nil)
        headerParams[@"X-Oc-Token"] = xOcToken;
    if(xOcApiKey != nil)
        headerParams[@"X-Oc-Api-Key"] = xOcApiKey;
    
    
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
                SWGInputFile* result = nil;
                if (data) {
                    result = [[SWGInputFile  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}

/*!
 * Removes the input for a job.
 * 
 * \param xOcToken Token for authentication for the current job
 * \param xOcApiKey Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param fileId Id of the file to download
 * \returns SWGInputFile*
 */
-(NSNumber*) jobsJobIdInputFileIdDeleteWithCompletionBlock: (NSString*) xOcToken
         xOcApiKey: (NSString*) xOcApiKey
         jobId: (NSString*) jobId
         fileId: (NSString*) fileId
        
        completionHandler: (void (^)(SWGInputFile* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdInputFileIdDelete");
    
    // verify the required parameter 'fileId' is set
    NSAssert(fileId != nil, @"Missing the required parameter `fileId` when calling jobsJobIdInputFileIdDelete");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/input/{file_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"file_id", @"}"]] withString: [SWGApiClient escape:fileId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    
    NSMutableDictionary* headerParams = [NSMutableDictionary dictionaryWithDictionary:self.defaultHeaders];

    if(xOcToken != nil)
        headerParams[@"X-Oc-Token"] = xOcToken;
    if(xOcApiKey != nil)
        headerParams[@"X-Oc-Api-Key"] = xOcApiKey;
    
    
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
                SWGInputFile* result = nil;
                if (data) {
                    result = [[SWGInputFile  alloc]  initWithDictionary:data error:nil];
                }
                completionBlock(result , nil);
                
              }];
    

    

    
}



@end



