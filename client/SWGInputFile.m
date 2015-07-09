#import "SWGInputFile.h"

@implementation SWGInputFile
  
+ (JSONKeyMapper *)keyMapper
{
  return [[JSONKeyMapper alloc] initWithDictionary:@{ @"id": @"_id", @"type": @"type", @"source": @"source", @"filename": @"filename", @"size": @"size", @"created_at": @"createdAt", @"modified_at": @"modifiedAt" }];
}

+ (BOOL)propertyIsOptional:(NSString *)propertyName
{
  NSArray *optionalProperties = @[@"_id", @"type", @"filename", @"size", @"createdAt", @"modifiedAt"];

  if ([optionalProperties containsObject:propertyName]) {
    return YES;
  }
  else {
    return NO;
  }
}

@end
