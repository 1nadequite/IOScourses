#import "CalculatorModel.h"
#import "UnaryOperations.m"
#import "BinaryOperations.m"

@interface CalculatorModel ()

@property (retain, nonatomic) NSDictionary *unaryOperations;
@property (retain, nonatomic) NSDictionary *binaryOperations;

@end

@implementation CalculatorModel

@synthesize unaryOperations = _unaryOperations;
@synthesize binaryOperations = _binaryOperations;

#pragma mark - constructor-methods

- (instancetype)init {
    if (self = [super init]) {
        // так и не разобрался почему через _unaryOperation не работает
        self.unaryOperations = @{
                         @"√": @"squareRootOperation",
                         @"+/-": @"changeSignOperation",
                         @"C": @"clearOperation"
                         };
        self.binaryOperations = @{
                         @"+": @"additionOperation",
                         @"-": @"substractOperation",
                         @"/": @"divideOperation",
                         @"x": @"multiplyOperation",
                         @"%": @"modOperation",
                         @"=": @"getValueOperation",
                         };
        _prevOperation = ADD_OPERATION;
        _expression = YES;
    }
    return self;
}

#pragma mark - execute unary operations

- (void)executeUnaryOperation:(NSString *)operation {
    if (!self.unaryOperations[operation]) return;
    [self executeOperation:self.unaryOperations[operation]];
}

#pragma mark - execute binary operations

- (void)executeBinaryOperation:(NSString *)operation {
    if (!self.binaryOperations[operation]) return;
    if ([operation isEqualToString:EQUAL_OPERATION] || self.isExpression) {
        [self executeOperation:self.binaryOperations[self.prevOperation]];
        if (![operation isEqualToString:EQUAL_OPERATION]) self.prevOperation = operation;
        self.expression = NO;
    } else {
        self.prevOperation = operation;
    }
}

#pragma mark - operations factory

- (void)executeOperation:(NSString *)operation {
    SEL operationSelector = NSSelectorFromString(operation);
    [self performSelector:operationSelector];
}

#pragma mark - setters with delegate

- (void)setLeftOperand:(double)leftOperand {
    _leftOperand = leftOperand;
    [self.delegate calculatorModelDidUpdatedValue:self.leftOperand];
}

- (void)setRightOperand:(double)rightOperand {
    _rightOperand = rightOperand;
    [self.delegate calculatorModelDidUpdatedValue:self.rightOperand];
}

- (void)dealloc {
    [_unaryOperations release];
    [_binaryOperations release];
    [_prevOperation release];
    [super dealloc];
}

@end
