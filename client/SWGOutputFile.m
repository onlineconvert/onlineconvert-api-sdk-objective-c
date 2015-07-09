#import "SWGOutputFile.h"

@implementation SWGOutputFile
  
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"source": @"source", @"uri": @"uri", @"filename": @"filename", @"size": @"size", @"created_at": @"createdAt" }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"uri", @"filename", @"size", @"createdAt"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

@end
