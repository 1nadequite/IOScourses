#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface GetValueOperation : NSObject <BinaryOperations>

@end

@implementation GetValueOperation

- (double)executeLeft:(double)left
                Right:(double)right {
    return left;
}

@end
