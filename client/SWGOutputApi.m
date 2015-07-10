#import "SWGOutputApi.h"
#import "SWGFile.h"
#import "SWGQueryParamCollection.h"
#import "SWGError.h"
#import "SWGOutputFile.h"


@interface SWGOutputApi ()
    @property (readwrite, nonatomic, strong) NSMutableDictionary *defaultHeaders;
@end

@implementation SWGOutputApi

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

+(SWGOutputApi*) apiWithHeader:(NSString*)headerValue key:(NSString*)key {
    static SWGOutputApi* singletonAPI = nil;

    if (singletonAPI == nil) {
        singletonAPI = [[SWGOutputApi alloc] init];
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
 * Get list of converted.
 * 
 * \param conversionId 
 * \param inputId 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \returns NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputGetWithCompletionBlock: (NSString*) conversionId
         inputId: (NSString*) inputId
         token: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
        
        completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdOutputGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/output", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    

    NSMutableDictionary* queryParams = [[NSMutableDictionary alloc] init];
    if(conversionId != nil) {
        
        queryParams[@"conversion_id"] = conversionId;
    }
    if(inputId != nil) {
        
        queryParams[@"input_id"] = inputId;
    }
    
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
                        
                        
                        SWGOutputFile* d = [[SWGOutputFile alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGOutputFile>*)objs, nil);
                }
                
                
            }];
    


    

    
}

/*!
 * Get information about an output file source.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param fileId Id of the file to download
 * \returns NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputFileIdGetWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
         fileId: (NSString*) fileId
        
        completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdOutputFileIdGet");
    
    // verify the required parameter 'fileId' is set
    NSAssert(fileId != nil, @"Missing the required parameter `fileId` when calling jobsJobIdOutputFileIdGet");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/output/{file_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"file_id", @"}"]] withString: [SWGApiClient escape:fileId]];
    

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
                        
                        
                        SWGOutputFile* d = [[SWGOutputFile alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGOutputFile>*)objs, nil);
                }
                
                
            }];
    


    

    
}

/*!
 * Deletes a file from the output.
 * 
 * \param token Token for authentication.
 * \param key Api key for the user to filter.
 * \param jobId ID of job that needs to be fetched
 * \param fileId Id of the file to download
 * \returns NSArray<SWGOutputFile>*
 */
-(NSNumber*) jobsJobIdOutputFileIdDeleteWithCompletionBlock: (NSString*) token
         key: (NSString*) key
         jobId: (NSString*) jobId
         fileId: (NSString*) fileId
        
        completionHandler: (void (^)(NSArray<SWGOutputFile>* output, NSError* error))completionBlock
         {

    
    // verify the required parameter 'jobId' is set
    NSAssert(jobId != nil, @"Missing the required parameter `jobId` when calling jobsJobIdOutputFileIdDelete");
    
    // verify the required parameter 'fileId' is set
    NSAssert(fileId != nil, @"Missing the required parameter `fileId` when calling jobsJobIdOutputFileIdDelete");
    

    NSMutableString* requestUrl = [NSMutableString stringWithFormat:@"%@/jobs/{job_id}/output/{file_id}", basePath];

    // remove format in URL if needed
    if ([requestUrl rangeOfString:@".{format}"].location != NSNotFound)
        [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:@".{format}"] withString:@".json"];

    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"job_id", @"}"]] withString: [SWGApiClient escape:jobId]];
    [requestUrl replaceCharactersInRange: [requestUrl rangeOfString:[NSString stringWithFormat:@"%@%@%@", @"{", @"file_id", @"}"]] withString: [SWGApiClient escape:fileId]];
    

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
                
                if([data isKindOfClass:[NSArray class]]){
                    NSMutableArray * objs = [[NSMutableArray alloc] initWithCapacity:[data count]];
                    for (NSDictionary* dict in (NSArray*)data) {
                        
                        
                        SWGOutputFile* d = [[SWGOutputFile alloc] initWithDictionary:dict error:nil];
                        
                        [objs addObject:d];
                    }
                    completionBlock((NSArray<SWGOutputFile>*)objs, nil);
                }
                
                
            }];
    


    

    
}



@end



