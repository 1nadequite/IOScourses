#import <Foundation/Foundation.h>
#import "UnaryOperations.h"

@interface ChangeSignOperation : NSObject <UnaryOperations>

@end

@implementation ChangeSignOperation

- (double)executeOperand:(double)operand{
    return (operand == 0) ? 0 : -1 * operand;
}

@end
