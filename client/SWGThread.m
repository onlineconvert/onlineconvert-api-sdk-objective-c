#import "SWGThread.h"

@implementation SWGThread
  
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"hash": @"hash", @"status": @"status", @"info": @"info", @"created_at": @"createdAt", @"modified_at": @"modifiedAt" }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"hash", @"status", @"info", @"createdAt", @"modifiedAt"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

@end
