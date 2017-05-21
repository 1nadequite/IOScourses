#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface ModOperation : NSObject <BinaryOperations>

@end

@implementation ModOperation

- (double)executeLeft:(double)left
                Right:(double)right {
    return fmodf(left, right);
}

@end
