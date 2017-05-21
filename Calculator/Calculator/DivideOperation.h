#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface DivideOperation : NSObject <BinaryOperations>

@end

@implementation DivideOperation

- (double)executeLeft:(double)left
                Right:(double)right {
    return left / right;
}

@end
