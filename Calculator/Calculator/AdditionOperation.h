#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface AdditionOperation : NSObject <BinaryOperations>

@end

@implementation AdditionOperation

- (double)executeLeft:(double)left
               Right:(double)right {
    return left + right;
}

@end
