#import "CalculatorModel.h"

@interface CalculatorModel (UnaryOperations)

@end

@implementation CalculatorModel (UnaryOperations)


- (void)squareRootOperation {
    if ((self.isExpression ? self.rightOperand : self.leftOperand) < 0) {
        [self.delegate calculatorModelDidWrongOperation:ERROR_NOT_A_NUMBER];
        return;
    }
    if (self.isExpression) {
        self.rightOperand = sqrt(self.rightOperand);
    } else {
        self.leftOperand = sqrt(self.leftOperand);
    }
}

- (void)changeSignOperation {
    if (self.isExpression) {
        self.rightOperand *= -1;
    } else {
        self.leftOperand *= -1;
    }
}

- (void)clearOperation {
    self.leftOperand = 0;
    self.rightOperand = 0;
    self.prevOperation = ADD_OPERATION;
    self.expression = YES;
}

@end
