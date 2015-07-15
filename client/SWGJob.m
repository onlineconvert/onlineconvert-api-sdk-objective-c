#import "SWGJob.h"

@implementation SWGJob
  
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"token": @"token", @"type": @"type", @"status": @"status", @"process": @"process", @"conversion": @"conversion", @"input": @"input", @"callback": @"callback", @"server": @"server", @"created_at": @"createdAt", @"modified_at": @"modifiedAt" }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"token", @"status", @"process", @"conversion", @"input", @"callback", @"server", @"createdAt", @"modifiedAt"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

@end
