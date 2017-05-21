#import "CalculatorModel.h"
#import "UnaryOperations.h"
#import "BinaryOperations.h"
#import "AdditionOperation.h"
#import "SubstractOperation.h"
#import "DivideOperation.h"
#import "MultiplyOperation.h"
#import "ModOperation.h"
#import "SquareRootOperation.h"
#import "ChangeSignOperation.h"
#import "GetValueOperation.h"

@implementation CalculatorModel

#pragma mark - constructor

- (id)init {
    if (self = [super init]) {
        self.unaryOperations = @{
                         @"sqrt": [[SquareRootOperation alloc] init],
                         @"+/-": [[ChangeSignOperation alloc] init]
                         };
        self.binaryOperations = @{
                         @"+": [[AdditionOperation alloc] init],
                         @"-": [[SubstractOperation alloc] init],
                         @"/": [[DivideOperation alloc] init],
                         @"x": [[MultiplyOperation alloc] init],
                         @"%": [[ModOperation alloc] init],
                         @"=": [[GetValueOperation alloc] init]
                         };
    }
    return self;
}

#pragma mark - execute unary operations

- (double)executeUnaryOperand:(double)operand
                    Operation:(NSString *)operation {
    id<UnaryOperations> operationType = _unaryOperations[operation];
    if ([operationType respondsToSelector:@selector(executeOperand:)]) {
        return [operationType executeOperand:operand];
    }
    return 0;
}

#pragma mark - execute binary operations

- (double)executeBinaryLeftOperand:(double)leftOperand
                         Operation:(NSString *)operation
                      RightOperand:(double)rightOperand {
    id<BinaryOperations> operationType = _binaryOperations[operation];
    if ([operationType respondsToSelector:@selector(executeLeft:Right:)]) {
        return [operationType executeLeft:leftOperand Right:rightOperand];
    }
    return 0;
}

- (void)dealloc {
    [_unaryOperations release];
    [_binaryOperations release];
    [super dealloc];
}

@end
