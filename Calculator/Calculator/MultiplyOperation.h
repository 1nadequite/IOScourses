#import <Foundation/Foundation.h>
#import "BinaryOperations.h"

@interface MultiplyOperation : NSObject <BinaryOperations>

@end

@implementation MultiplyOperation

- (double)executeLeft:(double)left
                Right:(double)right {
    return left * right;
}

@end
