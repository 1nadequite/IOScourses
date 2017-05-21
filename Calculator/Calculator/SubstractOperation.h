#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface SubstractOperation : NSObject <BinaryOperations>

@end

@implementation SubstractOperation

- (double)executeLeft:(double)left
                Right:(double)right {
    return left - right;
}

@end
