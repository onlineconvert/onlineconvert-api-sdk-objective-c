#import <Foundation/Foundation.h>
#import "SWGObject.h"


@protocol SWGError
@end
  
@interface SWGError : SWGObject


@property(nonatomic) NSNumber* code;

@property(nonatomic) NSString* message;

@property(nonatomic) NSObject* errors;

@end
