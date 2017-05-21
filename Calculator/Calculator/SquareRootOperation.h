#import <Foundation/Foundation.h>
#import "UnaryOperations.h"

@interface SquareRootOperation : NSObject <UnaryOperations>

@end

@implementation SquareRootOperation

- (double)executeOperand:(double)operand{
    return sqrt(operand);
}

@end
